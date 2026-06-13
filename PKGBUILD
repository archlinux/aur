# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>
# Maintainer: Iru Cai <mytbk920423@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Paul Préfontaine <paul+archlinuxaur@prefontaine.name>
# Contributor: HLFH
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
# Contributor: The_Decryptor

_commit=ed7899d1c234fd15d272a0ac6404ffbd89a3c772
pkgname=h2o-git
pkgver=2.2.0.r8673.ged7899d
pkgrel=1
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
        # openssl
        fix-openssl-deprecated-warn.patch
        #openssl-no-engine.patch
        #https://github.com/h2o/h2o/pull/3285.patch
        #openssl-no-engine-1.patch::https://github.com/openbsd/ports/raw/c1521c4eb969ddf29306117ea125802a2644e734/www/h2o/patches/patch-deps_neverbleed_neverbleed_c
        #openssl-no-engine-2.patch::https://github.com/openbsd/ports/raw/c1521c4eb969ddf29306117ea125802a2644e734/www/h2o/patches/patch-deps_neverbleed_neverbleed_h
        https://github.com/h2o/h2o/pull/3553.patch
        
        # 404 error message
        https://github.com/h2o/h2o/pull/3551.patch

        'h2o.service')
sha256sums=('8d69a682942185d159cc66d115acb866055ba5a98689a1365544996331a844aa'
            '632f219cc21128810bba4de869de4961ebff9083af31231f721f451d2e58f7e1'
            '930bed0a8b6d75973e21cacb4cfda6bcacf08bc6d1b504b5cc36f56f9d6bfaf8'
            '99b8ae5a7e06af7a4308c60a204b903171bb357d61bf4ea8abb04b1bcc148174'
            '7fccdeb1a89134b48674764dc243f8967eb1234679e401af93e210fbf0934b62')
backup=('etc/h2o.conf')
provides=('h2o' 'libh2o')
conflicts=('h2o' 'libh2o')

: "${_openssl_no_engine:=0}"

pkgver() {
    cd "$srcdir/h2o"
    git describe --long --abbrev=7 --tags | sed 's/^v\([^-]*\)-\([0-9]*\)-g\(.*\)/\1.r\2.g\3/'
}

prepare() {
    cd "$srcdir/h2o"

    git config core.autocrlf false
    git submodule update --init --recursive

    # Fix deprecated warn openssl 3.0 
    #patch -p1 -i ${srcdir}/3285.patch
    patch -p1 -i ${srcdir}/fix-openssl-deprecated-warn.patch

    # libaegis 0.9.1
    #patch -p1 -i ${srcdir}/3552.patch

    # 404 error message
    patch -p1 -i ${srcdir}/3551.patch

    # set CMake minimal version to 3.15 to set CMP0039 to new
    sed -i 's/VERSION 2.8.12/VERSION 3.15/g' CMakeLists.txt

    sed -i 's|example|/usr/share/doc/h2o/example|' examples/h2o/h2o.conf

    export CFLAGS="$CFLAGS $LTOFLAGS"
    export CXXFLAGS="$CXXFLAGS $LTOFLAGS"
    export LDFLAGS="$LDFLAGS $LTOFLAGS"
    #export LDFLAGS="$LDFLAGS $LTOFLAGS -Wl,-rpath,/usr/lib/libressl"
    
    # OPENSSL_NO_ENGINE
    if [[ $_openssl_no_engine -eq 1 ]]; then
        msg2 "Building with CFLAGS and CXXFLAGS -DOPENSSL_NO_ENGINE"
        export CFLAGS="$CFLAGS -DOPENSSL_NO_ENGINE"
        export CXXFLAGS="$CXXFLAGS -DOPENSSL_NO_ENGING"
        # neverbleed OPENSSL_NO_ENGINE
        # https://github.com/openbsd/ports/tree/c1521c4eb969ddf29306117ea125802a2644e734/www/h2o/patches
        # https://github.com/h2o/h2o/pull/3553
        patch -p1 -i ${srcdir}/3553.patch
    fi

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
