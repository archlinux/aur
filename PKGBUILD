# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=pix-git
_pkgbasename=pix
pkgver=3.0.2.r0.g855a547
pkgrel=1
pkgdesc="Image viewer and browser based on gthumb. X-Apps Project (git version)."
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
    'git'
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
)
provides=($pkgname $_pkgbasename)
conflicts=(${_pkgbasename})
url='https://github.com/linuxmint/pix'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git"
'0001-exiv-0.28.patch')
md5sums=('SKIP' '9c20e12ed62c5d023c9dd81fe6e4e3ab')

prepare() {
    cd "${srcdir}"/${pkgname}
    patch --forward --strip=1 --input="${srcdir}"/0001-exiv-0.28.patch
}

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags --exclude 'master*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}"/${pkgname}/build
    cd "${srcdir}"/${pkgname}/build

    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          ..

    ninja
}

package(){
    cd ${srcdir}/${pkgname}/build
    DESTDIR="$pkgdir/" ninja install
}
