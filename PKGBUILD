# Maintainer: Martin Mlynář <nexus+arch@smoula.net>
pkgname=dokku
pkgver=0.4.13
pkgrel=3
pkgdesc="Docker powered mini-Heroku in around 100 lines of Bash."
arch=(any)
url="https://github.com/dokku/dokku"
license=(MIT)
depends=(
	'docker'
	'nginx'
	'plugn'
	'sshcommand'
	'herokuish'
)

source=(
#  "https://github.com/dokku/dokku/archive/v${pkgver}.zip"
  "https://github.com/MorrisJobke/dokku/archive/arch-linux.zip"
  "${pkgname}.install"
)
sha256sums=('a34a343e7bfbfb139f8af2a529b56d2d74dda94c373ace631e7ce5a87623605d'
            'c0da69c7b9fd1dafc0e125863aaba5483d08410a1ecc6e666010856709c4fe0a')
install=${pkgname}.install

package() {
  cd "${srcdir}/"

  #cd "$pkgname"
  cd "dokku-arch-linux"
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
