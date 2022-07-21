# Maintainer: demostanis worlds <demostanis at protonmail dot com>

_pkgname="gimmeasearx"
pkgname="$_pkgname-git"
pkgver="2.0.0"
pkgrel=3
pkgdesc="Find a random searx instance"
arch=("x86_64")
url="https://github.com/demostanis/gimmeasearx"
license=("GPL3")
makedepends=("git" "go")
optdepends=("tor: required to show .onion instances")
conflicts=("gimmeasearx")
provides=("gimmeasearx")
source=("git+$url.git")
sha512sums=("SKIP")

build() {
	cd $_pkgname

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

	go build .
}

package() {
	install -m755 -d "$pkgdir"/usr/lib/systemd/system
	install -m644 $_pkgname/services/systemd/gimmeasearx.service "$pkgdir"/usr/lib/systemd/system/gimmeasearx.service
	sed -i s,TEMPLATE_DIR,/var/lib/gimmeasearx, "$pkgdir"/usr/lib/systemd/system/gimmeasearx.service

	install -Dm 755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<EOF
#!/bin/sh
cd /var/lib/gimmeasearx
exec /var/lib/gimmeasearx/gimmeasearx 
EOF
	install -Dm 755 $_pkgname/$_pkgname "$pkgdir"/var/lib/$_pkgname/$_pkgname
	install -t "$pkgdir"/var/lib/$_pkgname/templates -Dm 644 $_pkgname/templates/*
	install -Dm 644 $_pkgname/opensearch.xml "$pkgdir"/var/lib/$_pkgname/opensearch.xml 
}

# vim:set ft=sh:

