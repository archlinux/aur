# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=ugrd
pkgver=2.2.0
pkgrel=2
pkgdesc='Minimalistic POSIX initramfs generator, designed for encrypted systems'
arch=(any)
url='https://github.com/desultory/ugrd'
license=(GPL-2.0-only)
depends=(bash bc pax-utils python python-pycpio python-zenlib)
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=('python-zstandard: zstd cpio compression')
provides=(initramfs)
backup=(etc/ugrd/config.toml)
source=("$url/archive/$pkgver/ugrd-$pkgver.tar.gz")
b2sums=('315ee56b7b24d8a6c43ea7d191ad2287bfdffcc62d6fef55c8321d5ab3e416643af7782ef2d0eef3b5d9daa85973f98c302eadd93c297dca9a710e358fd6495d')

build() {
    cd ugrd-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ugrd-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm755 hooks/kernel-install/52-ugrd.install -t "$pkgdir/usr/lib/kernel/install.d"
    install -Dm755 hooks/alpm/ugrd-install.sh "$pkgdir/usr/share/libalpm/scripts/ugrd-install"
    install -Dm755 hooks/alpm/ugrd-remove.sh "$pkgdir/usr/share/libalpm/scripts/ugrd-remove"
    install -Dm644 hooks/alpm/91-ugrd-install.hook -t "$pkgdir/usr/share/libalpm/hooks"
    install -Dm644 hooks/alpm/60-ugrd-remove.hook -t "$pkgdir/usr/share/libalpm/hooks"

    install -Dm644 examples/example.toml "$pkgdir/etc/ugrd/config.toml"

    install -Dm644 completion/ugrd -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 completion/_ugrd -t "$pkgdir/usr/share/zsh/site-functions"
}
