# Maintainer: Rashesh Padia
pkgname=collabora-office
pkgver=26.04.2.1
pkgrel=1
_source_tag=cp-26.04.2-1
_source_dir=online.mirror-${_source_tag}
pkgdesc='Collabora Office - Qt6 desktop document editor powered by Collabora Online'
arch=('x86_64')
url='https://collaboraoffice.com'
license=('MPL-2.0')
depends=(
    'qt6-base'
    'qt6-webengine'
    'qt6-declarative'
    'qt6-websockets'
    'dbus'
    'fontconfig'
    'libcap'
    'libpng'
    'openssl'
    'pam'
    'zlib'
    'zstd'
    'hicolor-icon-theme'
)
makedepends=(
    'git'
    'autoconf'
    'automake'
    'libtool'
    'pkgconf'
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
    "online-${_source_tag}.tar.gz::https://github.com/CollaboraOnline/online.mirror/archive/refs/tags/${_source_tag}.tar.gz"
    "https://github.com/Rash419/collabora-core-assets/releases/download/cp-26.04.2-1/core-co-26.04-assets.tar.gz"
    "https://www.collaboraoffice.com/downloads/collabora-office-brand/collabora-office-brand-26.04.2.1.tar.gz"
)
sha256sums=('7701031ffd4736e55658dd371b2e42d9f0dc262628398536f0d3d960926cfdd5'
            'fb91e40eaa52cbfc824f2a1d62b3f87093567284d1f22a5979415e0623afb6c8'
            '321112b8f29d338ca9530dc604448c9eb465c4f9308468722f16a95fc6f830a8')

build() {
    cd "$_source_dir"

    ./autogen.sh

    ./configure \
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
    cd "$_source_dir"
    make DESTDIR="$pkgdir" install

    # Install pre-built Collabora Office engine runtime
    install -d "$pkgdir/usr/lib/collabora-office"
    cp -a "$srcdir/instdir"/* "$pkgdir/usr/lib/collabora-office/"

    # License
    install -Dm644 "$srcdir/$_source_dir/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install Collabora Office branding (online/browser UI theme and assets)
    local _brand="$srcdir/collabora-office-brand"
    cp -a "$_brand/online-theme" \
        "$pkgdir/usr/lib/collabora-office/share/theme_definitions/online/"
    cp -a "$_brand"/branding* "$_brand"/images "$_brand"/welcome \
        "$pkgdir/usr/share/coolwsd/browser/dist/"

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
