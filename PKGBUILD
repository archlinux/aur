# Maintainer: Eric Foy <foy.8@wright.edu>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgname=rxvt-unicode
pkgname=rxvt-paste-primary
pkgver=9.22
pkgrel=10
pkgdesc='Urxvt no 256 color, no perl, and Ctrl-V pastes from primary'
arch=('x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
makedepends=('libxft' 'libnsl')
depends=('rxvt-unicode-terminfo' 'libxft' 'libnsl')
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
        line-spacing-fix.patch
        256color.patch
        paste-from-primary.patch
        urxvt.desktop
        urxvtc.desktop)
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
sha256sums=('e94628e9bcfa0adb1115d83649f898d6edb4baced44f5d5b769c2eeb8b95addd'
            '546a388d0595404a59c71c3eaeba331031032a75f96c57e9a860f27bbd7ebfcc'
            'e51a598ee616b5953c991a4135dd1acc13a62f1180a8b842297f5401df55dc69'
            '3ab8752c83b29cd3f55b84ebe9b730a517209f81d19ae8e619c4e0427e59af80'
            '5f9c435d559371216d1c5b49c6ec44bfdb786b12d925d543c286b0764dea0319'
            '91536bb27c6504d6cb0d33775a0c4709a4b439670b900f0c278c25037f19ad66')

build() {
  cd ${_pkgname}-${pkgver}
  patch -p0 -i ../256color.patch
  patch -p0 -i ../line-spacing-fix.patch
  patch -p0 -i ../paste-from-primary.patch
  # we disable smart-resize (FS#34807)
  # do not specify --with-terminfo (FS#46424)
  ./configure \
    --prefix=/usr \
    --enable-256-color \
    --disable-combining \
    --disable-fading \
    --disable-iso14755 \
    --disable-perl \
    --enable-pointer-blank \
    --enable-text-blink \
    --disable-startup-notification \
    --disable-transparency \
    --disable-unicode3 \
    --enable-xft \
    --enable-xim \
    --disable-pixbuf \
    --disable-frills
  make
}

package() {
  # install freedesktop menu
  for _f in urxvt urxvtc; do
    install -Dm 644 ${_f}.desktop "${pkgdir}/usr/share/applications/${_f}.desktop"
  done

  cd ${_pkgname}-${pkgver}
  # workaround terminfo installation
  export TERMINFO="${srcdir}/terminfo"
  install -d "${TERMINFO}"
  make DESTDIR="${pkgdir}" install
}
# vim: ts=2 sw=2 et:
