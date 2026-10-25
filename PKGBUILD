pkgname=gzjam
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple, intuitive and useful DJ application."
arch=('x86_64')
url="https://github.com/GemZombie/GZJam"
license=('MIT')
groups=(pro-audio)
depends=(
	'dotnet-runtime'
)
makedepends=(
	'dotnet-host'
	'dotnet-sdk'
)
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/GemZombie/GZJam/archive/refs/tags/v${pkgver}.zip"
	"gzjam.desktop"
)
sha256sums=('063a5831089e56c69d9daef50e61fdef49b41146e668ae8c4f04fcb7bd9399db'
            '98807df6f3aba3208db1a31c1a5b8fa8d44b918419d505ca1f843a9b861802da')
b2sums=('61c0728445345880e509e453397d4232c08cff245a5dcce4455614bb0802eea31c942f43b3dd0a20b48cbfdfe65dcb5abaee583a4d6f97e518a026b1082dc34d'
        'fcf8074ec46ab584775457a230da5d92c7caa0cea0accf7626b8bebc6bd6e78897f431953dd30025bc92d2aec50da5b842266adc767b4ecfbe2d0d99c19fda29')

build() {
	cd GZJam-${pkgver}
	dotnet publish src/GZJam.App \
		--no-self-contained \
		-p:Version=${pkgver} \
		--use-current-runtime \
		-c Release \
		-r linux-x64 \
		-o publish/linux-$arch
}

package() {
	# Not really sure how dotnet apps are normally packaged, so I cheated and put
	# everything in opt.
	install -dm0755 "$pkgdir/opt/$pkgname"
	install -dm0755 "$pkgdir/usr/share/applications"
	install -dm0755 "$pkgdir/usr/share/pixmaps"
	install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
	install -dm0755 "$pkgdir/usr/bin"

	install -Dm0644 -T ${srcdir}/GZJam-${pkgver}/src/GZJam.App/Assets/gzjam.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/gzjam.png"
	install -Dm0644 -T ${srcdir}/GZJam-${pkgver}/branding/gzjam-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gzjam.svg"
	install -Dm0644 ${srcdir}/GZJam-${pkgver}/publish/linux-${arch}/THIRD-PARTY-NOTICES.txt "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm0644 ${srcdir}/GZJam-${pkgver}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
	install -D ${srcdir}/GZJam-${pkgver}/publish/linux-${arch}/* "$pkgdir/opt/$pkgname"

	install -Dm0644 ${srcdir}/gzjam.desktop "$pkgdir/usr/share/applications/"
	ln -s /opt/gzjam/GZJam $pkgdir/usr/bin/gzjam
}

# vim:set ts=2 sw=2
