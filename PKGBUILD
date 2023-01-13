# Maintainer: Rosy <rosy[at]rosywings[dot]com>
# Contributor: SergT <jobts[at]ya[dot]ru>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

# Patch for 9.31 version obtained from https://aur.archlinux.org/rxvt-unicode-truecolor-wide-glyphs.git
# Originally patch downloaded from
# https://gist.githubusercontent.com/dan-santana/63271adf12171e0fc0bc/raw/70c6343d1c0b3bca0aba4f587ed501e6cbd98d00/24-bit-color.patch
# but 2020-02-11 aur user writed that this repo was removed.

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-truecolor
pkgver=9.31
pkgrel=1
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with true color patch (24bit colors support). That enables vim 24-bit true color colorshemes'
arch=('x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
conflicts=('rxvt-unicode')
provides=('rxvt-unicode')
depends=('rxvt-unicode-terminfo' 'libxft' 'perl' 'startup-notification' 'libnsl')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
makedepends=('libxft' 'perl' 'startup-notification' 'libnsl')
source=(http://dist.schmorp.de/rxvt-unicode/${_pkgname}-${pkgver}.tar.bz2
        urxvt.desktop
        urxvtc.desktop
        urxvt-tabbed.desktop
        24-bit-color.patch
       )
sha256sums=('aaa13fcbc149fe0f3f391f933279580f74a96fd312d6ed06b8ff03c2d46672e8'
            '5f9c435d559371216d1c5b49c6ec44bfdb786b12d925d543c286b0764dea0319'
            '91536bb27c6504d6cb0d33775a0c4709a4b439670b900f0c278c25037f19ad66'
            'ccd7c436e959bdc9ab4f15801a67c695b382565b31d8c352254362e67412afcb'
            '00ca5372934f86e8f887cf79d905c615d6708a4b59c6ea4899c5e6a503a9d400')
sha512sums=('4d14ecbbb62de1b1c717277f5aae5cfb536e11392f2d4b82c884c1713f437fce8e9dd69a328fa353a55d068d8ee4121a31900f45191acec172d5dc76652b6255'
            '7184714a908071a4e8e5c065c5f90255e94dfd072df459c8d6f66fca3647781b3d1f6908b9303bcfd0d5b3f2e3822a8d66efaaa8a7c4d44f6e682839031a6e99'
            'aa501eeeb220ba03b3f101b160230612efbca87694fef88c469b2976d29769c24b34576ea82f6c7941fad6039ac776f32e397add9b957b49bf2e84aeb67b66d6'
            '18c7afb0c3eb8c832893b9ead09d25374b70ae1cd5479a5291d11794906c53daa6f1a1bf698b37efda062bb2b991cacac53a0a6c185ca416b8718fde2bb6a7af'
            'fcbb6aee364c2c6700ad385d7d787e516d0a76ed0f737da39fa3d369614a52c565f8a3fff15ec1beadc2b629f07bc1878f86f6ae61aa1c276b6ca05df07cde1f')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -p0 < ../24-bit-color.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  # we disable smart-resize (FS#34807)
  # do not specify --with-terminfo (FS#46424)
  ./configure \
    --prefix=/usr \
    --enable-256-color \
    --enable-combining \
    --enable-fading \
    --enable-font-styles \
    --enable-iso14755 \
    --enable-keepscrolling \
    --enable-lastlog \
    --enable-mousewheel \
    --enable-next-scroll \
    --enable-perl \
    --enable-pointer-blank \
    --enable-rxvt-scroll \
    --enable-selectionscrolling \
    --enable-slipwheeling \
    --disable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll \
    --disable-pixbuf \
    --disable-frills \
    --enable-24-bit-color
  make
}

package() {
  # install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm 644 ${_f}.desktop "${pkgdir}/usr/share/applications/${_f}.desktop"
  done

  cd ${_pkgname}-${pkgver}
  # workaround terminfo installation
  export TERMINFO="${srcdir}/terminfo"
  install -d "${TERMINFO}"
  make DESTDIR="${pkgdir}" install
  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "${pkgdir}/usr/bin/urxvt-tabbed"
}


# vim: ts=2 sw=2 et:
