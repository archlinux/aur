# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-adaptive-git
pkgver=r27.fc86263
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 17+"
arch=('x86_64' 'i686')
url="https://github.com/liberty-developer/inputstream.adaptive"
license=('GPL2')
depends=('kodi-platform-git>=r53')
optdepends=('chromium-widevine: widevine drm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('kodi-addon-inputstream-adaptive-git::git+https://github.com/liberty-developer/inputstream.adaptive.git')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/$pkgname/wvdecrypter"
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr
        make

        cd "$srcdir/$pkgname"
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr
        make
}

package() {
        cd "$srcdir/$pkgname"
        make DESTDIR="$pkgdir/" install
        sed -i 's|special://home/cdm|/usr/lib/kodi/addons/inputstream.adaptive/lib|g' "$pkgdir/usr/share/kodi/addons/inputstream.adaptive/resources/settings.xml"
        install -Dm644 wvdecrypter/libssd_wv.so "$pkgdir/usr/lib/kodi/addons/inputstream.adaptive/lib/libssd_wv.so"
        ln -sf /usr/lib/chromium/libwidevinecdm.so "$pkgdir/usr/lib/kodi/addons/inputstream.adaptive/lib/libwidevinecdm.so"
}
