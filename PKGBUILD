# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>
# Maintainer: Iru Cai <mytbk920423@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Paul Préfontaine <paul+archlinuxaur@prefontaine.name>
# Contributor: HLFH
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
# Contributor: The_Decryptor

_commit=2e62ee29c98ef70e9f1749884557229fd255a8e5
pkgname=h2o-git
pkgver=2.2.0.8494
pkgrel=2
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64' 'aarch64')
# if you want websocket support, you'll also need aur/wslay
depends=('libuv' 'zlib' 'libwslay' 'libcap' 'brotli' 'bcc' 'sh' 'glibc' 'gcc-libs' 'liburing')
optdepends=('zlib-ng: optional replacement for zlib (faster decompression) - enable at build time with _enable_zlib_ng=1')
makedepends=('bison' 'cmake' 'libtool' 'make' 'pkg-config' 'ruby' 'libaegis' 'git')
url="https://github.com/h2o/h2o"
license=('MIT')
options=('lto')

#source=("git+https://github.com/h2o/h2o.git"
source=("git+https://github.com/h2o/h2o.git#commit=${_commit}?signed/"
#        "neverbleed-fix-when-lacking-engines.patch"
        https://github.com/h2o/h2o/pull/3550.patch
        'h2o.service')
sha256sums=('17cdf9726e65eec40532dabf0437589e269f76885d2a98b4a101aae0ecebb9e2'
            'dbe8c77cfa41cacb95c07ac4b6e53fe2adbbbdd694d5fc2098dafe466d50a65d'
            '7fccdeb1a89134b48674764dc243f8967eb1234679e401af93e210fbf0934b62')
backup=('etc/h2o.conf')
provides=('h2o' 'libh2o')
conflicts=('h2o' 'libh2o')

: "${_enable_zlib_ng:=0}"

pkgver() {
    cd "$srcdir/h2o"
    #git describe --tags | sed -e 's/^v//g' -e 's/-g.*$//g' -e 's/-/./g'
    git describe --tags --abbrev=0 | sed 's/^v//;s/-/.g/;s/-/./g'
}

prepare() {
    cd "$srcdir/h2o"

    git config core.autocrlf false
    git submodule update --init --recursive

    # zlib-ng support
    if [[ $_enable_zlib_ng -eq 1 ]]; then
        if ! pacman -Qq zlib-ng &>/dev/null; then
            error "zlib-ng is not installed."
            error "Please install it first:  sudo pacman -S zlib-ng"
            error "Then rebuild with:       _enable_zlib_ng=1 makepkg -si"
            return 1
        fi
        msg2 "Building with zlib-ng support"
        # zlib-ng support patch
        patch -p1 -i ${srcdir}/3550.patch
    elif pacman -Qq zlib-ng &>/dev/null; then
        msg2 "zlib-ng is installed but not enabled."
        msg2 "To use it, rebuild with: _enable_zlib_ng=1 makepkg -si"
    fi

    # libressl-3.8(OPENSSL_NO_ENGINE)
    #git apply ${srcdir}/neverbleed-fix-when-lacking-engines.patch

    # set CMake minimal version to 3.15 to set CMP0039 to new
    sed -i 's/VERSION 2.8.12/VERSION 3.15/g' CMakeLists.txt

    sed -i 's|example|/usr/share/doc/h2o/example|' examples/h2o/h2o.conf

    export CFLAGS="$CFLAGS $LTOFLAGS"
    export CXXFLAGS="$CXXFLAGS $LTOFLAGS"
    export LDFLAGS="$LDFLAGS $LTOFLAGS"
    #export LDFLAGS="$LDFLAGS $LTOFLAGS -Wl,-rpath,/usr/lib/libressl"

    local cmake_args=(
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=/usr/lib
        -DCMAKE_INSTALL_SYSCONFDIR=/etc
        -DCMAKE_C_FLAGS="$CPPFLAGS $CFLAGS"
        -DCMAKE_CXX_FLAGS="$CPPFLAGS $CXXFLAGS"
        -DCMAKE_LINKER="$LD"
        -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS"
        -DCMAKE_MODULE_LINKER_FLAGS="$LDFLAGS"
        -DCMAKE_REQUIRED_FLAGS="-c"
        -DWITH_MRUBY=on
        -DWITHOUT_LIBS=off
        -DBUILD_SHARED_LIBS=on
    )

    # zlib-ng
    if [[ $_enable_zlib_ng -eq 1 ]]; then
        cmake_args+=(-DWITH_ZLIB_NG=ON)
    #else
    #    cmake_args+=(-DWITH_ZLIB_NG=OFF)
    fi

    cmake "${cmake_args[@]}" .

#       -DOPENSSL_ROOT_DIR=/usr/lib/libressl \
#       -DOPENSSL_INCLUDE_DIR=/usr/include/libressl \
#       -DOPENSSL_LIBRARIES=/usr/lib/libressl \
}

build() {
    cd "$srcdir/h2o"

    #if [[ "$CC" == "clang" ]] ;then
    #    export LD="clang"
    #fi
    if [[ "$GEM_HOME"=="" ]] ;then
        export GEM_HOME="$(gem env user_gemhome)"
        export PATH="$PATH:$GEM_HOME/bin"
    fi
    cmake --build . -j$(nproc)
}

package() {
    cd "$srcdir/h2o"

    install -Dm644 LICENSE          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/h2o.service" "$pkgdir/usr/lib/systemd/system/h2o.service"
    install -Dm 644 examples/h2o/h2o.conf "$pkgdir/etc/h2o.conf"

    DESTDIR="$pkgdir" cmake --install .
}
