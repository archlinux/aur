# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=mautrix-googlechat
pkgver=0.3.0
pkgrel=2
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
            'f6693ed10a1d76ef94fdb37801514523ea1809cf0ea71e83c44f5832118237f9'
            '2117e24762e2e8731069020720afff3c6024f506cb6c68c9dd7361262fbcb0e3')

build() {
  cd googlechat-${pkgver}
  python setup.py build
}

package() {
  cd googlechat-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 ${pkgdir}/usr/example-config.yaml ${pkgdir}/etc/mautrix-googlechat/config.yaml
  rm ${pkgdir}/usr/example-config.yaml
  install -Dm755 ${srcdir}/mautrix-googlechat-registration ${pkgdir}/usr/bin/mautrix-googlechat-registration
  install -Dm644 ${srcdir}/mautrix-googlechat.service ${pkgdir}/usr/lib/systemd/system/mautrix-googlechat.service
}
