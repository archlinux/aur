pkgname=dokku
pkgver=0.12.10
pkgrel=1
pkgdesc="Docker powered mini-Heroku in around 100 lines of Bash."
arch=(any)
url="https://github.com/dokku/dokku"
license=(MIT)
makedepends=(
  'go'
  'plugn'
)
depends=(
  'bind-tools'
  'docker'
  'gliderlabs-sigil'
  'go'
  'herokuish>=0.4.0'
  'lsb-release'
  'nginx'
  'openbsd-netcat'
  'plugn>=0.3.0'
  'python'
  'sshcommand>=0.7.0'
)
source=(
  "https://github.com/dokku/dokku/archive/v${pkgver}.zip"
  "${pkgname}.install"
)
sha256sums=('13deaebf07db417ec4a93c9d9c6b6463a2c79a3ffc5a3a5453574d6fd4d39465'
            'caa9152e782dbeb1f6176fedab3314cdde737e815998393799a67cc24dd32109')
install=${pkgname}.install

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"

  go get github.com/ryanuber/columnize
  go get github.com/dokku/dokku/plugins/config
  env PLUGIN_MAKE_TARGET=build make go-build
  cp common.mk "${pkgdir}/var/lib/dokku/core-plugins/common.mk"
  cp -r plugins/* "${pkgdir}/var/lib/dokku/core-plugins/available"
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do cd "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}" && if [ -e Makefile ]; then make src-clean; fi; done
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do touch "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}/.core"; done
  rm "${pkgdir}/var/lib/dokku/core-plugins/common.mk"
}
