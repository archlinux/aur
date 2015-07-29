# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>
# Based on the mailpile-git PKGBUILD
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=mailpile
pkgver=0.5.1
pkgrel=1
pkgdesc="A modern, fast web-mail client with user-friendly encryption and privacy features."
arch=('any')
url="http://www.mailpile.is"
license=('AGPL3' 'Apache')
depends=('gnupg' 'python2-jinja>=2.6' 'python2-lxml>=2.3.2' 'python2-markupsafe' 'python2-pgpdump' 'python2-pillow' 'python2-pydns' 'spambayes>=1.1a6')
install=${pkgname}.install
source=("https://github.com/pagekite/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('d7ba2413092ed4c2e7b4ea9af113874e5f939395905d47f981bd38d605302b44'
            '07adbd61cda225bf11818d39776240ee1077a3f2ddc9e5ef0f11825dd4ca504d')

prepare() {
  cd "${srcdir}/Mailpile-${pkgver}"

  # Set absolute paths for static files
  sed -i "s^('static/^('/usr/share/mailpile/static/^g" mailpile/config.py
  sed -i '/os.path.dirname(              # scripts/d' mp
  sed -i 's^__file__))^"/usr/share/mailpile/mailpile")^g' mp
}

build() {
  cd "${srcdir}/Mailpile-${pkgver}"

  # Compile bytecode
  python2 -m compileall -f mailpile
}

package() {
  cd "${srcdir}/Mailpile-${pkgver}"

  install -d "${pkgdir}/usr/share/${pkgname}"

  cp -r static "${pkgdir}/usr/share/${pkgname}/"
  cp -r mailpile "${pkgdir}/usr/share/${pkgname}/"
  cp -r locale "${pkgdir}/usr/share/${pkgname}/"

  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 '{}' ';'
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 '{}' ';'

  install -D mp -t "${pkgdir}/usr/bin"
  install -Dm644 "../${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 et:
