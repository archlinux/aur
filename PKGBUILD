# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=go-wol-server-git
_pkgname=go-wol-server
pkgver=0.1
pkgrel=6
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
_gourl_pkgname=wol-server
source=('go-wol-server.service'
        'config.toml'
        "${_gourl_pkgname}::git+https://${_gourl}/${_gourl_pkgname}.git")

sha512sums=('59edc78dbde75d7bf6b364b27e7e2dea86b2a72ac85a3e756f380edd0d441a8c6f873e7e5fbf9cfc6644771406cd14725537cb17335d41ac1a6d49df3fdb8b09'
            'beb090067f0f08371e049a940fe4c3f5de7aead3763366a25814a4424d761624558ffe3fc5447e9f9efbe5bde85b87a77c2fed1958f202adeaaee930f91d45d4'
            'SKIP')

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
  
  install -D -m 0600 "${srcdir}/src/${_gourl}/${_gourl_pkgname}/config.toml" "$pkgdir/etc/${_pkgname}/config.toml"
  cp -r "${srcdir}/src/${_gourl}/${_gourl_pkgname}/templates" "${pkgdir}/etc/${_pkgname}/templates"
  
  install -D -m 0644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
