# Maintainer: Angel Sulev <angel@ansulev.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

# Geeqie 2.9 = the last GTK3 release; 3.0 moved to GTK4 (Arch extra switched 2026-07-13).
# Based on Arch's geeqie 2.9-3 PKGBUILD. Pinned on purpose: never bump past 2.x.
# main repo: http://www.geeqie.org/cgi-bin/gitweb.cgi?p=geeqie.git
# bug tracker: https://github.com/BestImageViewer/geeqie/issues

pkgname=geeqie-gtk3
_pkgname=geeqie
pkgver=2.9
pkgrel=1
pkgdesc='Lightweight image viewer (last GTK3 release, 2.9)'
arch=('x86_64')
url="http://www.geeqie.org/"
license=('GPL-2.0-or-later')
# https://github.com/BestImageViewer/geeqie#optional-libraries
depends=('cairo'
         'cfitsio'
         'djvulibre'
         'exiv2'
         'ffmpegthumbnailer'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gspell'
         'gtk3'
         'hicolor-icon-theme'
         'imath'
         'lcms2'
         'libarchive'
         'libgcc'
         'libheif'
         'libjpeg-turbo'
         'libjxl'
         'libraw'
         'libstdc++'
         'libtiff'
         'libunwind'
         'libwebp'
         'lua'
         'openexr'
         'openjpeg2'
         'pango'
         'poppler-glib'
         'sh')
makedepends=('fbida'
             'gawk'
             'glib2-devel'
             'imagemagick'
             'intltool'
             'librsvg'
             'libwmf'
             'meson'
             'perl-image-exiftool'
             'python'
             # for the docs
             'doxygen' 'yelp-tools' 'graphviz'
             'pandoc-cli'
             #'fop' - for pdf format but 'pdfoutline' is missing
)
checkdepends=('xorg-server-xvfb' 'shellcheck' 'markdownlint' 'appstream')
optdepends=('librsvg: SVG rendering'
            'fbida: for jpeg rotation'
            'gawk: to use the geo-decode function'
            'perl-image-exiftool: for the jpeg extraction plugin'
            'gphoto2: command-line tools for various (plugin) operations'
            'imagemagick: command-line tools for various (plugin) operations')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(https://github.com/BestImageViewer/geeqie/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz{,.asc})
sha256sums=('5f0214778112da6daf3736a6ea04c10b093ea339dcc54676435a097ef8dfcd2d'
            'SKIP')
validpgpkeys=('91EC400226201276E2ADCEC7D0DA6F44C936D1DA') # "Colin Clark <colin.clark@cclark.uk>"

build() {
  arch-meson ${_pkgname}-${pkgver} build -D gps-map=disabled
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

package(){
  DESTDIR="$pkgdir" meson install -C build
  # add Changelog listed in help menu
  install -m644 "${_pkgname}-${pkgver}/build-aux/ChangeLog.gqview" "$pkgdir/usr/share/doc/${_pkgname}/ChangeLog"

  # add missing html doc
  cp -ar build/doc/html "$pkgdir/usr/share/doc/${_pkgname}/"
}
