# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tim Paik <timpaik@163.com>
pkgname=etherguard-go
_reponame="EtherGuard-VPN"
pkgver=0.3.5_f1
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
sha256sums=('a31ee64ab51e115ec2e12dd553ca5b858740785b4251262dd58c42d46ea347b4'
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
