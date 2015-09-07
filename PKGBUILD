# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>
# Based on the mailpile-git PKGBUILD
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=mailpile
pkgver=0.5.2
pkgrel=3
pkgdesc="A modern, fast web-mail client with user-friendly encryption and privacy features."
arch=('any')
url="http://www.mailpile.is"
license=('AGPL3')
depends=('gnupg1' 'python2-jinja>=2.6' 'python2-lxml>=2.3.2' 'python2-markupsafe' 'python2-pgpdump' 'python2-pillow' 'python2-pydns' 'spambayes>=1.1a6')
install=${pkgname}.install
source=("https://github.com/pagekite/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('2619dd0711628e25e216bec196d42381e50d45d943a727177f11f8ce89e26004'
            '07adbd61cda225bf11818d39776240ee1077a3f2ddc9e5ef0f11825dd4ca504d')

prepare() {
  cd "${srcdir}/Mailpile-${pkgver}"

  # Set absolute paths for static files
  sed -i "s^('static/^('/usr/share/mailpile/static/^g" mailpile/config.py
  sed -i '/os.path.dirname(              # scripts/d' mp
  sed -i 's^__file__))^"/usr/share/mailpile/mailpile")^g' mp

  # Use gnupg 1.4
  sed -i "s/gpg'/gpg1'/g" mailpile/crypto/gpgi.py
  sed -i "s/gpg /gpg1 /g" mailpile/plugins/crypto_gnupg.py
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
