# Maintainer: Arian Rezazadeh <notarian.rez@gmail.com>

pkgname=picom-arian8j2-git
pkgver=v20220425
pkgrel=1
pkgdesc="Arian8j2's picom fork with configurable transitions"
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
conflicts=('compton' 'compton-git' 'picom' 'picom-git' 'picom-ibhagwan-git' 'picom-jonaburg-git' 'picom-jonaburg-fix' 'picom-rounded-corners' 'picom-tryone-git')
source=("${pkgname}::git+https://github.com/Arian8j2/picom.git")
md5sums=('SKIP')


pkgver() {
  cd $pkgname
  printf "v%s" $(git log -1 --format="%cd" --date=short | tr -d '-') 
}

build() {
  cd $pkgname
  meson --buildtype=release . build --prefix=/usr -Dwith_docs=true
  ninja -C build
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja -C build install
  
  # install license
  install -D -m644 "LICENSES/MIT" "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE-MIT
  
  # example conf
  install -D -m644 "picom.sample.conf" "$pkgdir"/etc/xdg/picom.conf.example
}
