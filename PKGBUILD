# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_pkgname=FanFicFare
pkgname=fanficfare-git
pkgver=3.27.0.r10.g19af3ea7
pkgrel=1
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
depends=('python' 'python-beautifulsoup4' 'python-chardet' 'python-cloudscraper' 'python-html5lib'
         'python-html2text')
makedepends=('git')
optdepends=('python-pillow: support for converting/resizing story images and covers')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build

    if command -v calibre-customize > /dev/null; then
        msg2 "Creating and installing FanFicFare calibre plugin..."
        python makeplugin.py
        calibre-customize -a FanFicFare.zip || true
    fi
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
