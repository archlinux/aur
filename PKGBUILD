# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=pyrosimple-git
pkgver=2.14.2.r16.gd24655a
pkgrel=1
pkgdesc="An overhauled fork of the pyrocore tools for rTorrent"
arch=('any')
url="https://kannibalox.github.io/pyrosimple/"
license=('GPL-3.0-or-later')
provides=('pyrosimple')
conflicts=('pyrosimple')
depends=(
    'python'
    'python-bencode.py'
    'python-jinja'
    'python-daemon'
    'python-parsimonious'
    'python-prometheus_client'
    'python-prompt_toolkit'
    'python-requests'
    'python-shtab'
    'python-box'
    'python-tomli'
    'python-tomli-w'
    'python-guessit'
    'python-lockfile'
    'python-importlib-metadata'
    'bash'
)
optdepends=(
    'python-apscheduler: pyrotorque support'
    'python-inotify: pyrotorque support'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-poetry-core'
)
checkdepends=('python-pytest')
source=(
    "git+https://github.com/kannibalox/pyrosimple.git"
    "0001-fix-rtcontrol-move-and-set.patch"
    "0002-rtorrent-0.16.patch::https://raw.githubusercontent.com/quentinmit/isz/refs/heads/main/nix/pkgs/pyrosimple/rtorrent-0.16.patch"
)
sha256sums=(
    'SKIP'
    'fd789a533b70a454869079000fc470b2c40923fbdf9157b194704979e2de0970'
    'f6cf4cd0953a2c0640371df7a4a67a4cbc1b3086ce631e538f431831c85de87a'
)


pkgver() {
    cd pyrosimple
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd pyrosimple
    patch -Np1 < ../0001-fix-rtcontrol-move-and-set.patch
    patch -Np1 < ../0002-rtorrent-0.16.patch
}

build() {
    cd pyrosimple
    python -m build --wheel --no-isolation
}

check() {
    cd pyrosimple
    PYTHONPATH="$srcdir/pyrosimple/src" pytest
}

package() {
    cd pyrosimple
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/pyrosimple/"
    install -Dm644 docs/examples/* -t "$pkgdir/usr/share/doc/pyrosimple/examples/"
}

