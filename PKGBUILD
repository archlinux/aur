# Maintainer: Ayrton Araujo <root@ayr-ton.net>
# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=dokku
pkgver=0.14.3
pkgrel=1
pkgdesc="Docker powered mini-Heroku in around 100 lines of Bash."
arch=(any)
url="https://github.com/dokku/dokku"
license=(MIT)
depends=(
  'bind-tools'
  'docker'
  'go'
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
sha256sums=('2fe1c89fef393982e5715c7123052fea290ba2a9c856dba0be276d610e0c5c4f'
            'c2d7561e5e9931b13421af629672fe417ab36db0f803cadacbf3614507cc0601')
install="${pkgname}.install"

prepare() {
  # Setup go directory
  mkdir -p gopath/src/github.com/dokku
  ln -rTsf "${srcdir}/${pkgname}-${pkgver}" "gopath/src/github.com/dokku/${pkgname}"
  export GOPATH="${srcdir}/gopath"

  # Get go dependencies
  go get github.com/ryanuber/columnize
}

package() {
  export GOPATH="${srcdir}/gopath"

  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install executable
  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"

  # Add .core and build go plugins
  for plugin in plugins/*; do
    if [ -e "${plugin}/Makefile" ]; then make -C "${plugin}" build; fi
    touch .core
  done

  # Clean go plugins
  for plugin in plugins/*; do
    if [ -e "${plugin}/Makefile" ]; then make -C "${plugin}" src-clean; fi
  done

  # Move all files in place
  mkdir -p "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp -r plugins/* "${pkgdir}/var/lib/dokku/core-plugins/available"

  # Version
  echo $pkgver > "${pkgdir}/var/lib/dokku/VERSION"
}
