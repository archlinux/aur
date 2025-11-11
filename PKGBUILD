# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=zabbix-agent2-plugin-postgresql
pkgver=7.4.5
pkgrel=1
epoch=1
pkgdesc="Loadable plugin for PostreSQL integration in Zabbix agent2"
arch=(x86_64)
url="https://cdn.zabbix.com/zabbix-agent2-plugins/sources/postgresql"
license=('Apache-2.0')
depends=('glibc' "zabbix-agent2=$pkgver")
makedepends=('go')
source=(
	"$url/$pkgname-$pkgver.tar.gz"
	"postgresql.conf"
)
sha256sums=('01e41f3c0d68e57991718f4bea9e19c0e4c46aada1fb7e50b881c1661c55ff63'
            '0d6c00e85997b125513c1786cfa6755c8bbcbf9c671a083285e68ef77b5fd801')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "postgresql.conf" "$pkgdir/etc/zabbix/zabbix_agent2.d/plugins.d/postgresql.conf"
}
