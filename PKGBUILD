# Maintainer: neycrol <330578697@qq.com>
pkgbase=glibc-git-native-pgo
pkgname=(glibc-git-native-pgo lib32-glibc-git-native-pgo glibc-locales-git-native-pgo)
pkgver=2.42.9000.r635.g9da0585852
pkgrel=1
pkgdesc="GNU C Library (Git Master) - Native Optimized with Selective PGO (Built for Performance)"
arch=(x86_64)
url='https://www.gnu.org/software/libc'
license=(GPL-2.0-or-later LGPL-2.1-or-later)
makedepends=(git gd lib32-gcc-libs python)
# 核心禁忌：关 LTO，关 Debug，关 Strip
options=(staticlibs !lto !debug !strip)
# === 核心修改：定义上游源地址 ===
_arch_upstream="https://gitlab.archlinux.org/archlinux/packaging/packages/glibc/-/raw/main"

source=(
  "git+https://sourceware.org/git/glibc.git"
  # 数据文件：直接从上游拉取，保证最新
  "locale.gen.txt::${_arch_upstream}/locale.gen.txt"
  "locale-gen::${_arch_upstream}/locale-gen"
  "lib32-glibc.conf::${_arch_upstream}/lib32-glibc.conf"
  "sdt.h::${_arch_upstream}/sdt.h"
  "sdt-config.h::${_arch_upstream}/sdt-config.h"

  # 结构文件：必须保留在本地，否则 makepkg 启动会报错
  "glibc.install"
  "lib32-glibc.install"
)

# 全部设为 SKIP，让它永远信任下载下来的新文件
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')


provides=('glibc' 'libglibc')
conflicts=('glibc' 'glibc-git')

pkgver() {
  cd glibc
  git describe --long --tags | sed 's/^glibc-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p glibc-build-pgo lib32-glibc-build
}

build() {
  # === 1. 物理极限参数 ===
  local _phys_cflags="-march=native -mtune=native -O3 -pipe -fno-plt -fexceptions \
        -Wformat -Werror=format-security \
        -fstack-clash-protection -fcf-protection \
        -fno-semantic-interposition -mno-vzeroupper \
        -Wno-error=inline -Wno-error=attributes"
  
  export CFLAGS="${_phys_cflags}"
  export CXXFLAGS="${_phys_cflags}"
  
  # 强制 BFD 链接器
  export LDFLAGS="-Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now -fuse-ld=bfd"
  export CPPFLAGS=""

  # === 2. 制作智能白名单 Wrapper (核心) ===
  # 写入 srcdir (构建目录)，不污染源码目录
  cat << 'EOF' > "$srcdir/gcc-wrapper"
#!/bin/bash
ARGS=("$@")
ENABLE_PGO=0
# PGO 白名单
WHITELIST=("malloc" "string" "math" "stdlib" "stdio-common" "wcsmbs" "time" "io" "nptl")

for ((i=0; i<${#ARGS[@]}; i++)); do
    if [[ "${ARGS[i]}" == "-c" ]]; then
        SOURCE_FILE="${ARGS[i+1]}"
        for dir in "${WHITELIST[@]}"; do
            if [[ "$SOURCE_FILE" == *"/$dir/"* ]]; then
                ENABLE_PGO=1
                break 2
            fi
        done
    fi
done

# 双重保险：排除 rtld
for arg in "${ARGS[@]}"; do
    if [[ "$arg" == *"-DIS_IN_rtld"* ]]; then
        ENABLE_PGO=0
        break
    fi
done

PGO_MODE="${GLIBC_PGO_MODE:-}"
if [ "$ENABLE_PGO" -eq 1 ] && [ -n "$PGO_MODE" ]; then
    exec /usr/bin/gcc "$PGO_MODE" "${ARGS[@]}"
else
    exec /usr/bin/gcc "${ARGS[@]}"
fi
EOF
  chmod +x "$srcdir/gcc-wrapper"
  cp "$srcdir/gcc-wrapper" "$srcdir/g++-wrapper"
  sed -i 's|/usr/bin/gcc|/usr/bin/g++|g' "$srcdir/g++-wrapper"
  export PATH="$srcdir:$PATH"

  local _configure_flags=(
      --prefix=/usr
      --with-headers=/usr/include
      --enable-bind-now
      --disable-fortify-source
      --enable-kernel=5.15
      --enable-multi-arch
      --enable-stack-protector=strong
      --enable-systemtap
      --disable-nscd
      --disable-profile
      --disable-werror
  )

  # =================================================================
  # 64-bit 构建 (PGO + CET + SFrame)
  # =================================================================
  (
    cd glibc-build-pgo
    echo "slibdir=/usr/lib" > configparms
    echo "rtlddir=/usr/lib" >> configparms
    echo "sbindir=/usr/bin" >> configparms
    echo "rootsbindir=/usr/bin" >> configparms

    # Stage 1: Instrumentation
    msg2 "🚀 [64-bit] Starting PGO Stage 1..."
    export GLIBC_PGO_MODE="-fprofile-generate"
    
    "${srcdir}"/glibc/configure \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --enable-cet \
        --enable-sframe \
        "${_configure_flags[@]}"

    make -j$(nproc)

    # Stage 2: Training
    msg2 "🏋️‍♂️ [64-bit] Training..."
    make -j$(nproc) iconv/tests || true
    make -j$(nproc) string/tests || true
    make -j$(nproc) malloc/tests || true
    make -j$(nproc) math/tests || true

    # Stage 3: Optimization
    msg2 "🔥 [64-bit] Final Optimization..."
    find . -name "*.o" -type f -delete
    find . -name "*.so" -type f -delete
    
    export GLIBC_PGO_MODE="-fprofile-use -fprofile-correction"
    
    "${srcdir}"/glibc/configure \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --enable-cet \
        --enable-sframe \
        "${_configure_flags[@]}"

    make -j$(nproc)
    make info
  )

  # =================================================================
  # 32-bit 构建 (兼容模式)
  # =================================================================
  (
    cd lib32-glibc-build
    unset GLIBC_PGO_MODE
    export CC="/usr/bin/gcc -m32 -mstackrealign"
    export CXX="/usr/bin/g++ -m32 -mstackrealign"
    export LD="ld.bfd"
    export CFLAGS="${_phys_cflags}"
    export CXXFLAGS="${_phys_cflags}"
    export LDFLAGS="-Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now -fuse-ld=bfd"
    
    echo "slibdir=/usr/lib32" > configparms
    echo "rtlddir=/usr/lib32" >> configparms
    echo "sbindir=/usr/bin" >> configparms
    echo "rootsbindir=/usr/bin" >> configparms

    msg2 "⚙️ [32-bit] Building..."
    "${srcdir}"/glibc/configure \
        --host=i686-pc-linux-gnu \
        --libdir=/usr/lib32 \
        --libexecdir=/usr/lib32 \
        --disable-cet \
        --disable-sframe \
        "${_configure_flags[@]}"

    make -j$(nproc)
  )

  make -C "${srcdir}"/glibc/localedata objdir="${srcdir}"/glibc-build-pgo \
    DESTDIR="${srcdir}"/locales install-locale-files
}

package_glibc-git-native-pgo() {
  pkgdesc='GNU C Library (Git Master) - Native Optimized PGO'
  depends=('linux-api-headers>=4.10' tzdata filesystem)
  optdepends=('gd: for memusagestat' 'perl: for mtrace')
  install=glibc.install
  backup=(etc/gai.conf etc/locale.gen)
  provides=('glibc' 'libglibc')
  conflicts=('glibc')

  make -C glibc-build-pgo DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}"/etc/ld.so.cache
  rm -f "${pkgdir}"/usr/bin/{tzselect,zdump,zic}

  cd glibc
  install -dm755 "${pkgdir}"/usr/lib/locale
  install -m644 posix/gai.conf "${pkgdir}"/etc/gai.conf
  install -m755 "${srcdir}"/locale-gen "${pkgdir}"/usr/bin
  install -m644 "${srcdir}"/locale.gen.txt "${pkgdir}"/etc/locale.gen
  sed -e '1,3d' -e 's|/| |g' -e 's|\\| |g' -e 's|^|#|g' localedata/SUPPORTED >> "${pkgdir}"/etc/locale.gen
  sed -e '1,3d' -e 's|/| |g' -e 's| \\||g' localedata/SUPPORTED > "${pkgdir}"/usr/share/i18n/SUPPORTED
  install -dm755 "${pkgdir}"/usr/lib/locale
  cp -r "${srcdir}"/locales/usr/lib/locale/C.utf8 -t "${pkgdir}"/usr/lib/locale
  sed -i '/#C\.UTF-8 /d' "${pkgdir}"/etc/locale.gen
  install -Dm644 "${srcdir}"/sdt.h "${pkgdir}"/usr/include/sys/sdt.h
  install -Dm644 "${srcdir}"/sdt-config.h "${pkgdir}"/usr/include/sys/sdt-config.h
}

package_lib32-glibc-git-native-pgo() {
  pkgdesc='GNU C Library (32-bit, Git Master) - Native Optimized'
  depends=("glibc-git-native-pgo=$pkgver")
  provides=('lib32-glibc')
  conflicts=('lib32-glibc')
  options+=('!emptydirs')
  install=lib32-glibc.install

  cd lib32-glibc-build
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,sbin,usr/{bin,sbin,share},var}
  find "${pkgdir}"/usr/include -type f -not -name '*-32.h' -delete
  install -d "${pkgdir}"/usr/lib
  ln -s ../lib32/ld-linux.so.2 "${pkgdir}"/usr/lib/
  install -Dm644 "${srcdir}"/lib32-glibc.conf "${pkgdir}"/etc/ld.so.conf.d/lib32-glibc.conf
  ln -s ../lib/locale "${pkgdir}"/usr/lib32/locale
}

package_glibc-locales-git-native-pgo() {
  pkgdesc='Pregenerated locales for GNU C Library'
  depends=("glibc-git-native-pgo=$pkgver")
  provides=('glibc-locales')
  conflicts=('glibc-locales')

  cp -r locales/* -t "${pkgdir}"
  rm -r "${pkgdir}"/usr/lib/locale/C.utf8
  hardlink -c "${pkgdir}"/usr/lib/locale
}
