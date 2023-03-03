# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=pypeek-git
_pkgname="${pkgname%-git}"
pkgver=r1540.4e0fce8
pkgrel=4
pkgdesc="Simple animated GIF screen recorder with an easy to use interface"
arch=(any)
url="https://github.com/firatkiral/pypeek"
license=('GPL3')
depends=('python' 'python-requests' 'pyside6' 'ffmpeg')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'gendesk')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # install icon
    install -Dm644 "src/$_pkgname/icon/peek.png" "$pkgdir/usr/share/pixmaps/pypeek.png"
    # generate desktop entry
    gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" --exec="$_pkgname" --categories=Utility --icon "$_pkgname"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
