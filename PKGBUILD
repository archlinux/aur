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
    'poco'
)
makedepends=(
    'git'
    'qt6-tools'
    'cppunit'
    'python'
    'python-lxml'
    'python-polib'
    'nodejs'
    'npm'
    'rsync'
)
optdepends=(
    'hunspell-en_us: English spell checking'
    'hyphen-en: English hyphenation'
    'noto-fonts: Noto font family'
    'noto-fonts-cjk: CJK font support'
    'ttf-liberation: Liberation fonts for document compatibility'
    'ttf-dejavu: DejaVu fonts'
)
options=('!strip' '!debug')
source=(
    "git+https://github.com/CollaboraOnline/online.git#branch=distro/collabora/coda-25.04"
    "https://github.com/CollaboraOnline/online/releases/download/for-code-assets/core-co-25.04-assets.tar.gz"
)
sha256sums=('SKIP'
            '4c0b9eec039b58ca930fbc05454d438d9031e597ef984495124d1b810a37790d')

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
        --with-lo-path=/usr/lib/collabora-office

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

    # Remove bundled dictionaries; the app uses system hunspell dicts
    rm -rf "$pkgdir/usr/lib/collabora-office/share/extensions"/dict-*

    # Remove bundled fonts; the app uses system fonts via fontconfig
    rm -rf "$pkgdir/usr/lib/collabora-office/share/fonts"

    # Remove server-only binaries not needed for the desktop app
    rm -f "$pkgdir/usr/bin/coolwsd" \
          "$pkgdir/usr/bin/coolconfig" \
          "$pkgdir/usr/bin/coolforkit" \
          "$pkgdir/usr/bin/coolmount"
}
