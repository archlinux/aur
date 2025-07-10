# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sysdweb
pkgver=1.1.7
pkgrel=1
pkgdesc='Control systemd services through Web or REST API'
arch=('any')
url='https://github.com/ogarcia/sysdweb'
license=('GPL-3.0-or-later')
depends=('python-bottle' 'python-dbus' 'python-pam' 'python-systemd')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
backup=("etc/${pkgname}.conf")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1cec7d8cd9237a4ea8555446ad9a3a784c380b2b5779e8018d4af221efb42572')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  # config file
  install -D -m644 "${pkgname}.conf" \
    "${pkgdir}/etc/${pkgname}.conf"

  # doc file
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # service files
  install -D -m644 "systemd/${pkgname}-system.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 "systemd/${pkgname}-user.service" \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
}
