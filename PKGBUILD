# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=dokku
pkgver=0.37.2
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
        "scheduler-docker-local.patch"
        "builder-dockerfile-core-post-extract-fix.patch"
        "builder-lambda-core-post-extract-fix.patch"
        "builder-nixpacks-core-post-extract-fix.patch"
        "builder-pack-core-post-extract-fix.patch"
        "builder-railpack-core-post-extract-fix.patch")
sha256sums=('3be8767cf30e6997cd72f3b949c17aa8d79017aa0711a0cbec80fc4b862221b3'
            '8830ca7b44118da8e2f35aca271429cfa93e7f21126df6696a0d0d608d979f2b'
            'fd979a3d612396316603f7677cdcdb7d25c7fecf99c97a8d1458262684913fdd'
            'bae0fa706e39f5491df96ec81ebd0f5ad60c3e9843dd1c88e01a761731f20d3a'
            '19bdb2c6bd90114351f36fb33f197ddb559f7a27144fa8dea1fdfdb2c2e22b29'
            'aea707f7ff5cbd0cab8dced6a7554975098695416306092d6d4e78e8edca6c20'
            '2221d30d319d216658d43ad9f652305c1bb7a27ccb71b43b7efe8aaf5cefa5a7'
            'aed3a8cba52caee778cca47377a7bda780eab3be867451ba7d9a305b10e9fac7')
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
  patch -p1 -i "$srcdir/builder-railpack-core-post-extract-fix.patch"

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
