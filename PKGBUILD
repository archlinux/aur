# Maintainer: Zen <dev@pyl.onl>
# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=ugrd-git
pkgver=2.2.0.r0.gdd2a615
pkgrel=1
pkgdesc='Minimalistic POSIX initramfs generator, designed for encrypted systems'
arch=(any)
url='https://github.com/desultory/ugrd'
license=(GPL-2.0-only)
depends=(bash bc pax-utils python python-pycpio python-zenlib)
makedepends=(git python-build python-installer python-setuptools python-wheel)
optdepends=('python-zstandard: zstd cpio compression')
provides=(initramfs ugrd)
conflicts=(ugrd)
backup=(etc/ugrd/config.toml)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd ugrd
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ugrd
    git clean -dfx
}

build() {
    cd ugrd
    python -m build --wheel --no-isolation
}

package() {
    cd ugrd
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
