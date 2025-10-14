# Maintainer : Greg Aluise <galuise@giantg.net>
# Contributer : Yamada Hayao <hayao@fascode.net>
# Contributer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
# Contributer: Aviana Cruz <gwencroft@proton.me>

pkgname="droidcam-obs-plugin"
pkgver="2.4.2"
pkgrel="1"
pkgdesc="plugin for droidcam obs"
arch=("x86_64" "i686")
url="https://dev47apps.com/obs/"
_tag="73ec2a01e234e6b2287866c25b4242dca6d9d2f6"
srcurl="https://github.com/dev47apps/droidcam-obs-plugin.git"
license=('GPL')
depends=("obs-studio" 'libusbmuxd' 'libjpeg-turbo' 'libimobiledevice')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
pkgstem=${pkgname%-git}
source=("${pkgstem}::git+${srcurl}#tag=${_tag}" "device_discovery-fix.patch")
sha256sums=('SKIP' '3d8f8484af5953faf0ab57358b07ce02b014a880a346e11b5cc79812a31ca857')


prepare() {
    cd "$srcdir/$pkgstem"
    mkdir -p build
    patch -Np1 < "$srcdir/device_discovery-fix.patch"
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
