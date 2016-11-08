# Maintainer: Ingo Bürk <admin at airblader dot de>

pkgname=i3-gaps
_pkgsourcename=i3
pkgver=4.13
pkgrel=1
pkgdesc='A fork of i3wm tiling window manager with more features, including gaps'
arch=('i686' 'x86_64')
url='https://github.com/Airblader/i3'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3bar' 'i3bar-git' 'i3-git' 'i3-gaps-git' 'i3-gaps-next-git')
groups=('i3')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor'
         'libxkbcommon-x11')
makedepends=('asciidoc' 'docbook-xsl' 'pkgconfig')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display system information with a bar.'
            'perl-json-xs: For i3-save-tree'
            'perl-anyevent-i3: For i3-save-tree')
options=('docs' '!strip')
source=("https://github.com/Airblader/i3/archive/${pkgver}.tar.gz")
sha1sums=('49ea9c91137b658697d50da1548b5d4410c0b9da')

build() {
  cd "${srcdir}/${_pkgsourcename}-${pkgver}"

  autoreconf --force --install

  rm -rf build/
  mkdir -p build && cd build/

  ../configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-sanitizers

  # See https://lists.archlinux.org/pipermail/arch-dev-public/2013-April/024776.html
  make CPPFLAGS+="-U_FORTIFY_SOURCE"
}

package() {
  cd "${srcdir}/${_pkgsourcename}-${pkgver}"
  cd build/

  make DESTDIR="${pkgdir}/" install

  install -Dm644 ../LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

