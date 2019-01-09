# Maintainer: Ayrton Araujo <root@ayr-ton.net>
# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=dokku
pkgver=0.14.0
pkgrel=1
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
sha256sums=('ebcb034eaafdecd4cea5a5a87b81e3e6c4370156c8b9589b2924b2cb51e012da'
            '65175269313c2afcabec038d3994d940b7e60db91be270da11bfefc3febb9452')
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
