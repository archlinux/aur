# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=ugrd
pkgver=2.1.0
pkgrel=1
pkgdesc='Minimalistic POSIX initramfs generator, designed for encrypted systems'
arch=('any')
url="https://github.com/desultory/ugrd"
license=('GPL-2.0-only')
depends=('bc' 'pax-utils' 'python' 'python-pycpio' 'python-zenlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-zstandard: zstd cpio compression')
provides=('initramfs')
backup=("etc/ugrd/config.toml")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('b94a04403f83102b6ae4a120ebed64b3291051b0876143abea5610265428f6cc9e8e5f0b5bfdfbaa1d4336fe900e53cdcc432234e51cfab6c16c763f2bc9bf6c')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 examples/example.toml "$pkgdir/etc/ugrd/config.toml"
    install -Dm644 hooks/alpm/91-ugrd.hook -t "$pkgdir/usr/share/libalpm/hooks"
    install -Dm644 completion/ugrd -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 completion/_ugrd -t "$pkgdir/usr/share/zsh/site-functions"
}
