# Maintainer: Jonathan Wright <jon@than.io>
pkgname=journey-bin
pkgver=0.2.0
pkgrel=2
pkgdesc='Ghost-compatible blogging platform written in golang'
url='https://kabukky.github.io/journey/'

arch=('i686' 'x86_64')
conflicts=('journey' 'journey-git')
provides=("${pkgname%-bin}")
license=('MIT')

options=('emptydirs')
backup=('opt/journey/config.json')
install='journey.install'

source=('journey.service'
        'journey.install')
sha256sums=('71ff0fd4afd25bcc9e91fe2f9d9f9b8dd89884081e05c93bbd5f3c4c84b71428'
            '20b809dbe7553acbd940c6bd0a83b6b529d3ebc8fa5c4ac20ae74c1bb7c6b22c')
source_i686=("https://github.com/kabukky/${pkgname/-bin/}/releases/download/v${pkgver}/${pkgname/-bin/}-linux-386.zip")
sha256sums_i686=('a0b1a73cafe024260ba46202a1542eea47428763bdb41fb677e609aee329fe1b')
source_x86_64=("https://github.com/kabukky/${pkgname/-bin/}/releases/download/v${pkgver}/${pkgname/-bin/}-linux-amd64.zip")
sha256sums_x86_64=('ba25e0658a9ae9b959c690a797318c8c8991f25544c868cfd3e332f1a57ae372')

package() {
  cd ${srcdir}

  # Binary, configuration, and service Unit file
  install -Dm755 journey ${pkgdir}/opt/journey/journey
  install -Dm644 config.json ${pkgdir}/opt/journey/config.json
  install -Dm644 ${srcdir}/journey.service ${pkgdir}/usr/lib/systemd/system/journey.service
  # License
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  # Private files for journey's Admin area and the persistant data for the blog
  cp -ar built-in ${pkgdir}/opt/journey/
  cp -ar content ${pkgdir}/opt/journey/
  # Make sure there is absolutly no way the SQLite database can ever make it
  # into the package and overwrite the local copy during upgrade
  rm -f ${pkgdir}/opt/journey/content/data/journey.db
}
