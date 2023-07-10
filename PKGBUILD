# Maintainer: Premysl Srubar <premysl.srubar at gmail com>
pkgname=elitech-datareader-git
_pkgname="${pkgname%-git}"
pkgver=v0.9.4.r32.g55a2863
pkgrel=2
pkgdesc="Data collecting tool for Temperature data logger RC-4/RC-5 and Temperature and Humidity data logger RC-4HC."
arch=('any')
url="https://github.com/civic/elitech-datareader"
license=("MIT")
depends=('python-six>=1.9.0' 'python-pyserial>=2.7')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${pkgname}::git+${url}.git"
        "$_pkgname.install"
        "51-elitech-RC.rules")
sha256sums=('SKIP'
            '195e70a1304d95d22f9490fe842da27be065f823b7ae68efbefe3756067a2885'
            'ddaa3a01f7b219968cfc4255b54482a20398cb1e917c5abc97be66e7a55d6e0c')

install=$_pkgname.install

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {  
  cd "$srcdir/${pkgname}"
  python setup.py build
}

package() {
    cd "$srcdir/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -v -m 644 -D "${srcdir}/51-elitech-RC.rules" "${pkgdir}/etc/udev/rules.d/51-elitech-RC.rules"
}

