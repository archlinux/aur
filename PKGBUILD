# $Id$
# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>
# Contributor: Morgan <morganamilo@archlinux.org>

_ver_pacman_static=7.1.0
_unistring_ver=1.4.1
_attr_ver=2.5.2
_acl_ver=2.3.2
_lz4_ver=1.10.0
_libxml2_ver=2.15.1
_libidn2_ver=2.3.8
_brotli_ver=1.2.0
_libssh2_ver=1.11.1
_e2fsprogs_ver=1.47.3
_nghttp3_ver=1.13.1
_libpsl_ver=0.21.5
_curl_ver=8.17.0
#_krb5_ver=1.21.3
#_readline_ver=8.2
#_libedit_ver=20250104-3.1

pkgname=paru-static
_pkgname=paru
_pkgver=2.1.0
pkgver=2.2.0
pkgrel=1
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source=("$_pkgname-$_pkgver.tar.gz::https://github.com/Morganamilo/paru/archive/v$_pkgver.tar.gz"
        git+https://aur.archlinux.org/pacman-static.git
		libalpm16.patch
		https://curl.haxx.se/download/curl-${_curl_ver}.tar.gz
        https://ftp.gnu.org/gnu/libunistring/libunistring-${_unistring_ver}.tar.gz
        https://download-mirror.savannah.gnu.org/releases/acl/acl-${_acl_ver}.tar.gz
        https://download.savannah.gnu.org/releases/attr/attr-${_attr_ver}.tar.gz
		attr.patch::https://cgit.git.savannah.gnu.org/cgit/attr.git/patch/?id=8a80d895dfd779373363c3a4b62ecce5a549efb2
		lz4-${_lz4_ver}.tar.gz::https://github.com/lz4/lz4/archive/refs/tags/v${_lz4_ver}.tar.gz
        https://gitlab.gnome.org/GNOME/libxml2/-/archive/v${_libxml2_ver}/libxml2-v${_libxml2_ver}.tar.gz
        https://ftp.gnu.org/gnu/libidn/libidn2-${_libidn2_ver}.tar.gz
		brotli-${_brotli_ver}.tar.gz::https://github.com/google/brotli/archive/refs/tags/v${_brotli_ver}.tar.gz
		#https://ftp.gnu.org/gnu/readline/readline-${_readline_ver}.tar.gz
		#https://thrysoee.dk/editline/libedit-${_libedit_ver}.tar.gz
		#https://web.mit.edu/kerberos/dist/krb5/${_krb5_ver%\.[0-9]*}/krb5-${_krb5_ver}.tar.gz
		#krb5.patch
		https://libssh2.org/download/libssh2-${_libssh2_ver}.tar.gz
		e2fsprogs-${_e2fsprogs_ver}.tar.gz::https://github.com/tytso/e2fsprogs/archive/refs/tags/v${_e2fsprogs_ver}.tar.gz
        nghttp3-${_nghttp3_ver}.tar.gz::https://github.com/ngtcp2/nghttp3/releases/download/v${_nghttp3_ver}/nghttp3-${_nghttp3_ver}.tar.gz
        libpsl-${_libpsl_ver}.tar.gz::https://github.com/rockdaboot/libpsl/archive/refs/tags/${_libpsl_ver}.tar.gz
)
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
license=('GPL-3.0-or-later')
makedepends=('rustup' 'musl' 'meson' 'kernel-headers-musl' 'lld' 'binutils' 'git' 'cmake' 'publicsuffix-list' 'gtk-doc' 'libxslt')
depends=()
#conflicts=('paru')
#replaces=('paru')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
sha256sums=('eea4dbb524db765d5316f540f9ee670c0bf81aae4827b5417eebb4c9b5651727'
            'SKIP'
            '0dc91c330f649155d349ed4e33942791f07171cc82f414a2387d2134e115127b'
            'e8e74cdeefe5fb78b3ae6e90cd542babf788fa9480029cfcee6fd9ced42b7910'
            '12542ad7619470efd95a623174dcd4b364f2483caf708c6bee837cb53a54cb9d'
            '5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c'
            '39bf67452fa41d0948c2197601053f48b3d78a029389734332a6309a680c6c87'
            '51365cfb4f0d0bd972b99495b99e379984264495018e00f96290684a9e0fcfd3'
            '537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b'
            '0a5ebf8fa131585748d661ae692503483aff39d9b29b6c4b342cd80d422f246c'
            'f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a'
            '816c96e8e8f193b40151dad7e8ff37b1221d019dbcb9c35cd3fadbfe6477dfec'
            'd9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7'
            '9286ee5471a8a5339a61eb952739e4614a5b1dbed79ca73a78f014885ce2ad53'
            '07160f28af3ddc3e8b95c8bbefe08c650e7cf303375141b6ca35cc89b319f70d'
            'd6717685a5f221403041907cca98ae9f72aef163b9d813d40d417c2663373a32')
#options=('lto')

# Use musl toolchain
export CC=musl-gcc
export CXX=musl-g++  # For libs with C++ code (e.g., libxml2, krb5)
export LDFLAGS="-static $LDFLAGS"

# to enable func64 interface in musl for 64-bit file system functions
export CFLAGS+=' -D_LARGEFILE64_SOURCE'
export CXXFLAGS+=' -D_LARGEFILE64_SOURCE'

# https://www.openwall.com/lists/musl/2014/11/05/3
# fstack-protector and musl do not get along but only on i686
if [[ $CARCH = i686 || $CARCH = pentium4 || $CARCH = i486 ]]; then
  # silly build systems have configure checks or buildtime programs that don't CFLAGS but do do CC
  export CC="musl-gcc -fno-stack-protector"
  export CXX="musl-gcc -fno-stack-protector"
  export CFLAGS="${CFLAGS/-fstack-protector-strong/}"
  export CXXFLAGS="${CXXFLAGS/-fstack-protector-strong/}"
fi

export LD=ld.lld

# musl build for openssl-sys
export PKG_CONFIG_ALLOW_CROSS=1
export RUSTUP_TOOLCHAIN=stable
unset RUSTC
unset AR
unset NM
unset OBJCOPY
unset OBJDUMP
unset READELF
unset STRIP
unset RANLIB

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
  export CFLAGS="$CFLAGS -I"$TMPDIR"/usr/include -I/usr/lib/pacman/include"
  export CXXFLAGS="$CXXFLAGS -I"$TMPDIR"/usr/include -I/usr/lib/pacman/include"
  export LDFLAGS="$LDFLAGS -L"$TMPDIR"/usr/lib -L/usr/lib/pacman/lib"
}
checkver() {
  test "$(echo "$@" | tr " " "\n" | sort -Vr | head -n 1)" == "$1";
}

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

  # 環境変数 (pkg-configが./tmpを検索)
  TMPDIR=${srcdir}/tmp
  # 一時ディレクトリ作成
  mkdir -p "$TMPDIR"/usr/lib "$TMPDIR"/usr/include "$TMPDIR"/usr/bin

  rustup update stable
  TARGETS=$(rustup target list | grep "$ARCH"-); : "${TARGET:=$(echo "$TARGETS" | grep musl | head -n1 | cut -d' ' -f1)}" "${TARGET:=$(echo "$TARGETS" | grep -v musl | head -n1 | cut -d' ' -f1)}"
  : "${TARGET:=$(rustc -vV | sed -n 's/^host: //p')}"
  echo $TARGET
  rustup target add $TARGET
  patch -p1 -i ${srcdir}/libalpm16.patch
  cargo update alpm alpm-utils aur-depends
  #cargo update
  cargo fetch --locked --target $TARGET

  #depends library
  #attr patch
  cd ${srcdir}/attr-${_attr_ver}
  patch -p1 -i ${srcdir}/attr.patch
  cd ../..

  #krb5 patch
  #cd ${srcdir}/krb5-${_krb5_ver}/src
  # FS#25384
  #sed -i "/KRB5ROOT=/s/\/local//" util/ac_check_krb5.m4
  #patch -p1 -i ${srcdir}/krb5.patch
  #cd $TMPDIR/usr/include
  #cd $CURDIR

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

  CURDIR=$PWD
  cd ${srcdir}/$dir

  # configureがなく、autogen.sh があれば実行（configure生成）
  if [ ! -f configure ] && [ -f autogen.sh ]; then
    #./autogen.sh
	autoreconf -vfi
  fi

  if [[ $name == "krb5" ]]; then
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

  cd $CURDIR
}

build () {
  cd $srcdir/pacman-static
  # If pacman-static($_ver_pacman_static) is not installed, build and install it.(Because it requires libalpm.a.)
  # Build and install pacman-static if the version is not greater than or not equal to $_ver_pacman_static or if the package cannot read symbols in the static link library(libalpm.a).
  if ! checkver $(LC_ALL=C pacman -Qi pacman-static|grep Version|grep -Eo "[0-9]+\.[0-9]+\.[0-9]+") $_ver_pacman_static || [[ ! $(LC_ALL=C objdump --syms /usr/lib/pacman/lib/libalpm.a | grep -E "\.text.* alpm_version") ]] ; then
    # Addition of -ffat-lto-objects to LTOFLAGS.(prevent static lib mangling)
    sed -r "/(export LDFLAGS=.*)/s/(.+)/export LTOFLAGS+=' -fuse-linker-plugin -ffat-lto-objects'\n\1/" PKGBUILD -i
    #for i in $( . PKGBUILD; echo "${validpgpkeys[@]}" ); do gpg --receive "$i"; gpg -a --export "$i" > "keys/pgp/$i.asc" ; done
    makepkg -si --noconfirm --skippgpcheck
  fi

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
  echo $LTOFLAGS

  # ビルド順: 独立したものから
  # readline
  #CFLAGS_="$CFLAGS"
  #export CFLAGS+=" -fPIC -fno-strict-aliasing -fstack-protector-all -std=gnu17"
  #build_lib "readline" "readline-8.2"
  #CFLAGS="$CFLAGS_"
  # libedit
  # krb5
  #build_lib "krb5" "krb5-${_krb5_ver}/src" "--disable-threaded-resolver --disable-pkinit --without-system-verto"

  # curl
  # disable gssapi and krb5(kerberos-auth)
  # Building the krb5 static library involves numerous dependencies (libedit, readline, etc.).
  # As these were deemed unnecessary for paru, krb5 and gssapi are disabled.
  cd "${srcdir}"/curl-${_curl_ver}
  if [ -f $TMPDIR/usr/lib/libcurl.a ];then
	  echo "skip curl"
  else
    # c-ares is not detected via pkg-config :(
    ./configure --prefix="$TMPDIR"/usr \
                --disable-shared \
                --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
                --disable-{dict,gopher,imap,ldap,ldaps,manual,pop3,rtsp,smb,smtp,telnet,tftp} \
                --without-{brotli,gssapi,libidn2,librtmp,libssh2,libpsl} \
                --disable-libcurl-option \
                --with-openssl \
                --enable-ares=/usr/lib/pacman/ \
                --disable-kerberos-auth
    make -C lib
    make install-pkgconfigDATA
    make -C lib install
    make -C include install
  fi

  # libunistring (idn2依存)
  build_lib "libunistring" "libunistring-${_unistring_ver}"

  # attr
  build_lib "attr" "attr-${_attr_ver}"  # 最新確認: 2.5.2 or update
  
  # acl
  build_lib "acl" "acl-${_acl_ver}"  # 最新確認: 2.3.2 or update

  # lz4
  build_lib "lz4" "lz4-1.10.0" "BUILD_STATIC=yes BUILD_SHARED=no"  # make

  # libxml2
  build_lib "libxml2" "libxml2-v${_libxml2_ver}" "--without-python"  # without python

  # libidn2 (unistring依存)
  build_lib "libidn2" "libidn2-${_libidn2_ver}" "--with-libunistring-prefix="$TMPDIR"/usr"

  # brotli
  build_lib "brotli" "brotli-${_brotli_ver}" "-DBUILD_SHARED_LIBS=OFF"  # cmake

  # e2fsprogs (libcom_errを含む)
  build_lib "e2fsprogs" "e2fsprogs-${_e2fsprogs_ver}" "--enable-elf-shlibs=no --disable-fuse2fs"  # static #no needed fuse3 for paru

  # libssh2
  #build_lib "libssh2" "libssh2-${_libssh2_ver}" "-DBUILD_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=OFF"  # cmake
  build_lib "libssh2" "libssh2-${_libssh2_ver}" "--with-crypto=openssl" #configure
  
  # nghttp3
  #build_lib "nghttp3" "nghttp3-${_nghttp3_ver}" "-DENABLE_LIB_ONLY=ON -DENABLE_STATIC_LIB=ON -DENABLE_SHARED_LIB=OFF" #cmake
  build_lib "nghttp3" "nghttp3-${_nghttp3_ver}" "--enable-lib-only" #configure
  
  # libpsl (idn2依存)
  build_lib "libpsl" "libpsl-${_libpsl_ver}" "--with-libidn2="$TMPDIR"/usr \
	  --disable-dependency-tracking \
	  --with-psl-file=/usr/share/publicsuffix/effective_tld_names.dat \
	  --with-psl-testfile=/usr/share/publicsuffix/test_psl.txt"

  # paru
  cd "$srcdir/$_pkgname-$_pkgver"
  #if pacman -T pacman-git > /dev/null; then
    _features+="git,"
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

  # If LD is set to mold, gold, or ld, an error will occur.
  # It is best to use gcc (cc) or no linker specification.
  RUSTFLAGS+=" -Clinker=gcc -Clink-arg=-fuse-ld=lld -Clink-arg=--verbose"
  if [[ $CARCH == x86_64 ]]; then
    #PIE
    export RUSTFLAGS+=" -C link-self-contained=on -C strip=symbols -C no-redzone=y -C overflow-checks=y -C opt-level=z -C control-flow-guard=y -C link-arg=-Wp,-D_FORTIFY_SOURCE=2 -C link-arg=-U_FORTIFY_SOURCE -C link-arg=-D_FORTIFY_SOURCE=2 -C link-arg=-fPIE -C link-arg=-fpie -C link-arg=-Wl,-z,relro,-z,now"
    # non PIE
    #export RUSTFLAGS+=" -C link-self-contained=on -C strip=symbols -C no-redzone=y -C overflow-checks=y -C opt-level=z -C control-flow-guard=y -C link-arg=-Wp,-D_FORTIFY_SOURCE=2 -C link-arg=-U_FORTIFY_SOURCE -C link-arg=-D_FORTIFY_SOURCE=2 -C link-arg=-Wl,-z,relro,-z,now"
  fi

  # paruビルド
  export LTOFLAGS="$LTOFLAGS_"
  cargo build --frozen --features "${_features:-}" --release --target-dir target --target $TARGET
  #./scripts/mkmo locale/
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
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
