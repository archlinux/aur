# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=readonly-cache
pkgname1=readonly-cache
pkgdesc="https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Read-only_cache + golang http server & more"
pkgver=0.0.2
pkgrel=1
arch=('any')
conflicts=(skyminer)
license=()
makedepends=(go)
source=(
"aur-local.sh"
"aur-remote-config.sh"
"readonly-cache.sh"
"readonly-cache.service"
"readonlycache.go"
)
sha256sums=('d476b95a400c9fc252f5402d9e911c36ff26675c9ee68e42f4b4696c65c9dd44'
            '3c7a25664ecaaef35a1b48081f350cd50d571d81e514861aa54c8b84d432efd4'
            '64153502b466979a987ba074bb3881095846d1af35de9b71eed029389ac085f8'
            'ccfe41daa38a45b0498cc6dd9f6636db4a7e835ee5c48c3e952cac038006b5f4'
            '8aff1be292e5102b3ff4418af4a3d758b3c68d5fca89c7ca6ba18631bb7b180b')

build() {
  go build readonlycache.go
}

package() {
	#mkdir -p ${pkgdir}/etc/systemd/system
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	mkdir -p ${pkgdir}/usr/lib/${pkgname1}
	mkdir -p ${pkgdir}/usr/bin
	rmextension=".sh"
	rcscripts=$(ls *.sh)
	rcservices=$(ls *.service)
for i in $rcscripts ; do
	install -Dm755 ${i} ${pkgdir}/usr/lib/${pkgname1}/${i}
	ln -rTsf ${pkgdir}/usr/lib/${pkgname1}/${i} ${pkgdir}/usr/bin/${i//$rmextension}
	chmod +x ${pkgdir}/usr/lib/${pkgname1}/${i}
done
for i in $rcservices ; do
	install -Dm644 ${i} ${pkgdir}/usr/lib/systemd/system/${i}
	done
	install -Dm755 readonlycache ${pkgdir}/usr/lib/${pkgname1}/
  install -Dm755 readonlycache.go ${pkgdir}/usr/lib/${pkgname1}/
  ln -rTsf ${pkgdir}/usr/lib/${pkgname1}/readonlycache ${pkgdir}/usr/bin/readonlycache
}
