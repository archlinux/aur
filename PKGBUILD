# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=pix
pkgver=3.2.2
pkgrel=2
pkgdesc="Image viewer and browser based on gthumb. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=(
    'desktop-file-utils'
    'librsvg'
    'clutter-gtk'
    'gst-plugins-base-libs'
    'gsettings-desktop-schemas'
    'libwebp'
    'webkit2gtk'
    'xapp'
)
makedepends=(
    'meson'
    'intltool'
    'itstool'
    'liboauth'
    'exiv2'
)
optdepends=(
    'gstreamer: Video support'
    'exiv2: Embedded metadata support'
    'libjpeg-turbo: Jpeg writing support'
    'libtiff: Tiff writing support'
    'dcraw: Support for RAW photos'
    'brasero: Burn discs'
    'liboauth: Web albums'
    'libchamplain: Map Viewer'
    'libheif: heif/heic/avif file support'
    'yelp: View help and documentation from the app'
)
provides=($pkgname)
conflicts=('pix-git')
url='https://github.com/linuxmint/pix'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz"
'0001-jxl-added-support-for-version-0.9.0.patch'
)
md5sums=('450fed1003f786b7f904c65662115cdf' '9e81ebbe9dbd6638b178189c1a5ab51b')

prepare() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    patch --forward --strip=1 --input="${srcdir}"/0001-jxl-added-support-for-version-0.9.0.patch
}

build() {
    mkdir -p "${srcdir}"/${pkgname}-${pkgver}/build
    cd "${srcdir}"/${pkgname}-${pkgver}/build

    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          ..

    ninja
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}/build
    DESTDIR="$pkgdir/" ninja install
}
