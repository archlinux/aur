# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=dokku
pkgver=0.34.4
pkgrel=1
pkgdesc='Docker-powered PaaS that helps build and manage the lifecycle of applications'
arch=('x86_64')
url='https://github.com/dokku/dokku'
license=('MIT')
depends=(
  'bash-completion'
  'bind'
  'cpio'
  'curl'
  'docker'
  'docker-compose'
  'docker-container-healthchecker'
  'docker-image-labeler'
  'dos2unix'
  'git'
  'go'
  'gliderlabs-sigil'
  'herokuish'
  'inetutils'
  'jq'
  'man-db'
  'netrc'
  'net-tools'
  'nginx'
  'openbsd-netcat'
  'parallel'
  'plugn'
  'procfile-util'
  'rsync'
  'rsyslog'
  'sudo'
  'sshcommand'
  'unzip'
)
source=("${url}/archive/v${pkgver}.zip"
        "${pkgname}.install"
        "LICENSE")
sha256sums=('41c38226d13234ac4bb25a9245a19a82b10a3a5bd9a728e2d4feccf09f6cded4'
            '743c53127dc91c660a2aa0ff94cf8faa6aa763c6e76c5696438c97a5c97bd199'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')
install="${pkgname}.install"

build() {
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${pkgname}-${pkgver}"

  # Add .core and build go plugins
  for plugin in plugins/*; do
    if [ -e "${plugin}/Makefile" ]; then make -C $plugin build; fi
    touch "${plugin}/.core"
  done

  # Clean go plugins
  for plugin in plugins/*; do
    if [ -e "${plugin}/Makefile" ]; then make -C $plugin src-clean; fi
  done
}

package() {
  cd "${srcdir}"

  # Install executable and license
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Move all files in place
  mkdir -p "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp -R "${srcdir}/${pkgname}-${pkgver}/plugins/." "${pkgdir}/var/lib/dokku/core-plugins/available"

  # Version
  echo $pkgver > "${pkgdir}/var/lib/dokku/VERSION"
}
