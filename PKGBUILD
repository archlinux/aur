pkgname=pubnet
pkgver=1.1.0
pkgrel=1
pkgdesc="Self-hosted pub.dev alternative"
arch=(x86_64)
url="https://github.com/ricardoboss/pubnet"
license=('GPL')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ricardoboss/PubNet/archive/refs/tags/v$pkgver.tar.gz"
	"pubnet@.service")
sha256sums=('ac2e54a777d52cbbfcf310a5df0b8ba146ed890634beb4790725e83f0200cf7b'
            '79d717c7e4a67ee260c6168273a67149c9a28bd743cc87351fd0b40d0a80c785')

build() {
	cd "PubNet-$pkgver"
	mkdir -p build
	dotnet build -c Release
	MSBUILDDISABLENODEREUSE=1 dotnet publish -c Release -o ./build --self-contained true -r linux-x64
}

package() {
	cd "PubNet-$pkgver"
	install -dm0755 "$pkgdir"/opt/pubnet
	cp -a build/. "$pkgdir"/opt/pubnet/
	install -Dm0644 "$srcdir/pubnet@.service" "$pkgdir"/usr/lib/systemd/system/pubnet@.service
}
