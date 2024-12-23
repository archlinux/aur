# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Julian Haas <archlinux at {first name}-{last name} dot de>

_srcname=i3-gnome-pomodoro
pkgname=$_srcname-git
pkgver=0.1.0.r92.7fe1895
pkgrel=2
epoch=1
pkgdesc="Integrate gnome-pomodoro into i3"
arch=('any')
url="https://github.com/kantord/i3-gnome-pomodoro"
license=('GPL-3.0-or-later')
depends=(
    'gnome-shell-pomodoro'
    'python'
    'python-click>=6.7'
    'python-gobject>=3.32.1'
    'python-i3ipc>=1.3.0'
    'python-pydbus>=0.6.0'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-poetry'
    'python-wheel'
)
optdepends=('python-blinkstick')
provides=("$_srcname")
conflicts=("$_srcname")
source=("$pkgname-$pkgver::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname-$pkgver

    local _version=$(grep -e ^version pyproject.toml | sed -e 's/^.*"\(.*\)"$/\1/g')
    local _revision=$(git rev-list --count HEAD)
    local _commit=$(git rev-parse --short HEAD)

    printf "%s.r%s.%s\n" $_version $_revision $_commit
}

build() {
    cd $srcdir/$pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
