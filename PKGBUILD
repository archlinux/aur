# Maintainer:  FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Christoph Robbert <chrobbert@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: jrutila
# Contributor: grimi <grimi@poczta.fm>
# Contributor: jht <stefano@inventati.org>

pkgname=wxGlade
pkgver=1.1.0
pkgrel=1
pkgdesc='wxGlade is a GUI builder written in Python for the GUI toolkit wxWidgets/wxPython'
arch=('any')
license=('MIT')
url='https://github.com/wxGlade/wxGlade'
depends=(
    'python>=3.4'
    'python-wxpython>=2.8'
    'hicolor-icon-theme'
)
optdepends=(
    'desktop-file-utils: pacman hooks for updating desktop database'
    'shared-mime-info: pacman hooks for updating mime database'
)
makedepends=(
    'python-setuptools'
    'xdg-utils'
)
source=(
    "https://github.com/wxGlade/wxGlade/archive/v$pkgver.tar.gz"
)
sha256sums=('b71939d8be3ef1929a7533b7daa55f9396a28ea93a07b01d3cdb403d399d943b')

build() {
    cd "$pkgname-$pkgver"
    command -p python setup.py build
}

package() {
    cd "$pkgname-$pkgver"

    command -p python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    datadir="$pkgdir/usr/share/"

    export XDG_DATA_DIRS=":$datadir"
    export XDG_UTILS_INSTALL_MODE=system
    export XDG_UTILS_DEBUG_LEVEL=1

    install -Dm644 "wxglade-mime.xml" "$datadir/mime/packages/$pkgname.xml"
    install -dm755 $datadir/{icons/hicolor/,}

    xdg-icon-resource install --noupdate --novendor --size 128 icons/wxglade.png "$pkgname"
    xdg-icon-resource install --noupdate --size 128 --context mimetypes icons/wxglade.png application-x-wxg

    xdg-icon-resource install --noupdate --novendor --size 32 icons/wxglade.png "$pkgname"
    xdg-icon-resource install --noupdate --size 32 --context mimetypes icons/wxglade.png application-x-wxg

    install -Dm644 "$pkgname.desktop" "$datadir/applications/$pkgname.desktop"
    sed -i "s:wxglade.xpm:$pkgname.png:" "$datadir/applications/$pkgname.desktop"
}
