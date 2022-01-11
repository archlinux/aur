# Contributor: Julian Mac Kenzie <jukiangm@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=picom-arian8j2-git
pkgver=8.r1651.20220111
pkgrel=1
pkgdesc="Arian8j2's picom fork with everything from jonaburg's fork plus a patch for rounded corners and shadows"
arch=('i686' 'x86_64')
url="https://github.com/Arian8j2/picom"
license=('MIT' 'MPL2')
depends=('libconfig' 'libev' 'libxdg-basedir' 'pcre' 'pixman' 'xcb-util-image' 'xcb-util-renderutil' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libxcb' 'libxext' 'libdbus')
makedepends=('git' 'meson' 'ninja' 'asciidoc' 'uthash')
optdepends=('dbus:          To control picom via D-Bus'
            'xorg-xwininfo: For picom-trans'
            'xorg-xprop:    For picom-trans'
            'python:        For picom-convgen.py')
provides=('compton' 'compton-git' 'picom' 'picom-git')
conflicts=('compton' 'compton-git' 'picom' 'picom-git')
source=("${pkgname%-git}::git+https://github.com/Arian8j2/picom.git")
md5sums=('SKIP')


pkgver() {
  cd ${pkgname%-git}
  _majorver=$(grep version: meson.build|cut -d: -f2 | tr -d \' | tr -d ',')
  printf "%s.r%s.%s" $(echo $_majorver) $(git rev-list --count HEAD) \
	 $(git log -1 --format="%cd" --date=short | tr -d '-') 
}

build() {
  cd ${pkgname%-git}
  meson --buildtype=release . build --prefix=/usr -Dwith_docs=true
  ninja -C build
}

package() {
  cd ${pkgname%-git}
  DESTDIR="$pkgdir/" ninja -C build install
  
  # install license
  install -D -m644 "LICENSES/MIT" "$pkgdir"/usr/share/licenses/${pkgname%-git/}/LICENSE-MIT
  
  # example conf
  install -D -m644 "picom.sample.conf" "$pkgdir"/etc/xdg/picom.conf.example
}
