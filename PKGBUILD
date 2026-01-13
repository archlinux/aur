# Maintainer: Yaroslav Nikitenko <metst13 at gmail dot com>

pkgname='yarsync'
pkgver='0.3.3'
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
# source=("$pkgname-$pkgver.tar.gz::file://yarsync-$pkgver.tar.gz")
sha256sums=('fd9fbe39b3d0a144f42914f47094d38091cf4f6299b51cb7ea48afdbf93eb768')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=("rsync>=3.1.0")
    cd "${srcdir}/${pkgname}-${pkgver}"
    # install egg-info
    python -m installer --destdir="$pkgdir" dist/*.whl
    # this is not needed, since we already have an installer.
    # # install actual source
    # local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    # cp -r yarsync ${pkgdir}${site_packages}
    #
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
    # simply 'pytest' will give relative import errors
    python -m pytest
}
