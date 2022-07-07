# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rawstudio-git-add-patches
_pkgname=rawstudio-git
pkgver=2.0.r624.gc140a5e
pkgrel=2
pkgdesc='An open-source program to read and manipulate RAW images from digital cameras'
arch=(x86_64)
url=https://rawstudio.org
license=(GPL2)
depends=(desktop-file-utils
         exiv2
         fftw
         gconf
         lcms2
         lensfun
         libgphoto2
         osm-gps-map)
makedepends=(git)
provides=("${_pkgname%-git}")
conflicts=("${_pkgname%-git}")
source=("$pkgname::git+https://github.com/rawstudio/${_pkgname%-git}.git"
         "add-raw-support-to-rawspeed.patch"
         "remove-line-in-rw2decoder.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 --tags --match="v*" HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    #cp ${srcdir}/add-raw-support-to-rawspeed.patch .
    #cp ${srcdir}/remove-line-in-rw2decoder.patch .
    patch -p0 < ${srcdir}/add-raw-support-to-rawspeed.patch
    ./autogen.sh
    patch plugins/load-rawspeed/rawspeed/RawSpeed/Rw2Decoder.cpp < ${srcdir}/remove-line-in-rw2decoder.patch
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}
