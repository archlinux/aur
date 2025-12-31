# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=ugrd
pkgver=2.0.2
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
b2sums=('31a8307fc1e516c94eac5a75ff70e10adcec041359d065fcb24e708f3578b219907ce8144a6d8ad0fb168127040c620cb5bbdcdaedd9e9dd86a61ff72fb7ce00')

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
