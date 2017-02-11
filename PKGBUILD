# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=go-wol-server-git
_pkgname=wol-server
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="Wake on Lan server"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT')
depends=()
optdepends=()
provides=('go-wol-server')
makedepends=('go>=1.2' 'git' 'patch')
conflicts=()
options=('!strip' '!emptydirs')
backup=('etc/go-wol-server/config.toml'
        'etc/go-wol-server/templates/footer.tmpl'
        'etc/go-wol-server/templates/header.tmpl'
        'etc/go-wol-server/templates/index.tmpl')

_gourl=github.com/qybl
source=('go-wol-server.service'
        "${_pkgname}::git+https://${_gourl}/${_pkgname}.git")

sha512sums=('SKIP'
            'SKIP')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  mv "${_pkgname}" "${srcdir}/src/${_gourl}"
  msg2 "go get"
  GOPATH="${srcdir}" go get "${_gourl}/${_pkgname}"
}

build() {
  msg2 "Build program"
  cd ${srcdir}/src/${_gourl}/${_pkgname}
  GOPATH="${srcdir}" go fix
  GOPATH="${srcdir}" go build
}

package() {
  install -D -m 0755 "${srcdir}/src/${_gourl}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  
  install -D -m 0600 "${srcdir}/src/${_gourl}/${_pkgname}/config.toml" "$pkgdir/etc/${pkgname}/config.toml"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/templates" "${pkgdir}/etc/${pkgname}/templates"
  
  install -D -m 0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
