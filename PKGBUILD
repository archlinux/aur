# Maintainer : Greg Aluise <galuise@giantg.net>
# Contributer : Yamada Hayao <hayao@fascode.net>
# Contributer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
# Contributer: Aviana Cruz <gwencroft@proton.me>

pkgname="droidcam-obs-plugin"
pkgver="2.4.1"
pkgrel="1"
pkgdesc="plugin for droidcam obs"
arch=("x86_64" "i686")
url="https://dev47apps.com/obs/"
_tag="d23271e5b54ad95a9e05782a91e021776b3a5314"
srcurl="https://github.com/dev47apps/droidcam-obs-plugin.git"
license=('GPL')
depends=("obs-studio" 'libusbmuxd' 'libjpeg-turbo' 'libimobiledevice')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
pkgstem=${pkgname%-git}
source=("${pkgstem}::git+${srcurl}#tag=${_tag}" "libavcodec62-fix.patch")
sha256sums=('SKIP' '02e5fd0c728061eeb23f255250c43b79668b457ebdcd9c31793ad5db44da2e34')


prepare() {
    cd "$srcdir/$pkgstem"
    mkdir -p build
    patch -Np1 < "$srcdir/libavcodec62-fix.patch"
}

build() {
    cd "$srcdir/$pkgstem"
	 pwd
    make LIBUSBMUXD=libusbmuxd-2.0 LIBIMOBILEDEV=libimobiledevice-1.0 ALLOW_STATIC=no
}

package() {
    mkdir -p "$pkgdir/usr/lib/obs-plugins"
    cp "$srcdir/$pkgstem/build/droidcam-obs.so" "$pkgdir/usr/lib/obs-plugins/"
    mkdir -p "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs"
    cp -r "$srcdir/$pkgstem/data/locale" "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs/"
}
