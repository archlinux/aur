# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=pyroscope-bin
pkgver=0.0.29
pkgrel=1
pkgdesc="Continuous profiling platform"
arch=(x86_64)
url="https://pyroscope.io/"
license=('APACHE')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=("etc/${pkgname%-bin}/server.yml")
source=(
	"$pkgname-$pkgver.tar.gz::${url/pyro/dl.pyro}release/pyroscope-$pkgver-linux-amd64.tar.gz"
	"https://raw.githubusercontent.com/pyroscope-io/pyroscope/v$pkgver/scripts/packages/pyroscope-server.service"
	"${pkgname%-bin}-server.yml::https://raw.githubusercontent.com/pyroscope-io/pyroscope/v$pkgver/scripts/packages/server.yml"
	"${pkgname%-bin}.sysusers"
	"${pkgname%-bin}.tmpfiles"
)
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('4ab8ffc355bcdc495d338fd50af9b6b48c8c51af54ef2b9035d4cf8be0baeb4de6dbd01776e8bd943ef9fedb4dd0d3061808185fd5487df1989b76b42ddb0a3b'
        '5ec13ef7bc1e15b9487b036214176fb7c3f7d38134f47b312946e35aa4fdff4acd2a8d3b07abbc6d8809413ef86b5504fd2cbcfaf7e2a346203e4f739ace106a'
        '6814b0d17b0e28903297ea09220f27125d6b9d185ba51d09042621526728c2794ca88dafc02dd42101cf461dd71c993f7c6145a70dbe7bd770ffae0dca017e7f'
        '948dc828f1b2e1068b45d298a073b4c0df4bb18138832c4d0cbcbd33d2f0b995fd37fa0b4ab5f057f30ea01f7b8c16652fc4c469e9262e9e1fde7c30ead62671'
        'a18ea4b1d7cd31a96cd0aa0d554ca7e20689c3697e1183e13de77e2f66c44102c4421d7accec5d2b3c4a837194202d4d305fa5be82ce0f740981520b2c5a3791')

prepare() {
	cd "$srcdir"
	mkdir -p "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	bsdtar -xf ../"$pkgname-$pkgver.tar.gz"
}

package() {
	install -Dm644 "${pkgname%-bin}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-bin}.conf"
	install -Dm644 "${pkgname%-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
	install -Dm644 "${pkgname%-bin}-server.yml" "$pkgdir/etc/${pkgname%-bin}/server.yml"
	install -Dm644 "${pkgname%-bin}-server.service" -t "$pkgdir/usr/lib/systemd/system"

	cd "$pkgname-$pkgver"
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
}

