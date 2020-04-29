pkgname=python-pylgbst
_module=pylgbst
pkgver=1.1.1
pkgrel=1
pkgdesc="LEGO Boost python module"
url="https://github.com/undera/pylgbst"
depends=('python' 'python-pygatt' 'bluez-utils-compat')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/undera/pylgbst/archive/$pkgver.tar.gz")
sha256sums=('141df597a05ed1a4e953d14f2f9e64ec35ec9adc9d13581242914ce485d5ca65')

# sudo setcap 'cap_net_raw,cap_net_admin+eip' /usr/bin/hcitool
# required to work without root permissions

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    # do not reset adapter, so root not required
    sed -i 's|adapter.start()|adapter.start(False)|' pylgbst/comms/cpygatt.py
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -dm0755 "$pkgdir"/usr/share/doc
    cp -a docs "$pkgdir"/usr/share/doc/${_module}
    cp -a examples "$pkgdir"/usr/share/doc/${_module}/examples
}
