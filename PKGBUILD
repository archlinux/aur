# Maintainer: Yaroslav Nikitenko <metst13 at gmail dot com>

pkgname='yarsync'
pkgver='0.1.1'
pkgrel=1
pkgdesc="Yet Another Rsync is a file synchronization and backup tool"
url="https://github.com/ynikitenko/yarsync"
depends=('python' 'man-db')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
install="yarsync.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ynikitenko/yarsync/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c306c737ba96c315d6c89b7fab875eb1253527ef954f0facf1c15db72ed44c8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=("rsync>=3.1.0")
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    # copy source files manually
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cp -r yarsync ${pkgdir}${site_packages}
    install -D docs/yarsync.1.gz ${pkgdir}/usr/share/man/man1/yarsync.1.gz
}

# https://wiki.archlinux.org/title/Arch_package_guidelines#Package_sources
# git rev-parse "v$pkgver"
# does not work.
# _tag=2d5f190ce73f7d9ee4483ffd8d8d5181cbeecc1e
# source=(git+$url.git?signed\#tag=$_tag)
#
# --upgrade build is recommended on
# https://packaging.python.org/en/latest/tutorials/packaging-projects/#generating-distribution-archives
# we don't create a wheel, because it requires python-installer and takes time.
# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
# python -m installer --destdir="$pkgdir" dist/*.whl
# --skip-build is fine,
# https://wiki.archlinux.org/title/Python_package_guidelines#setuptools_or_distutils
# https://wiki.archlinux.org/title/Arch_package_guidelines
