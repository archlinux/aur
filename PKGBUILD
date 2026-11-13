pkgname=gzjam
pkgver=1.8.0
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
sha256sums=('9cff0b6e3536f4edf33875d41bae0019d8731bfa33d4dbe2501fbe96b950a4f1'
            '98807df6f3aba3208db1a31c1a5b8fa8d44b918419d505ca1f843a9b861802da')
b2sums=('687537a62ea7bfa316026af1341f8da49a6f78d2bea27306ca74e7d9cb78164804ac75c608cfe5820d2878581c142a3fd961b6358fc84a15a0e35ae35c43d5e2'
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
	install -dm0755 "$pkgdir/usr/share/doc/$pkgname"
	install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
	install -dm0755 "$pkgdir/usr/bin"

	install -Dm0644 -T ${srcdir}/GZJam-${pkgver}/src/GZJam.App/Assets/gzjam.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/gzjam.png"
	install -Dm0644 -T ${srcdir}/GZJam-${pkgver}/branding/gzjam-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gzjam.svg"
	install -Dm0644 ${srcdir}/GZJam-${pkgver}/publish/linux-${arch}/THIRD-PARTY-NOTICES.txt "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm0644 ${srcdir}/GZJam-${pkgver}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
	install -D ${srcdir}/GZJam-${pkgver}/publish/linux-${arch}/* "$pkgdir/opt/$pkgname"
	cp -r ${srcdir}/GZJam-${pkgver}/docs/* "$pkgdir/usr/share/doc/$pkgname"

	install -Dm0644 ${srcdir}/gzjam.desktop "$pkgdir/usr/share/applications/"
	ln -s /opt/gzjam/GZJam $pkgdir/usr/bin/gzjam
}

# vim:set ts=2 sw=2
