# Maintainer: Ayrton Araujo <root@ayr-ton.net>
# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=dokku
pkgver=0.19.8
pkgrel=1
pkgdesc="Docker powered mini-Heroku in around 100 lines of Bash."
arch=(any)
url="https://github.com/dokku/dokku"
license=(MIT)
depends=(
  'bind-tools'
  'docker'
  'dos2unix'
  'go'
  'gliderlabs-sigil'
  'herokuish'
  'net-tools'
  'nginx'
  'openbsd-netcat'
  'plugn'
  'procfile-util'
  'rsyslog'
  'sshcommand'
)
source=(
  "https://github.com/dokku/dokku/archive/v${pkgver}.zip"
  "${pkgname}.install"
)
sha256sums=('5a286b9ba41c5bd349bfee847392b12c6e83aeae6061139407418322abdce438'
            '96c17e8db0b0247b1cf17d850290032e0e5ec2ef8fcb11d61067263fdf49159e')
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
