# Maintainer: Jonathan Wright <jon@than.io>
pkgname=journey-bin
pkgver=0.1.9
pkgrel=1
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
sha256sums_i686=('09f903f28f7a3ac15c5df00342c7754d72da537af13f4fd2b656dbe5efe603c6')
source_x86_64=("https://github.com/kabukky/${pkgname/-bin/}/releases/download/v${pkgver}/${pkgname/-bin/}-linux-amd64.zip")
sha256sums_x86_64=('67d6280716a0e74d2daa03039d8544e6643b241d03f0e56da3cc23d21ab09b36')

package() {
  if [[ "${CARCH}" == "i686" ]]; then
    cd ${srcdir}/${pkgname/-bin/}-linux-386
  elif [[ "${CARCH}" == "x86_64" ]]; then
    cd ${srcdir}/${pkgname/-bin/}-linux-amd64
  fi

  # Binary, configuration, and service Unit file
  install -Dm755 journey ${pkgdir}/opt/journey/journey
  install -Dm644 config.json ${pkgdir}/opt/journey/config.json
  install -Dm644 ${srcdir}/journey.service ${pkgdir}/usr/lib/systemd/system/journey.service
  # Licence
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licences/${pkgname}/LICENSE.md
  # Private files for journey's Admin area and the persistant data for the blog
  cp -ar built-in ${pkgdir}/opt/journey/
  cp -ar content ${pkgdir}/opt/journey/
  # Make sure there is absolutly no way the SQLite database can ever make it
  # into the package and overwrite the local copy during upgrade
  rm -f ${pkgdir}/opt/journey/content/data/journey.db
}
