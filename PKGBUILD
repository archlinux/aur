# Maintainer: Ayla Ounce <ayla@ounce.email>
# Contributor: Karim Vergnes <me@thesola.io>

pkgbase=ipu6-camera-bin
pkgname="intel-ipu6-camera-bin"
provides=(intel-ipu6ep-camera-bin)
replaces=(intel-ipu6ep-camera-bin)
_pkgname=ipu6-camera-bins
pkgver=r92.30e8766
pkgrel=1
pkgdesc="Intel IPU6 camera binaries"
arch=('x86_64')
url="https://github.com/intel/$_pkgname"
license=('custom:proprietary')
depends=('intel-ipu6-dkms-git' 'glibc')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')
# don't mess with the provided binaries
options=(!debug !strip)


pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "$pkgdir/usr/include" "$pkgdir/usr/lib/pkgconfig"
    for lib in "$_pkgname/lib/lib"*.so.*; do
	    cp "$lib" "$pkgdir/usr/lib"
	    libbase="${lib##*/}"
	    ln -sr "$pkgdir/usr/lib/${libbase}" "$pkgdir/usr/lib/${libbase%.*}"
    done
    cp "$_pkgname/lib/lib"*.a "$pkgdir/usr/lib/"
    cp -rT "$_pkgname/include" "$pkgdir/usr/include"
    cp -rT "$_pkgname/lib/pkgconfig" "$pkgdir/usr/lib/pkgconfig"

    install -Dm644 "$_pkgname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
