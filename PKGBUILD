# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Zen <dev@pyl.onl>

pkgname=ugrd
pkgver=2.0.2
pkgrel=1
pkgdesc='Minimalistic POSIX initramfs generator, designed for encrypted systems'
arch=('any')
url="https://github.com/desultory/$pkgname"
license=('GPL-2.0-only')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('bc' 'pax-utils' 'python' 'python-pycpio' 'python-zenlib')
optdepends=('python-zstandard: zstd cpio compression')
provides=('initramfs')
backup=("etc/$pkgname/config.toml")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('31a8307fc1e516c94eac5a75ff70e10adcec041359d065fcb24e708f3578b219907ce8144a6d8ad0fb168127040c620cb5bbdcdaedd9e9dd86a61ff72fb7ce00')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 examples/example.toml "$pkgdir/etc/$pkgname/config.toml"
    install -Dm644 hooks/alpm/91-ugrd.hook "$pkgdir/usr/share/libalpm/hooks/91-$pkgname.hook"
    install -Dm644 completion/ugrd "$pkgdir/usr/share/bash-completion/completions/ugrd"
    install -Dm644 completion/_ugrd "$pkgdir/usr/share/zsh/site-functions/_ugrd"
}
