# Maintainer: Ayrton Araujo <root@ayr-ton.net>
# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=dokku
pkgver=0.14.2
pkgrel=2
pkgdesc="Docker powered mini-Heroku in around 100 lines of Bash."
arch=(any)
url="https://github.com/dokku/dokku"
license=(MIT)
depends=(
  'bind-tools'
  'docker'
  'gliderlabs-sigil'
  'herokuish'
  'net-tools'
  'nginx'
  'plugn'
  'procfile-util'
  'rsyslog'
  'sshcommand'
)
source=(
  "https://github.com/dokku/dokku/archive/v${pkgver}.zip"
  "${pkgname}.install"
)
sha256sums=('39c4ba9c8a84f60f21bbf4cadd80a9af76e348ee01b0a0843ef614a1253e9674'
            '391a0a4ee19fabff11e6ea73425c6ebfe8a9a1f240d228891b97d4b3207a6851')
install="${pkgname}.install"

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install executable
  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"

  # Build go plugins
  make go-build

  # Move all files in place
  mkdir -p "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp -r plugins/* "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp common.mk "${pkgdir}/var/lib/dokku/core-plugins/common.mk"

  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do
    # Clean plugins
    cd "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}"
    if [ -e Makefile ]; then make src-clean ;fi

    touch "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}/.core"
  done
  rm "${pkgdir}/var/lib/dokku/core-plugins/common.mk"

  # Version
  echo $pkgver > "${pkgdir}/var/lib/dokku/VERSION"
}
