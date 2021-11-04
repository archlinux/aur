# Maintainer: calesanz <contrib at calesanz dot me>

_pkgname='python-vula'
pkgname="${_pkgname}-git"
pkgrel=1
pkgver=0.1.12
pkgdesc='automatic local network encryption (includes vula_libnss)'
arch=('x86_64')
url='https://codeberg.org/vula/vula'
_nssaltfiles_name=nss-altfiles
_nssaltfiles_commit=9078c543ba7d2bc5011737675b3dddb882673ce
_nssaltfiles_url=https://github.com/flatcar-linux/nss-altfiles
license=('GPL3')
depends=('python'
        'wireguard-tools'
       	'python-yaml'
       	'python-click'
       	'python-pynacl'
       	'python-schema'
       	'python-pip'
       	'python-pydbus'
       	'python-pyroute2'
       	'python-pytest-runner'
       	'python-pytest'
       	'python-toml'
       	'python-py'
       	'python-packaging'
       	'python-pluggy'
       	'python-hkdf'
       	'python-ifaddr'
       	'python-cryptography'
       	'python-dbus'
       	'python-pygments'
       	'python-systemd'
       	'python-qrcode'
       	'python-zeroconf'
        'python-sibc'
        )
makedepends=('git' 'python-setuptools')
optdepends=()
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}.git#tag=v${pkgver}" 
        "pyroute2_version.patch"
        "${_nssaltfiles_name}::git+${_nssaltfiles_url}.git#commit=${_nssaltfiles_commit}")
sha256sums=('SKIP'
            'ec81ae64841ed1eda1ae19fab53f0a767091bdb0e6e87801a2f3f3dafa60b647'
            'SKIP')

install=vula.install

prepare() {
  cd "${_pkgname}"
  patch --forward --strip=1 --input="${srcdir}/pyroute2_version.patch"
}

build() {
  cd "${_pkgname}"
  python setup.py build

# Next step builds vula libnss
  cd "${srcdir}/${_nssaltfiles_name}"
  ./configure --with-types=hosts --with-module-name='vula' --datadir=/var/lib/vula-organize/
  make
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'

  cd "${srcdir}/${_nssaltfiles_name}"
  make LIBDIR=/usr/lib DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}_libnss" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}_libnss" 'COPYING'
}

# vim: ts=2 sw=2 et:
