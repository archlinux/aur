# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=dokku
pkgver=0.27.10
pkgrel=1
pkgdesc='Docker-powered PaaS that helps build and manage the lifecycle of applications'
arch=('any')
url='https://github.com/dokku/dokku'
license=('MIT')
depends=(
  'bash-completion'
  'bind'
  'cpio'
  'curl'
  'docker'
  'docker-image-labeler'
  'dos2unix'
  'git'
  'go'
  'gliderlabs-sigil'
  'herokuish'
  'jq'
  'man-db'
  'netrc'
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
        "crontab_calls.patch"
        "systemd_calls.patch"
        "hostname"
        "LICENSE")
sha256sums=('fa66855b974eb8a89074a8a674a176af90984e9e3eaa62120baa374ea5238c8d'
            '5b3e99b6be28f8c68e024d9127992bcd49c758566a6ecaa15f9788a411eab0f0'
            'dda85c90106e68b5478679fb2a5b8b37a786d188703abd255e079bdada36a9c0'
            'c600fefea1c93e9f94192741adc679fb0a05674775d3677954f10db4e09205c6'
            '3f4223dec09dde4148e0b6f4e9474ec3d2a9064bf070d637967324e103615ba6'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')
conflicts=('inetutils')
install="${pkgname}.install"

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath"

  cd "${pkgname}-${pkgver}"

  # Fix issue on crontab calls with arch linux cron implementation
  patch -p1 -i "${srcdir}/crontab_calls.patch"

  # Fix issue with invalid service manager call for arch linux
  patch -p1 -i "${srcdir}/systemd_calls.patch"

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
  install -Dm755 hostname "${pkgdir}/usr/bin/hostname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Move all files in place
  mkdir -p "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp -R "${srcdir}/${pkgname}-${pkgver}/plugins/." "${pkgdir}/var/lib/dokku/core-plugins/available"

  # Version
  echo $pkgver > "${pkgdir}/var/lib/dokku/VERSION"
}
