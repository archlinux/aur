# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=readonly-cache
pkgname1=readonly-cache
pkgdesc="https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Read-only_cache + golang http server & more"
pkgver=0.0.3
pkgrel=2
arch=('any')
license=()
makedepends=(go)
source=(
"aur-local.sh"
"aur-remote-config.sh"
"readonly-cache.sh"
"readonly-cache.service"
"readonlycache.go"
"PKGBUILD.sig")
sha256sums=('cd1c599b936777fee54a2c36e80e176b886e68dd5e88173a564813431824756f'
            'ffd37e7bf091d51b45ea8ae546c94ee9353088ba36c722e4a09e55ecc7edec88'
            '78818a89c5ea6fa96d59f7daddbdf05eda92f1ca211c29957331609b0017a308'
            'ccfe41daa38a45b0498cc6dd9f6636db4a7e835ee5c48c3e952cac038006b5f4'
            '49d2b91d3eebc90ff5b9a7f5beec69e6c15791aec43dc318ac1855226fa7fa7a'
            'SKIP')
            validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')  # Moses Narrow <moe_narrow@use.startmail.com>
            
build() {
  gpg --verify ../PKGBUILD.sig ../PKGBUILD
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
