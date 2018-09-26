pkgname=dokku
pkgver=0.12.13
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
  'herokuish>=0.4.4'
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
sha256sums=('2ebb883f207da87eaf34e70a4051d42657fab79e8bcbff64bb4b3daa00403658'
            '09e37fa26884952040f332f5386ce55d803856e0d0f8a42afd4684ade96db8ca')
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
  echo "${pkgver}" > "${pkgdir}/var/lib/dokku/STABLE_VERSION"
}
