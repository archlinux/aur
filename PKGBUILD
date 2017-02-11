# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=go-wol-server-git
_pkgname=go-wol-server
url="https://github.com/fanningert/wol-server"
pkgver=23.1d7b0ba
pkgrel=1
epoch=1
pkgdesc="Wake on Lan server"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT')
depends=()
optdepends=()
provides=('go-wol-server')
makedepends=('go>=1.2' 'git')
conflicts=()
options=('!strip' '!emptydirs')
backup=('etc/go-wol-server/config.toml')

_gourl=github.com/fanningert
_gourl_pkgname=wol-server
source=('go-wol-server.service'
        'config.toml'
        "${_gourl_pkgname}::git+https://${_gourl}/${_gourl_pkgname}.git")

sha512sums=('5df3bdc1cf04fd6a83fbe1bca6e8edfd9034f26214f79598eebb1f3bdbac79df53b5fa89e97705c5dd15030ea587a1d85072708ead08c84c61662fa71d2db91b'
            '5d0e3d8f40f87ea9b3ed84c57eb2af937c330c1faddda008c0fe31bdc0f19a6c0a02d1ea04bd96bd7ba6cb93235f3a5c1fa6ea7c04258ee305c44b6ea6535b8b'
            'SKIP')

pkgver(){
  cd "$srcdir/../${_gourl_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  mv "${_gourl_pkgname}" "${srcdir}/src/${_gourl}"
  msg2 "go get"
  GOPATH="${srcdir}" go get "${_gourl}/${_gourl_pkgname}"
}

build() {
  msg2 "Build program"
  cd ${srcdir}/src/${_gourl}/${_gourl_pkgname}
  GOPATH="${srcdir}" go fix
  GOPATH="${srcdir}" go build
}

package() {
  install -D -m 0755 "${srcdir}/src/${_gourl}/${_gourl_pkgname}/${_gourl_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  
  install -D -m 0600 "${srcdir}/config.toml" "$pkgdir/etc/${_pkgname}/config.toml"
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}/templates"
  mv "${srcdir}/src/${_gourl}/${_gourl_pkgname}/templates" "${pkgdir}/usr/share/themes/${_pkgname}/templates/default"
  
  install -D -m 0644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
