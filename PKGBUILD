# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=mautrix-googlechat
pkgver=0.3.0
pkgrel=1
pkgdesc="A Matrix-Google Chat puppeting bridge."
url="https://github.com/mautrix/googlechat"
depends=(python
         python-aiohttp
         python-asyncpg
         python-commonmark
         python-magic-git
         python-mautrix
         python-olm
         python-protobuf
         python-pycryptodome
         python-ruamel-yaml
         python-unpaddedbase64
         python-yarl)
makedepends=(python-setuptools)
license=(AGPLv3)
arch=(any)
install="${pkgname}.install"
source=("https://github.com/mautrix/googlechat/archive/refs/tags/v${pkgver}.tar.gz"
        "mautrix-googlechat-registration"
        "mautrix-googlechat.service")
sha256sums=('82c2b3c5acea8a85b0753ccb9c67576b42680f37312832fee537492a9363814e'
            'fe7b3a6b600d8ed79f55bd15cb1dab2ff52b06b7a0a33b76057d9d2adfa32249'
            'ae59346bae9bc0601714068b236fdbfbab6a9c363fe11207d01acc8a28f1194a')

build() {
  cd googlechat-${pkgver}
  python setup.py build
}

package() {
  cd googlechat-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm664 ${pkgdir}/usr/example-config.yaml ${pkgdir}/etc/synapse/mautrix-googlechat/config.yaml
  rm ${pkgdir}/usr/example-config.yaml
  install -Dm755 ${srcdir}/mautrix-googlechat-registration ${pkgdir}/usr/bin/mautrix-googlechat-registration
  install -Dm644 ${srcdir}/mautrix-googlechat.service ${pkgdir}/usr/lib/systemd/system/mautrix-googlechat.service
}
