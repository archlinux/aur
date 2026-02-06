# Maintainer: Keithsel <keithsel@disroot.org>
pkgname=dekl-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Declarative Arch Linux system manager - packages, dotfiles, services'
arch=('any')
url='https://github.com/Keithsel/dekl'
license=('MIT')
depends=(
    'pacman'
    'python'
    'python-typer'
    'python-yaml'
    'python-rich'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatchling'
)
optdepends=(
    'paru: AUR support'
    'yay: AUR support'
)
provides=('dekl')
conflicts=('dekl')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
        printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
