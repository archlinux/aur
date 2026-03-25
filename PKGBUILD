# Maintainer: Rashesh Padia
pkgname=collabora-office
pkgver=25.04.9.2
pkgrel=1
pkgdesc='Collabora Office - Qt6 desktop document editor powered by Collabora Online'
arch=('x86_64')
url='https://collaboraoffice.com'
license=('MPL-2.0')
depends=(
    'qt6-webengine'
    'qt6-declarative'
    'dbus'
    'libpng'
    'zlib'
    'zstd'
    'hicolor-icon-theme'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'autoconf'
    'automake'
    'libtool'
    'pkg-config'
    'qt6-tools'
    'cppunit'
    'python'
    'python-lxml'
    'python-polib'
    'nodejs'
    'npm'
    'rsync'
    'openssl'
    'pcre2'
    'expat'
)
options=('!strip' '!debug')
source=(
    "git+https://github.com/CollaboraOnline/online.git#branch=distro/collabora/coda-25.04"
    "git+https://github.com/pocoproject/poco.git#tag=poco-1.12.5-release"
    "https://github.com/CollaboraOnline/online/releases/download/for-code-assets/core-co-25.04-assets.tar.gz"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
    # Build Poco 1.12.5 as static libraries. Poco is not in Arch repos
    # and static linking avoids a runtime dependency.
    cmake -S poco -B poco-build -G Ninja \
        -DCMAKE_INSTALL_PREFIX="$srcdir/poco-install" \
        -DBUILD_SHARED_LIBS=OFF \
        -DPOCO_UNBUNDLED=ON \
        -DENABLE_TESTS=OFF \
        -DENABLE_SAMPLES=OFF \
        -DENABLE_ACTIVERECORD=OFF \
        -DENABLE_DATA=OFF \
        -DENABLE_DATA_SQLITE=OFF \
        -DENABLE_DATA_MYSQL=OFF \
        -DENABLE_DATA_ODBC=OFF \
        -DENABLE_DATA_POSTGRESQL=OFF \
        -DENABLE_MONGODB=OFF \
        -DENABLE_PAGECOMPILER=OFF \
        -DENABLE_PAGECOMPILER_FILE2PAGE=OFF \
        -DENABLE_PROMETHEUS=OFF \
        -DENABLE_REDIS=OFF \
        -DENABLE_JWT=OFF
    cmake --build poco-build
    cmake --install poco-build
}

build() {
    cd online

    # Remove stale Qt5 moc files so BUILT_SOURCES regenerates them
    # with the Qt6 moc. Done here (not prepare) so it runs on rebuilds.
    rm -f qt/bridge.moc.cpp qt/DBusService.moc.cpp

    ./autogen.sh

    # MOC= forces Qt6 moc. The coda-25.04 branch's AC_PATH_PROG searches
    # $PATH first and finds /usr/bin/moc (Qt5) before the Qt6 paths.
    ./configure \
        MOC=/usr/lib/qt6/moc \
        --prefix=/usr \
        --enable-qtapp \
        --disable-ssl \
        --disable-werror \
        --disable-tests \
        --with-lokit-path="$srcdir/include" \
        --with-lo-path=/usr/lib/collabora-office \
        --with-poco-includes="$srcdir/poco-install/include" \
        --with-poco-libs="$srcdir/poco-install/lib"

    make
}

package() {
    cd online
    make DESTDIR="$pkgdir" install

    # Install pre-built LibreOffice core runtime
    install -d "$pkgdir/usr/lib/collabora-office"
    cp -a "$srcdir/instdir"/* "$pkgdir/usr/lib/collabora-office/"

    # License
    install -Dm644 "$srcdir/online/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Remove server-only binaries not needed for the desktop app
    rm -f "$pkgdir/usr/bin/coolwsd" \
          "$pkgdir/usr/bin/coolconfig" \
          "$pkgdir/usr/bin/coolforkit" \
          "$pkgdir/usr/bin/coolmount"
}
