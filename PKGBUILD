pkgname=dokku
pkgver=0.12.4
pkgrel=1
pkgdesc="Docker powered mini-Heroku in around 100 lines of Bash."
arch=(any)
url="https://github.com/dokku/dokku"
license=(MIT)
makedepends=(
  'plugn'
)
depends=(
  'docker'
  'nginx'
  'plugn>=0.3.0'
  'sshcommand>=0.7.0'
  'herokuish>=0.4.0'
  'openbsd-netcat'
  'gliderlabs-sigil'
  'lsb-release'
  'bind-tools'
  'python'
)

source=(
  "https://github.com/dokku/dokku/archive/v${pkgver}.zip"
  "${pkgname}.install"
)
sha256sums=('d0691ce285c2e054c43ec09a6c76de0b1d22617059f8af3a8ed15817462665f6'
            '3d5a12c09fdc25dce99961ee33df0a0d22c26a53e6307eb52c4d728c46a36698')
install=${pkgname}.install

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"

  make go-build
  mkdir -p "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp common.mk "${pkgdir}/var/lib/dokku/core-plugins/common.mk"
  cp -r plugins/* "${pkgdir}/var/lib/dokku/core-plugins/available"
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do cd "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}" && if [ -e Makefile ]; then make src-clean; fi; done
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do touch "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}/.core"; done
  rm "${pkgdir}/var/lib/dokku/core-plugins/common.mk"
}
