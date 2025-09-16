# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=dokku
pkgver=0.36.7
pkgrel=3
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
        "scheduler-docker-local.patch"
        "builder-dockerfile-core-post-extract-fix.patch"
        "builder-lambda-core-post-extract-fix.patch"
        "builder-nixpacks-core-post-extract-fix.patch"
        "builder-pack-core-post-extract-fix.patch")
sha256sums=('a4c7e2928d2b15a3768915e8fdf35508bdecdf5aafa6ae0a40e11d46b5419f49'
            '8830ca7b44118da8e2f35aca271429cfa93e7f21126df6696a0d0d608d979f2b'
            'fd979a3d612396316603f7677cdcdb7d25c7fecf99c97a8d1458262684913fdd'
            '7cbf3acc5843e6c5b2f0cdf55618d1c8975cdf380e84f65be637c464569920b7'
            'afd460868c7d2160f99c3098ac08e5d406e69817b47319f211eeab5bf46dd048'
            '0d5a3bdd9dd0f824c54d5c4d7ac5322dbb17a2c5f2043ed94db46877d74026cf'
            '78d5a7e623e548d34bebf9cf82e3265b0e39f7e5798e2fbfb85f2b9424106c26')
install="${pkgname}.install"

build() {
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${pkgname}-${pkgver}"

  # Fix privilege issue with crontab -u
  patch -p1 -i "${srcdir}/scheduler-docker-local.patch"

  # Fix post extract issue with builder-xxxx
  patch -p1 -i "$srcdir/builder-dockerfile-core-post-extract-fix.patch"
  patch -p1 -i "$srcdir/builder-lambda-core-post-extract-fix.patch"
  patch -p1 -i "$srcdir/builder-nixpacks-core-post-extract-fix.patch"
  patch -p1 -i "$srcdir/builder-pack-core-post-extract-fix.patch"

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
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Move all files in place
  mkdir -p "${pkgdir}/var/lib/dokku/core-plugins/available"
  cp -R "${pkgname}-${pkgver}/plugins/." "${pkgdir}/var/lib/dokku/core-plugins/available"

  # Version
  echo $pkgver > "${pkgdir}/var/lib/dokku/VERSION"
}
