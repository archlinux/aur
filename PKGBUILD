# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=go-wol-server-git
_pkgname=go-wol-server
pkgver=0.1
pkgrel=4
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

sha512sums=('cf9b28854a20e74394dfa978216a3b058f435813989472eadef3838fe39f094ff05e38554db748fe9c3373d7a2c4a945edad70d742a443d7495024d973b54e9c'
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
  install -D -m 0755 "${srcdir}/src/${_gourl}/${_gourl_pkgname}/${_gourl_pkgname}" "${pkgdir}/usr/sbin/${_pkgname}"
  
  install -D -m 0600 "${srcdir}/src/${_gourl}/${_gourl_pkgname}/config.toml" "$pkgdir/etc/${_pkgname}/config.toml"
  cp -r "${srcdir}/src/${_gourl}/${_gourl_pkgname}/templates" "${pkgdir}/etc/${_pkgname}/templates"
  
  install -D -m 0644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
