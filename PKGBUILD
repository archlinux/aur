# Maintainer: Yaroslav Nikitenko <metst13 at gmail dot com>

pkgname='yarsync'
pkgver='0.2'
pkgrel=1
pkgdesc="Yet Another Rsync is a file synchronization and backup tool"
url="https://github.com/ynikitenko/yarsync"
depends=('python' 'man-db')
makedepends=(python-build python-installer python-wheel)
license=('GPL3')
arch=('any')
install="yarsync.install"
# We don't use tag hash, because we control the repository and it's easier
source=("$pkgname-$pkgver.tar.gz::https://github.com/ynikitenko/yarsync/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e877674bfd675ef6d77855e381ae9da7851623ee192ad2725e25099a227da54')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=("rsync>=3.1.0")
    cd "${srcdir}/${pkgname}-${pkgver}"
    # install egg-info
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    # install actual source
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cp -r yarsync ${pkgdir}${site_packages}
    gzip docs/yarsync.1
    install -D docs/yarsync.1.gz ${pkgdir}/usr/share/man/man1/yarsync.1.gz
}

check() {
    cd "$srcdir/${pkgname}-$pkgver"
    pytest
}
