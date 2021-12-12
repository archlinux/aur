# Maintainer: Maciej Dems <macdems at gmail.com>

pkgname=geeqie-gtk2
_pkgname=geeqie
pkgver=1.6
pkgrel=6
pkgdesc='Lightweight image viewer (GTK2 build)'
arch=(x86_64 i686)
url="http://www.geeqie.org/"
license=('GPL2')
# https://github.com/BestImageViewer/geeqie#optional-libraries
depends=('exiv2' 'gtk2' 'ffmpegthumbnailer'
         'djvulibre' 'libheif'
         'poppler-glib')
makedepends=('git'
             'intltool' 'python' 'librsvg'
             'libwmf' 'libwebp' 'imagemagick'
             'fbida' 'gawk' 'perl-image-exiftool'
             # for the docs
             'doxygen' 'yelp-tools' 'graphviz')
optdepends=('librsvg: SVG rendering'
            'fbida: for jpeg rotation'
            'gawk: to use the geo-decode function'
            'perl-image-exiftool: for the jpeg extraction plugin'
            'gphoto2: command-line tools for various (plugin) operations'
            'imagemagick: command-line tools for various (plugin) operations')
provides=(geeqie=${pkgver}-${pkgrel})
conflicts=(geeqie)
source=(https://github.com/BestImageViewer/geeqie/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz{,.asc}
        wayland_fix1.patch::https://github.com/BestImageViewer/geeqie/commit/fa91a270d420a7fcdb38ebb40332d14c4e2f4492.patch
        wayland_fix2.patch::https://github.com/BestImageViewer/geeqie/commit/8768ab3d7588019ea07a440a9cfd12679bc07d65.patch
        fix_segfault_with_clutter-gtk.patch::https://github.com/BestImageViewer/geeqie/commit/f34ea0700048c27319a2256408171adda32a7580.patch
        geeqie-yelp40.patch::https://github.com/BestImageViewer/geeqie/commit/a33d8c40.patch
        image-not-shown.patch::https://github.com/BestImageViewer/geeqie/commit/89c5590a2ecc3132d34fa5b692d03b96e58ac117.patch
)
sha256sums=('48f8a4474454d182353100e43878754b76227f3b8f30cfc258afc9d90a4e1920'
            'SKIP'
            'ffcd29f4f7f9a4fcf68cffc54a82e1e006dd3755a0739970408ef61b3f3ddab2'
            '56b390ff13459c73d45e768e6e87d42f7d92a5290d647b03601e9ce5ab83f741'
            'e7e5364d93d5f7a7a754d1548ba7701acdc4e2809c35feb5b3911829253a1af3'
            '919e81f484486bc3e5ebabe7fb492bd611c079d2bd87d313b0d160359daada44'
            '9669033361c67abbefb0163f545a3ae0c86a2d3df68952efb83e33999a6bae3c')
validpgpkeys=('85D4CA42952C949B175362B379D0B06F4E20AF1C') # "Klaus Ethgen <Klaus@Ethgen.de>"

# main repo: http://www.geeqie.org/cgi-bin/gitweb.cgi?p=geeqie.git
# bug tracker: https://github.com/BestImageViewer/geeqie/issues

prepare() {
  cd "${_pkgname}-${pkgver}"

  # fix crash on wayland
  #https://github.com/BestImageViewer/geeqie/issues/539
  patch -Np1 -i ../wayland_fix1.patch
  patch -Np1 -i ../wayland_fix2.patch
  # fix crash on X11 with clutter
  # https://github.com/BestImageViewer/geeqie/issues/829
  patch -Np1 -i ../fix_segfault_with_clutter-gtk.patch
  # fix doc build with yelp 40
  patch -p1 -i ../geeqie-yelp40.patch
  # image not shown - FS#70755
  patch -p1 -i ../image-not-shown.patch

    NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-gtk3
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
