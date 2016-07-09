# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom < tomgparchaur at gmail dot com >

pkgname=dropbox-experimental
_pkgname=dropbox
pkgver=7.3.27
pkgrel=1
pkgdesc="A free service that lets you bring your photos, docs, and videos anywhere and share them easily. (Experimental build)"
arch=("i686" "x86_64")
url="http://www.dropbox.com"
license=(custom)
depends=("libsm" "libxslt" "libxmu")
optdepends=(
    'ufw-extras: ufw rules for dropbox'
    'perl-file-mimeinfo: opening dropbox folder on some desktop environments'
)
provides=("dropbox")
conflicts=("dropbox")
options=('!strip' '!upx')

source=("dropbox.png" "dropbox.desktop" "terms.txt" "dropbox.service" "dropbox@.service")
source_i686=("https://d1ilhw0800yew8.cloudfront.net/client/${_pkgname}-lnx.x86-${pkgver}.tar.gz")
source_x86_64=("https://d1ilhw0800yew8.cloudfront.net/client/${_pkgname}-lnx.x86_64-${pkgver}.tar.gz")

sha256sums=('e7d245f5d1a3d5322614b61400ae2913a8caef44bc86717ff7d8197a15dd7f01'
            'dd8fdb362c0bba8d789010594f021671ff00e535fc75e13da855f43bc7a4b3aa'
            '513d7b8395ade6f573b1397acf300326c8dc97e868bca0bc219fb3336b0d4533'
            '2dc647035f4537b7286adb39a71c629353a57f8df03ab81283a3f110579a80aa'
            '1db4b5c19121932d606142642109af4703f211393afe58566c7ec43499d25169')
sha256sums_i686=('f66c4d49ee849635b3f7cb6d20bc287bc7127f6e462849b8bc835b3461d0287e')
sha256sums_x86_64=('8800c8cb69ff27807756f0f0c55a8177ab1095f423b101cb2dc884d7316c23da')

package() {
	if [ "$CARCH" = "x86_64" ]; then
		_source_arch="x86_64"
	else
		_source_arch="x86"
	fi

	install -d "$pkgdir"/opt
	cp -R "$srcdir"/.dropbox-dist/dropbox-lnx.$_source_arch-$pkgver "$pkgdir"/opt/dropbox

	find "$pkgdir"/opt/dropbox/ -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir"/opt/dropbox/dropboxd
	chmod 755 "$pkgdir"/opt/dropbox/dropbox

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/dropbox/dropboxd "$pkgdir"/usr/bin/dropboxd

	install -Dm644 "$srcdir"/dropbox.desktop "$pkgdir"/usr/share/applications/dropbox.desktop
	install -Dm644 "$srcdir"/dropbox.png "$pkgdir"/usr/share/pixmaps/dropbox.png
	install -Dm644 "$srcdir"/terms.txt "$pkgdir"/usr/share/licenses/$pkgname/terms.txt
	install -Dm644 "$srcdir"/dropbox.service "$pkgdir"/usr/lib/systemd/user/dropbox.service
	install -Dm644 "$srcdir"/dropbox@.service "$pkgdir"/usr/lib/systemd/system/dropbox@.service

	#cd "$pkgdir"/opt/dropbox
	#rm libQt5*.so
}
