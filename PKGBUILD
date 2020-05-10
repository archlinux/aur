# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=readonly-cache
pkgname1=readonly-cache
pkgdesc="https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Read-only_cache + golang http server & more"
pkgver=0.0.3
pkgrel=5
arch=('any')
license=()
makedepends=(go)
source=(
"aur-local.sh"
"aur-remote.sh"
"readonly-cache.sh"
"readonly-cache.service"
"readonlycache.go"
"PKGBUILD.sig")
sha256sums=('dcf01f93541943de94e56bcd7884905b2428173e8624e613c47de8c52220eccf'
            '08283aac954c8b71c68b6d892b93ab677766cbcfefa06397d2fba088580f104f'
            '75d53916d30a336282690c12da28f131f03cceb2eb0ce88b3ab4d5f9a703d680'
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
	mkdir -p ${pkgdir}/usr/bin
	rmextension=".sh"
	rcscripts=$(ls *.sh)
	rcservices=$(ls *.service)
for i in $rcscripts ; do
	install -Dm755 ${i} ${pkgdir}/usr/bin/${i//$rmextension}
done
for i in $rcservices ; do
	install -Dm644 ${i} ${pkgdir}/usr/lib/systemd/system/${i}
	done
	install -Dm755 readonlycache ${pkgdir}/usr/bin/
}
