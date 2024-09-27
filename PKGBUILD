# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Claudio d'Angelis <claudiodangelis at gmail dot com>
pkgname=postman-electron-bin
pkgver=11.10.0
pkgrel=1
pkgdesc="Build, test, and document your APIs faster, use system electron"
provides=('postman')
conflicts=('postman')
arch=('x86_64' 'aarch64')
url="https://www.getpostman.com"
options=(!strip)
license=('custom')
source_x86_64=(
	"postman-${pkgver}-linux-x64.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux64"
	"postman.desktop"
)
source_aarch64=(
	"postman-${pkgver}-linux-arm64.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux_arm64"
	"postman.desktop"
)
depends=(electron28 bash libsecret glib2 glibc gcc-libs hicolor-icon-theme)
sha256sums_x86_64=('d651c177d1235d95e8ba234fac9df2d92004fe1f9405888cf41ec759a223873c'
                   'ce833b5fda87bc2f4a67cfe56844fd1da8bb77b8cac9f462519a04041c5043c7')
sha256sums_aarch64=('ea35ac97b2b9566a7ffb0f0fbaee5956dfd918d5f82cff54a37819e75daa6c05'
                    'ce833b5fda87bc2f4a67cfe56844fd1da8bb77b8cac9f462519a04041c5043c7')

package() {
	install -vdm755 "${pkgdir}/opt/"
	cp -a "Postman" "${pkgdir}/opt/postman"
	# Desktop file
	install -D -m644 "postman.desktop" \
		"${pkgdir}/usr/share/applications/postman.desktop"
	# Icon
	install -vDm644 $pkgdir"/opt/postman/app/resources/app/assets/icon.png" \
		"${pkgdir}/usr/share/icons/hicolor/128x128/apps/postman.png"

	find $pkgdir/opt/postman/ -not -path "*/resources/app/*" -type f -print -delete
	printf "#!/bin/sh
exec electron28 /opt/postman/app/resources/app \"\$@\"" | install -vDm 755 /dev/stdin $pkgdir/usr/bin/postman
	find $pkgdir -path "*/man/man1/*" -type f -delete
	find $pkgdir \( -name "*.py" -or -name "*.o" \) -delete
	find $pkgdir -path "*/@types/*" -type f -delete
	find $pkgdir -xtype l -delete
	find $pkgdir -type d -empty -delete
}
