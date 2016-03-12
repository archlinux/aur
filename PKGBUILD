# Maintainer: Morris Jobke <hey AT morrisjobke.de>
# Maintainer: Martin Mlynář <nexus+arch@smoula.net>
pkgname=dokku
pkgver=0.4.14
pkgrel=4
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
	'plugn'
	'sshcommand'
	'herokuish'
	'openbsd-netcat'
	'gliderlabs-sigil'
	'lsb-release'
)

source=(
#  "https://github.com/dokku/dokku/archive/v${pkgver}.zip"
  "https://github.com/MorrisJobke/dokku/archive/v0.4.14-arch-linux.zip"
  "${pkgname}.install"
)
sha256sums=('41894fc85399c6cf6d03e6cb15c2291dfc7fb83cfafd15fddcf28754effd0444'
            'cf71d82c16a4cc7a252eb8853a0ab2efea32d1f78c3f483778cbf7cd73d3b8eb')
install=${pkgname}.install

package() {
  cd "${srcdir}/"

  #cd "$pkgname"
  cd "dokku-0.4.14-arch-linux"
  CORE_PLUGINS_PATH="${pkgdir}/var/lib/dokku/core-plugins/"
  PLUGINS_PATH="${pkgdir}/var/lib/dokku/plugins/"
  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"

  mkdir -p ${CORE_PLUGINS_PATH} ${PLUGINS_PATH}
  test -d ${CORE_PLUGINS_PATH}/enabled || PLUGIN_PATH=${CORE_PLUGINS_PATH} plugn init
  test -d ${PLUGINS_PATH}/enabled || PLUGIN_PATH=${PLUGINS_PATH} plugn init
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do \
    rm -Rf ${CORE_PLUGINS_PATH}/available/$plugin && \
    rm -Rf ${PLUGINS_PATH}/available/$plugin && \
    rm -rf ${CORE_PLUGINS_PATH}/$plugin && \
    rm -rf ${PLUGINS_PATH}/$plugin && \
    cp -R plugins/$plugin ${CORE_PLUGINS_PATH}/available && \
    ln -s ${CORE_PLUGINS_PATH}/available/$plugin ${PLUGINS_PATH}/available; \
    find "$pkgdir"/var/lib/dokku/ -xtype l -delete;\
    PLUGIN_PATH=${CORE_PLUGINS_PATH} plugn enable $plugin ;\
    PLUGIN_PATH=${PLUGINS_PATH} plugn enable $plugin ;\
    done
}
