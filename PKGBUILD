# Maintainer: Morris Jobke <hey AT morrisjobke.de>
# Maintainer: Martin Mlynář <nexus+arch@smoula.net>
pkgname=dokku
pkgver=0.11.6
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
sha256sums=('35f24644a287d58a1aaf6205d33ffccbbf3725ed93d73d9a4b46eea8e234b6b1'
            'bef43a69c56acf0b927cb5c1b92ef60044f7c963ce04cfd28d2f2c5ee2320afe')
install=${pkgname}.install

package() {
  cd "${srcdir}/"

  cd "$pkgname-$pkgver"

  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"

  make go-build
  mkdir -p "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp common.mk "${pkgdir}/var/lib/dokku/core-plugins/common.mk"
  cp -r plugins/* "${pkgdir}/var/lib/dokku/core-plugins/available"
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do cd "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}" && if [ -e Makefile ]; then make src-clean; fi; done
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do touch "${pkgdir}/var/lib/dokku/core-plugins/available/${plugin}/.core"; done
  rm "${pkgdir}/var/lib/dokku/core-plugins/common.mk"
}
