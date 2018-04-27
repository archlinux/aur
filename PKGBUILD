pkgname=dokku
pkgver=0.12.5
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
sha256sums=('6d24045a6230acf4e707a89d65cd49565a712478c1bfeb1af1152fb774e9fdfb'
            '3d5a12c09fdc25dce99961ee33df0a0d22c26a53e6307eb52c4d728c46a36698')
install=${pkgname}.install

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"

  go get github.com/ryanuber/columnize
  go get github.com/dokku/dokku/plugins/config
  env PLUGIN_MAKE_TARGET=build make go-build
  mkdir -p "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp common.mk "${pkgdir}/var/lib/dokku/core-plugins/common.mk"
  cp -r plugins/* "${pkgdir}/var/lib/dokku/core-plugins/available"
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do cd "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}" && if [ -e Makefile ]; then make src-clean; fi; done
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do touch "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}/.core"; done
  rm "${pkgdir}/var/lib/dokku/core-plugins/common.mk"
}
