# Maintainer: Sidney Crestani <sidneycrestani@archlinux.net>
# Base PKGBUILD from ArchStrike

pkgname=creak-git
pkgver=20161118.r38
pkgrel=2
arch=('any')
pkgdesc="Performs some of the most famous MITM attack on target addresses located in a local network."
url="https://github.com/codepr/creak"
license=('GPL3')
depends=('python2' 'python2-dpkt' 'python2-pypcap' 'scapy' 'libdnet')
makedepends=('python2-setuptools' 'git')
provides=('creak')
conflicts=('creak')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	  cd ${pkgname}
	    printf "%s.r%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)"
    }

    prepare() {
	      grep -iRl 'python' ${pkgname} | xargs sed -i 's|python$|python2|g'
      }

      package() {
	cd ${pkgname}
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cp -a --no-preserve=ownership * "${pkgdir}/usr/share/${pkgname}"

	cat > "${pkgdir}/usr/bin/creak" << XXZ
	#!/usr/bin/env bash
	cd /usr/share/${pkgname}
	python2 creak.py "\$@"
XXZ
	chmod 755 "${pkgdir}/usr/bin/creak"
	      }
	      
