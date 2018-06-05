# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>
# Based on the mailpile-git PKGBUILD
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=mailpile
pkgver=1.0.0rc3
pkgrel=1
pkgdesc="A modern, fast web-mail client with user-friendly encryption and privacy features"
arch=('any')
url="http://www.mailpile.is"
license=('AGPL3')
depends=('gnupg' 'python2-appdirs' 'python2-cryptography' 'python2-fasteners' 'python2-jinja>=2.6' 'python2-lxml>=2.3.2' 'python2-markupsafe' 'python2-pbr' 'python2-pgpdump' 'python2-pillow' 'python2-pydns' 'python2-setuptools' 'spambayes>=1.1a6')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mailpile/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('b2fd0d304b0d856588bfa4dae1820c518142ddb443c70aefa3a1d16a3682babf'
            '07adbd61cda225bf11818d39776240ee1077a3f2ddc9e5ef0f11825dd4ca504d')

prepare() {
  cd "${srcdir}/Mailpile-${pkgver}"

  # Set absolute path
  sed -i '5,9c mailpile_root = "/usr/share/mailpile"' mp
}

build() {
  cd "${srcdir}/Mailpile-${pkgver}"

  # Compile bytecode
  python2 -m compileall -f mailpile
}

package() {
  cd "${srcdir}/Mailpile-${pkgver}"

  install -d "${pkgdir}/usr/share/${pkgname}"

  cp -r shared-data/* "${pkgdir}/usr/share/${pkgname}/"
  cp -r mailpile "${pkgdir}/usr/share/${pkgname}/"

  install -D mp -t "${pkgdir}/usr/bin"
  install -Dm644 "../${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 et:
