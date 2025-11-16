# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=lorax
_pkgver=43.9-1
pkgver=44.3.1
pkgrel=1
pkgdesc="Tools for creating images, including the Anaconda boot.iso, live disk images, iso's, and filesystem images."
arch=('any')
url="https://github.com/weldr/lorax"
license=('GPL-2.0-only')
depends=(
    'python'
    'python-mako'
    'dnf5'
    'python-selinux'
    'python-psutil'
    'python-pycdio'
    'python-pykickstart'
    'rpm-tools'
    'isomd5sum'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'tar'
    'sed'
)
backup=('etc/lorax/lorax.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/weldr/lorax/archive/refs/tags/lorax-${_pkgver}.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('d88e5fc5561e413a712c0b8afb528bd60a04973cfc862374cb49e6915ee5552491d813ae7e0f42a448e891a0f40da13713949dd39d8cb0f09b01f56bdf854dec')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D src/bin/* -t "$pkgdir/usr/bin/"
    install -Dm644 docs/man/*.1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 etc/lorax.conf -t "$pkgdir/etc/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/$pkgname/"
    sed -i 's/grub2-mkimage/grub-mkimage/g' share/templates.d/99-generic/live/x86.tmpl
    sed -i 's/grub2-mkimage/grub-mkimage/g' share/templates.d/99-generic/x86.tmpl
    cp -r share/templates.d "$pkgdir/usr/share/$pkgname/"
}
