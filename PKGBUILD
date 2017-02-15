# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_pkgname=FanFicFare
pkgname=fanficfare-git
pkgver=2.9.0.r0.g8cfa65d
pkgrel=1
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
depends=('python2' 'python2-beautifulsoup4' 'python2-chardet' 'python2-html5lib'
         'python2-html2text')
makedepends=('git')
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
    python2 setup.py build

    if [[ -x /usr/bin/calibre-customize ]]; then
        msg2 "Creating and installing FanFicFare calibre plugin..."
        python2 makeplugin.py
        calibre-customize -a FanFicFare.zip || true
    fi
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
