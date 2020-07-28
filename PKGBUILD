# Maintainer: Howard Cheung <mail@h-cheung.cf>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Ingo Bürk <admin at airblader dot de>

pkgname=i3-gaps-kde-git
pkgver=4.18.2.r10.g07d82753
pkgrel=1
pkgdesc='A fork of i3wm tiling window manager with more features, including gaps (with KDE patches)'
arch=('i686' 'x86_64')
url='https://github.com/h0cheung/i3-gaps-kde'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm')
groups=('i3')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor' 'xcb-util-xrm'
         'libxkbcommon-x11')
makedepends=('bison' 'flex' 'asciidoc' 'xmlto')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display system information with a bar.'
            'perl-json-xs: For i3-save-tree'
            'perl-anyevent-i3: For i3-save-tree')
backup=(etc/i3/config)
options=('docs')
source=('git+https://github.com/h0cheung/i3-gaps-kde.git#branch=gaps-kde')
sha256sums=('SKIP')

_gitname='i3-gaps-kde'

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  mkdir -p build
  cd "$_gitname"
  autoreconf -fvi
}

build() {
  cd build

  ../$_gitname/configure \
    --disable-sanitizers \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}/" install
  install -Dt "$pkgdir/usr/share/man/man1" -m644 man/*.1
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 ../$_gitname/LICENSE
}
