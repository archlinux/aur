# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>

pkgbase="rakarrack"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.6.1
pkgrel=5
pkgdesc="Versatile guitar multi-effects processor"
arch=('any')
url="https://${pkgbase}.sourceforge.net"
license=('GPL-2.0-or-later')
makedepends=('alsa-utils')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.bz2::https://downloads.sourceforge.net/${pkgbase}/${_pkgsrc}.tar.bz2"
        "${pkgbase}_fix_manpage.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/${pkgver}-9/debian/patches/04_fix_manpage.diff"
        "${pkgbase}_fix_format_security.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/${pkgver}-9/debian/patches/format-security.diff"
        "${pkgbase}_fix_segfault.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/${pkgver}-9/debian/patches/05_fix_segfault.diff"
        "${pkgbase}_fix_fltk_include.patch"
        "${pkgbase}_fix_icons_destdir.patch")
b2sums=('1fb0e144b13dc3ba7594c8c49c4cd7c61f759029d1effad3c27be31b64af4bf8c60eb0493f23531f3d7645e659185f22a22878a63fa49f77144e0cafc2f9dac7'
        '778fe891dd2927e61539ce36a1cac419e0c05113a9f6a25ca13a6ea5155f11b1063bd8aa830c9c5ad4de732bd6901ccb13ea4414173ece3a99705103539fcafd'
        'f85c34313bd739a9e134ca6f907ac6709c771aa295cf1c6b15ad1679f82aba9e2ad9173cbe0fd4e66b3f135abd5c1a1f9d8f12bd85fe6b177031a9345eecc3ce'
        '3a0aa5205e34a0aa03c06ec1ad773b0f2815ab096f0ed4d8b8451efb099cc0daacb5dda6a9ad856f5e1dd52cce307826a615691e322168aff8fb98c8ab0c9bec'
        '0229484ea598d47eace6ec09212a7169b686d0f6f6a74d45d58486b118d54b736a1ce4ef4c3ad7f4d42f6c8903dd38a49e7f798f1f98747c649937fff43f7c9e'
        '5c5ae27b8dcef87a87821d2c5ca96848a2757b30b79247a8b87611671edc6e304808de4da1383bdb2ccbc50309a21bb26b67456b720a0c055eddbd58ef15e7d0')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgbase}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --enable-datadir='yes' \
    --enable-docdir='yes'
  make
}

package_rakarrack() {
  arch=('x86_64')
  depends=('alsa-lib' 'fltk' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'jack'
           'libsamplerate' 'libsndfile' 'libx11' 'libxpm')

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/doc/${pkgbase}/html"
}

package_rakarrack-docs() {
  pkgdesc+=" (documentation)"

  cd "${srcdir}/${_pkgsrc}/doc/help"
  make DESTDIR="${pkgdir}" install
}
