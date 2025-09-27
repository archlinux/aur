# Maintainer:  FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Christoph Robbert <chrobbert@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: jrutila
# Contributor: grimi <grimi@poczta.fm>
# Contributor: jht <stefano@inventati.org>

pkgname=wxglade
_pkgname=wxGlade
pkgver=1.1.1
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
sha256sums=('59b4a84c256f60dc6435318696ecba6a5236569bbee2ed7995b860798ab3bdfe')

build() {
    cd "$_pkgname-$pkgver"
    command -p python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"

    command -p python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    datadir="$pkgdir/usr/share/"

    export XDG_DATA_DIRS=":$datadir"
    export XDG_UTILS_INSTALL_MODE=system
    export XDG_UTILS_DEBUG_LEVEL=1

    install -Dm644 "wxglade-mime.xml" "$datadir/mime/packages/$_pkgname.xml"
    install -dm755 $datadir/{icons/hicolor/,}

    xdg-icon-resource install --noupdate --novendor --size 128 icons/wxglade.png "$_pkgname"
    xdg-icon-resource install --noupdate --size 128 --context mimetypes icons/wxglade.png application-x-wxg

    xdg-icon-resource install --noupdate --novendor --size 32 icons/wxglade.png "$_pkgname"
    xdg-icon-resource install --noupdate --size 32 --context mimetypes icons/wxglade.png application-x-wxg

    install -Dm644 "$_pkgname.desktop" "$datadir/applications/$_pkgname.desktop"
    sed -i "s:wxglade.xpm:$_pkgname.png:" "$datadir/applications/$_pkgname.desktop"
}
