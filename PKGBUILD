# Maintainer: Tim Paik <timpaik@163.com>
pkgname=etherguard-go
_reponame="EtherGuard-VPN"
pkgver=0.3.5_f3
pkgrel=1
pkgdesc="A Full Mesh Layer2 VPN based on wireguard-go"
arch=('any')
url="https://github.com/KusakabeSi/${_reponame}"
license=('MIT')
makedepends=('go')
optdepends=('wireguard-tools: Access UAPI to provide status viewing')
provides=('etherguard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver//_/-}.tar.gz"
        "etherguard-super@.service"
		"etherguard-edge@.service"
		"gensuper.yaml.example")
sha256sums=('a767a2b441c5590b51fea590e032ca3460fb0da51dd62adbc8d6d155f2505c97'
            'ac566753381f6b0c576d2785363a95f69099400814eee132842d9df56ebca32a'
            '7fd7c773a630ce46837fa6d387339edccd27ba983d6f265a2dbec017484113cb'
            '7adf233e5c193f170a3c0479ee7ccd34f633b8a5c9dbfabee6860171b7c9195c')
build() {
	cd "${_reponame}-${pkgver//_/-}"
	GO111MODULE=on CGO_ENABLED=0 go build -a -trimpath -ldflags "-s -w -extldflags '-static'" -o $pkgname
}
package() {
	cd "${_reponame}-${pkgver//_/-}"
	install -D $pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 $srcdir/etherguard-super@.service $pkgdir/usr/lib/systemd/system/etherguard-super@.service
	install -Dm644 $srcdir/etherguard-edge@.service $pkgdir/usr/lib/systemd/system/etherguard-edge@.service
	install -Dm644 $srcdir/gensuper.yaml.example $pkgdir/etc/$pkgname/gensuper.yaml.example
}
