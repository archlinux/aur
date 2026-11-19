# $Id$
# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>
# Contributor: Morgan <morganamilo@archlinux.org>

#_ver_pacman_static=7.1.0.r9.g54d9411-18

_commit=7a8a0b9e3666d620a774907706a609288d33d73b

pkgname=paru-static
_pkgname=paru
pkgver=2.2.1
pkgrel=1
pkgdesc='Feature packed AUR helper'
url='https://github.com/Morganamilo/paru'
source=(git+https://github.com/Morganamilo/paru.git?commit=$_commit
        # Pacman Static
        #git+https://aur.archlinux.org/pacman-static.git
)
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
license=('GPL-3.0-or-later')
makedepends=('rustup' 'musl' 'meson' 'kernel-headers-musl' 'lld' 'binutils' 'git' 'cmake' 'publicsuffix-list' 'gtk-doc' 'libxslt')
depends=('pacman-static>=7.1')
#depends=('git>=2.40' 'pacman>=7.1' 'libalpm.so' 'libssl.so' 'libcrypto.so')
#conflicts=('paru')
#replaces=('paru')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
sha256sums=('SKIP')
#options=('!lto')
#options=('lto')

# Use musl toolchain
export LOCAL_CC=$CC
export CC=musl-gcc
#export CXX=musl-g++  # For libs with C++ code (e.g., libxml2, krb5)
export LDFLAGS="-static $LDFLAGS"

# to enable func64 interface in musl for 64-bit file system functions
export CPPFLAGS+=' -D_LARGEFILE64_SOURCE'

# https://www.openwall.com/lists/musl/2014/11/05/3
# fstack-protector and musl do not get along but only on i686
if [[ $CARCH = i686 || $CARCH = pentium4 || $CARCH = i486 ]]; then
  # silly build systems have configure checks or buildtime programs that don't CFLAGS but do do CC
  export CC="musl-gcc -fno-stack-protector"
  export CFLAGS="${CFLAGS/-fstack-protector-strong/}"
fi

# GCC 16 added -latomic_asneeded which musl-gcc's search path doesn't cover
GCC_MAJOR=$(gcc -dumpversion | cut -d. -f1)
if test "${GCC_MAJOR}" -ge 16; then
    export CC+=' -fno-link-libatomic'
    export CFLAGS+=' -fno-link-libatomic'
fi

# musl build for openssl-sys
export PKG_CONFIG_ALLOW_CROSS=1

export RUSTUP_TOOLCHAIN=stable
#unset RUSTC
#unset AR
#unset NM
#unset OBJCOPY
#unset OBJDUMP
#unset READELF
#unset STRIP
#unset RANLIB

case "$CARCH" in
  "armv6h")
    ARCH="arm"
    ;;
  "armv7h")
    ARCH="armv7"
    ;;
  "riscv64")
    ARCH="riscv64gc"
    ;;
  "pentium4")
    ARCH="x86_64"
    ;;
  *)
    ARCH=$CARCH
    ;;
esac

set_env_var() {
  # 環境変数 (pkg-configが./tmpを検索)
  TMPDIR=${srcdir}/tmp
  export PKG_CONFIG_PATH="$TMPDIR"/usr/lib/pkgconfig:/usr/lib/pacman/lib/pkgconfig:"$PKG_CONFIG_PATH"
  export PATH="$TMPDIR"/usr/bin:"$PATH"
  export CPPFLAGS="$CPPFLAGS -I"$TMPDIR"/usr/include -I/usr/lib/pacman/include"
  export LDFLAGS="$LDFLAGS -L"$TMPDIR"/usr/lib -L/usr/lib/pacman/lib"
  #export LD=ld.lld
}
checkver() {
  test "$(echo "$@" | tr " " "\n" | sort -Vr | head -n 1)" == "$1";
}

prepare() {
  cd "$srcdir/$_pkgname"

  sed -e "/^homepage/d" -i Cargo.toml
  # 環境変数 (pkg-configが./tmpを検索)
  TMPDIR=${srcdir}/tmp
  # 一時ディレクトリ作成
  mkdir -p "$TMPDIR"/usr/lib "$TMPDIR"/usr/include "$TMPDIR"/usr/bin

  rustup update $RUSTUP_TOOLCHAIN
  TARGETS=$(rustup target list | grep "$ARCH"-); : "${TARGET:=$(echo "$TARGETS" | grep musl | head -n1 | cut -d' ' -f1)}" "${TARGET:=$(echo "$TARGETS" | grep -v musl | head -n1 | cut -d' ' -f1)}"
  : "${TARGET:=$(rustc -vV | sed -n 's/^host: //p')}"
  echo $TARGET
  rustup target add $TARGET
 
  #cargo update
  #cargo update paru
  cargo fetch --locked --target $TARGET
}

# 各ライブラリのビルド関数
build_lib() {
  local name=$1
  local dir=$2
  local extra_flags="${3:-}"

  TMPDIR=${srcdir}/tmp
  if compgen -G "$TMPDIR/usr/lib/*${name}*.a" > /dev/null; then
      echo "skip ${name}"
      return
  elif [ ${name} == "e2fsprogs" ] && [ -f $TMPDIR/usr/lib/libcom_err.a ]; then
      echo "skip ${name}"
      return
  fi
  echo "Building: $name"
  CFLAGS_=$CFLAGS
  CXXFLAGS_=$CXXFLAGS
  LDFLAGS_=$LDFLAGS
  CC_=$CC

  CURDIR=$PWD
  cd ${srcdir}/$dir

  # configureがなく、autogen.sh があれば実行（configure生成）
  if [ ! -f configure ] && [ -f autogen.sh ]; then
    #./autogen.sh
    autoreconf -vfi
  fi

  #if [[ "$name" == "attr" || "$name" == "acl" ]]; then
#	CC=$LOCAL_CC
 # fi

  if [[ "$name" == "krb5" ]]; then
  # Step 1: Build dynamic (default) first
    CFLAGS_="$CFLAGS"
    export CFLAGS+=" -fPIC -fno-strict-aliasing -fstack-protector-all -std=gnu17"
    autoreconf -vfi
    sed -i "s/error-implicit-function-declaration/no-implicit-function-declaration/" configure
    #./configure $extra_flags
    #make -j$(nproc)
    # Step 2: Reconfigure for static-only WITHOUT clean, then rebuild
    ./configure --prefix="$TMPDIR"/usr --enable-static --disable-shared $extra_flags
    make -j$(nproc)
    make install
    export CFLAGS="$CFLAGS_"
  elif [ -f configure ]; then
    ./configure --prefix="$TMPDIR"/usr --enable-static --disable-shared $extra_flags
    make -j$(nproc)
    make install-libs || make install
  # configure なしで Makefile があれば makeベース
  elif [ -f Makefile ]; then
    make -j$(nproc) $extra_flags
    make install PREFIX="$TMPDIR"/usr $extra_flags  # PREFIXを調整（Makefileによる）
  # CMake があれば CMakeベース
  elif [ -f CMakeLists.txt ]; then
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$TMPDIR"/usr $extra_flags
    cmake --build .
    cmake --install .
    cd ..
  # configure があれば autoconfベースでビルド
  else
    echo "Unknown build system for $name. No configure, autogen.sh, Makefile, or CMakeLists.txt found."
    exit 1
  fi

  LDFLAGS=$LDFLAGS_
  CFLAGS=$CFLAGS_
  CXXFLAGS=$CXXFLAGS_
  CC=$CC_

  cd $CURDIR
}

build () {
  TARGETS=$(rustup target list | grep "$ARCH"-); : "${TARGET:=$(echo "$TARGETS" | grep musl | head -n1 | cut -d' ' -f1)}" "${TARGET:=$(echo "$TARGETS" | grep -v musl | head -n1 | cut -d' ' -f1)}"
  : "${TARGET:=$(rustc -vV | sed -n 's/^host: //p')}"
  echo $TARGET

  set_env_var
  # Add -ffat-lto-objects flag to LTOFLAGS to prevent mangling of static libs.(gcc)
  # In clang-16, there seems to be no problem without this option specified.
  # (The -ffat-lto-objects option is planned to be supported from clang-17.)
  export LTOFLAGS_="$LTOFLAGS"
  : "${CC:=$(command -v gcc || command -v clang)}"
  case "$CC" in
    *gcc*)
        if [ -n "$LTOFLAGS" ]; then
            LTOFLAGS="$LTOFLAGS -fuse-linker-plugin -ffat-lto-objects"
        else
            LTOFLAGS="-ffat-lto-objects"
        fi
        export LTOFLAGS
		;;
	*clang*)
        # for musl-gcc
        if [ -n "$LTOFLAGS" ]; then
            LTOFLAGS="$LTOFLAGS -fuse-linker-plugin -ffat-lto-objects"
        else
            LTOFLAGS="-ffat-lto-objects"
        fi
        export LTOFLAGS
		;;
  esac
  echo "LTOFLAGS:" $LTOFLAGS

  # paru
  cd "$srcdir/$_pkgname"
  #if pacman -T pacman-git > /dev/null; then
  #  _features+="git,"
  #fi
  if [[ $TARGET =~ musl ]]; then
    _features+="static,"
  fi

  # If lto is specified in the PKGBUILD options, or if lto is specified in makepkg.conf and !lto is not specified in the PKGBUILD options,
  # turn on LTO for Rust.(CARGO_PROFILE_RELEASE_LTO=on)
  [[ -n $(printf '%s\n' ${OPTIONS[@]} | grep -x 'lto') ]] && \
  [[ -z $(printf '%s\n' ${options[@]} | grep -x '!lto') ]] || \
  [[ -n $(printf '%s\n' ${options[@]} | grep -x 'lto') ]] \
  && export CARGO_PROFILE_RELEASE_LTO=on \
  || export CARGO_PROFILE_RELEASE_LTO=off

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  [[ "$CARGO_PROFILE_RELEASE_LTO" == "on" ]] && RUSTFLAGS+=" -Clto=fat -Cembed-bitcode=y"
  echo "CARGO_PROFILE_RELEASE_LTO is "$CARGO_PROFILE_RELEASE_LTO

  if [[ $CARCH == aarch64 ]]; then
    _features+="generate,"
  fi
  
  # Linker rust-lld
  # PIE
  RUSTFLAGS+=" -C linker=rust-lld -C link-arg=-L/usr/lib/musl/lib -Clink-arg=--no-dynamic-linker -C link-arg=-pie"
  # non PIE
  #RUSTFLAGS+=" -C linker=rust-lld -C link-arg=-L/usr/lib/musl/lib -Clink-arg=--no-dynamic-linker -C link-arg=-static"
  RUSTFLAGS+=" -C link-arg=-z -Clink-arg=relro -Clink-arg=-z -Clink-arg=now"

  if [[ $CARCH == x86_64 ]]; then
    export RUSTFLAGS+=" -C link-self-contained=on -C strip=symbols -C no-redzone=y -C overflow-checks=y -C opt-level=z -C control-flow-guard=y"
  fi

  # paruビルド
  #export LTOFLAGS="$LTOFLAGS_"
  cargo build --frozen --features "${_features:-}" --release --target-dir target --target $TARGET
  #./scripts/mkmo locale/
}

package() {
  cd "$srcdir/$_pkgname"
  TARGETS=$(rustup target list | grep "$ARCH"-); : "${TARGET:=$(echo "$TARGETS" | grep musl | head -n1 | cut -d' ' -f1)}" "${TARGET:=$(echo "$TARGETS" | grep -v musl | head -n1 | cut -d' ' -f1)}"
  : "${TARGET:=$(rustc -vV | sed -n 's/^host: //p')}"
  echo $TARGET
  install -Dm755 target/$TARGET/release/paru "${pkgdir}/usr/bin/paru-static"
  #install -Dm644 paru.conf "${pkgdir}/etc/paru.conf"

  #install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  #install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  #install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/paru.bash"
  #install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/paru.fish"
  #install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_paru"

  #install -d "$pkgdir/usr/share/"
  #cp -r locale "$pkgdir/usr/share/"
}
