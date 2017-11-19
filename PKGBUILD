# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>
# Based on the mailpile-git PKGBUILD
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=mailpile
pkgver=1.0.0rc1
pkgrel=1
pkgdesc="A modern, fast web-mail client with user-friendly encryption and privacy features."
arch=('any')
url="http://www.mailpile.is"
license=('AGPL3')
depends=('gnupg' 'python2-appdirs' 'python2-cryptography' 'python2-jinja>=2.6' 'python2-lxml>=2.3.2' 'python2-markupsafe' 'python2-pbr' 'python2-pgpdump' 'python2-pillow' 'python2-pydns' 'python2-setuptools' 'spambayes>=1.1a6')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.zip::https://github.com/mailpile/Mailpile/archive/88ae8e5831dddc628c827c44224166dbdbed91f1.zip"
        #"https://github.com/mailpile/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('7eeb45c261341dce5b3d56fecd1799825fc914b5a4392a3cbcc0c4b53c00fae5'
            '07adbd61cda225bf11818d39776240ee1077a3f2ddc9e5ef0f11825dd4ca504d')

prepare() {
  cd "${srcdir}/Mailpile-"*

  # Set absolute path
  sed -i '5,9c mailpile_root = "/usr/share/mailpile"' mp
}

build() {
  cd "${srcdir}/Mailpile-"*

  # Compile bytecode
  python2 -m compileall -f mailpile
}

package() {
  cd "${srcdir}/Mailpile-"*

  install -d "${pkgdir}/usr/share/${pkgname}"

  cp -r shared-data/* "${pkgdir}/usr/share/${pkgname}/"
  cp -r mailpile "${pkgdir}/usr/share/${pkgname}/"

  install -D mp -t "${pkgdir}/usr/bin"
  install -Dm644 "../${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 et:
