# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgbase='nps'
pkgname=('nps' 'npc')
pkgver=0.26.9
pkgrel=1
pkgdesc="a lightweight, high-performance, powerful intranet penetration proxy server, with a powerful web management terminal. "
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'arm')
url="https://github.com/ehang-io/nps"
license=('GPL3')
depends=('glibc')
makedepends=('go')
install='.INSTALL'
source=('nps.service' 
        'npc.service' 
        "${pkgname}-${pkgver}.tar.gz::https://github.com/ehang-io/nps/archive/v${pkgver}.tar.gz")
md5sums=('a31b25cbee5112bb6518eb30ed99c9c8'
         '6935c6c06f971d8116282f799c4ac9f4'
         'd9020b0843bedbb62f8bab494acf0c51')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  mkdir -p build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build ./cmd/npc/npc.go
  go build -o build ./cmd/nps/nps.go
}

packaging() {
  install -Dm 755 build/${1} ${pkgdir}/usr/bin/${1}
  install -Dm 644 ${srcdir}/${1}.service ${pkgdir}/usr/lib/systemd/system/${1}.service

  for conf in $2
  do
	install -Dm644 conf/$(basename "$conf") -t ${pkgdir}/etc/${pkgbase}/
  done
}

package_npc() {
  cd ${srcdir}/${pkgbase}-${pkgver}

  _name=`echo ${FUNCNAME} | cut -d _ -f 2`
  
  backup=("etc/nps/${_name}.conf")
  
  packaging "${_name}" "${backup[*]}"

}

package_nps() {
  cd ${srcdir}/${pkgbase}-${pkgver}

  _name=`echo ${FUNCNAME} | cut -d _ -f 2`
  
  backup=("etc/${pkgbase}/${_name}.conf"
  		  "etc/${pkgbase}/clients.json"
		  "etc/${pkgbase}/hosts.json"
		  "etc/${pkgbase}/multi_account.conf"
		  "etc/${pkgbase}/server.key"
		  "etc/${pkgbase}/server.pem"
		  "etc/${pkgbase}/tasks.json")

  packaging "$_name" "${backup[*]}"

  find web -type f -exec install -Dm644 {} ${pkgdir}/etc/${pkgbase}/{} \;
  
}	
# vim:set sw=2 ts=2 et:
