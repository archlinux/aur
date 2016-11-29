# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-mpd-git
pkgver=r223.2d8ddb6
pkgrel=1
pkgdesc="MPEG-DASH mpd file addon for Kodi 17+"
arch=('x86_64' 'i686')
url="https://github.com/liberty-developer/inputstream.mpd"
license=('GPL2')
depends=('kodi-platform-git>=r53')
optdepends=('chromium-widevine: widevine drm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('kodi-addon-inputstream-mpd-git::git+https://github.com/liberty-developer/inputstream.mpd.git' 'build_config.h')
md5sums=('SKIP'
         '9625dd1249d2ebedc34897eab3609c47')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        install -Dm644 "$srcdir/build_config.h" "$srcdir/$pkgname/wvdecrypter/cdm/build/build_config.h"
	cd "$srcdir/$pkgname/wvdecrypter"
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release
	make
	
	cd "$srcdir/$pkgname"
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 wvdecrypter/libssd_wv.so "$pkgdir/usr/lib/kodi/addons/inputstream.mpd/decrypter/libssd_wv.so"
	ln -sf /usr/lib/chromium/libwidevinecdm.so "$pkgdir/usr/lib/kodi/addons/inputstream.mpd/decrypter/libwidevinecdm.so"
	make DESTDIR="$pkgdir/" install
        sed -i 's|special://home/cdm|/usr/lib/kodi/addons/inputstream.mpd/decrypter|g' "$pkgdir/usr/share/kodi/addons/inputstream.mpd/resources/settings.xml"
}
