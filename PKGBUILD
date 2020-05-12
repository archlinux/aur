# Maintainer: Ayrton Araujo <root@ayr-ton.net>
# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=dokku
pkgver=0.20.4
pkgrel=1
pkgdesc="Docker-powered PaaS that helps build and manage the lifecycle of applications"
arch=(any)
url="https://github.com/dokku/dokku"
license=(MIT)
depends=(
  'bind-tools'
  'cpio'
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
sha256sums=('82a03d0795ff1029b38760b096be3eedd993c7c7c66e8b9b5347ca6bbe81aa41'
            '17eeb4e092b1bc2bcd904242cd9c11493fc68bb030061da1044d955bb319bd8a')
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
  cp -R plugins/* "${pkgdir}/var/lib/dokku/core-plugins/available"

  # Version
  echo $pkgver > "${pkgdir}/var/lib/dokku/VERSION"
}
