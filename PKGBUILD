# Maintainer: "UnCO" Lin <trash__box <_at_> 163.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org

pkgname=xf86-input-evdev-debounce
_pkgname=xf86-input-evdev
pkgver=2.9.2
pkgrel=1
pkgdesc="X.org evdev input driver with DebounceDelay setting, it can save your mouse's broken left button from double clicking hell."
arch=(i686 x86_64)
url="http://lists.x.org/archives/xorg-devel/2012-August/033343.html"
license=('custom')
depends=('glibc' 'systemd' 'mtdev' 'libevdev')
makedepends=('git' 'xorg-server-devel' 'resourceproto' 'scrnsaverproto')
provides=("$_pkgname")
conflicts=("$_pkgname")
# XXX When you upgrade xorg-server, you should makepkg -srcfi this package.
#     If you are using this commented conflicts setting, you cannot upgrade xorg-server due to X-ABI-XINPUT_VERSION confliction.
# conflicts=('xorg-server<1.16.0' 'X-ABI-XINPUT_VERSION<21' 'X-ABI-XINPUT_VERSION>=22' "$_pkgname")
options=('!makeflags')
install=${pkgname}.install
groups=('xorg-drivers' 'xorg')
backup=('etc/X11/xorg.conf.d/11-evdev-mouse-debounce.conf')
source=("${pkgname}::git://anongit.freedesktop.org/xorg/driver/xf86-input-evdev#tag=xf86-input-evdev-${pkgver}"
        'debounce.patch'
        '11-evdev-mouse-debounce.conf')
sha256sums=('SKIP'
            'feb3ba6193bc3e2cc03c8c0b11feb7860a30e47c4389b7ad9f785342346d20ed'
            'a8ec532a2640aa0f725e74aa2492d6aaf6015be377710848dd7a86176c33cfce')

### XXX ###
# It seems that evdev devs wish you to buy a new mouse, rather than apply this patch.

build() {
  cd ${pkgname}
  patch -Np1 -i "$srcdir"/debounce.patch
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"
  install -m644 "$srcdir"/11-evdev-mouse-debounce.conf "${pkgdir}/etc/X11/xorg.conf.d/"
}
