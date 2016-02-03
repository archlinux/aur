pkgname=saberlight-git
pkgdesc='Collection of tools to control some "smart" BLE bulbs.'
app=saberlight
author=madhead
repo=github.com
pkgver=r32.468193f
pkgrel=1
url="https://github.com/${author}/${app}"
license=('APACHE')
arch=('x86_64')
conflicts=('saberlight')
makedepends=('git' 'go')
provides=(${app})
source=("${app}::git+https://${repo}/${author}/${app}.git")
md5sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd "${srcdir}/${app}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH="${srcdir}"
  export GO15VENDOREXPERIMENT="1"
  mkdir -p ${srcdir}/src/${repo}/${author}
  ln -s ${srcdir}/${app} ${srcdir}/src/${repo}/${author}
  cd ${srcdir}/src/${repo}/${author}/${app}
  make build VERSION=${pkgver}
}

package() {
  install -Dm755 "${srcdir}/${app}/app/${app}" "${pkgdir}/usr/bin/${app}"
}
