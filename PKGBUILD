# Maintainer: Yaroslav Nikitenko <metst13 at gmail dot com>

pkgname='yarsync'
pkgver='0.3'
# when a new version of the software is released, this number should be set to 1.
# https://wiki.archlinux.org/title/PKGBUILD#pkgrel
pkgrel=1
pkgdesc="Yet Another Rsync is a file synchronization and backup tool"
url="https://github.com/ynikitenko/yarsync"
depends=('python>=3.6')
makedepends=(python-build python-installer python-wheel rsync python-pytest python-pytest-mock)
license=('GPL3')
arch=('any')
install="yarsync.install"
# We don't use tag hash, because we control the repository and it's easier
source=("$pkgname-$pkgver.tar.gz::https://github.com/ynikitenko/yarsync/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd47811708c3b907eea401077dba3ee8cdc9a397cdd491a162fd74f9f3ebb887')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=("rsync>=3.1.0")
    cd "${srcdir}/${pkgname}-${pkgver}"
    # install egg-info
    python -m installer --destdir="$pkgdir" dist/*.whl
    # install actual source
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cp -r yarsync ${pkgdir}${site_packages}
    # install the manual
    gzip docs/yarsync.1
    install -D docs/yarsync.1.gz ${pkgdir}/usr/share/man/man1/yarsync.1.gz
    # install other documentation
    install -D -t ${pkgdir}/usr/share/doc/yarsync/ NEWS.rst README.rst docs/source/details.rst
}

check() {
    # Users who do not need it can disable it using
    # BUILDENV+=('!check') in PKGBUILD/makepkg.conf
    # or call makepkg with --nocheck flag.
    # https://wiki.archlinux.org/title/Creating_packages#check()
    cd "$srcdir/${pkgname}-$pkgver"
    pytest
}
