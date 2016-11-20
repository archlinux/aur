# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sysdweb
pkgver=0.2
pkgrel=2
pkgdesc='Control systemd services through Web or REST API'
arch=('any')
url='https://github.com/ogarcia/sysdweb'
license=('GPL')
depends=('python-bottle' 'python-dbus')
makedepends=('python-setuptools')
backup=("etc/${pkgname}.conf")
source=("https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('754c9824c56611ff930256c3e230315bf2c59125f56a1dce45b7cccb6b62ed4f'
            '14764eebefa1a1037f915033cc3523a9140cd5066287315c8997cde5551a0148')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/${pkgname}.patch"
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize='1'

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
