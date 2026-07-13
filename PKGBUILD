# Maintainer: jsjolund <j dot sjolund at gmail dot com>

pkgname=zabbix-agent2-plugin-nvidia-gpu
pkgver=7.4.12
pkgrel=1
epoch=1
pkgdesc="Loadable plugin for Nvidia GPU integration in Zabbix agent2"
arch=(x86_64)
url="https://cdn.zabbix.com/zabbix-agent2-plugins/sources/nvidia-gpu"
license=("Apache-2.0")
depends=("glibc" "zabbix-agent2>=$pkgver" "nvidia-utils")
makedepends=("go")
backup=("etc/zabbix/zabbix_agent2.d/plugins.d/nvidia.conf")
source=(
	"$url/$pkgname-$pkgver.tar.gz"
	"nvidia.conf"
)
sha256sums=("39c09f1b0ca2fa3b89871b9f430b490e4479873bbf86143229d0f58865ab603c"
            "a1bc60b828016590d0606bc194c393e792c257114addb9347969d79711ac0f2d")

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS} -lnvidia-ml"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "nvidia.conf" "$pkgdir/etc/zabbix/zabbix_agent2.d/plugins.d/nvidia.conf"
}
