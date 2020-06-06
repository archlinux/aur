# Submiter: ZekeSulastin <zekesulastin@gmail.com>
# Maintainer: AdrianoML <adriano.lols@gmail.com>

pkgname=jstest-gtk-git
pkgver=0.1.0.r98.g7a51eef
pkgrel=1
pkgdesc="A simple GTK2-based joystick tester and calibrator"
arch=('i686' 'x86_64')
url="https://github.com/Grumbel/jstest-gtk/"
source=('git://github.com/Grumbel/jstest-gtk/' 'jstest-gtk.desktop' 'fix_datadir.patch')
license=('GPL3')
depends=('gtkmm3')
makedepends=('git' 'cmake')
_gitname="jstest-gtk"

sha1sums=('SKIP'
          '4a8a3f5ac41b509fdfc0aec7cf017447e58ec973'
          '1c1cdc1c2d98c18ce4b0523c53b8be8a08f4eeed')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"

  msg "Patching..."
  patch -p1 < "../fix_datadir.patch"

  if [[ ! -e 'build' ]]; then
      mkdir build
  fi
  cd build
  cmake ..
  make
}

package() {
  cd "$_gitname"

  install -D -m755 build/jstest-gtk "${pkgdir}/usr/bin/jstest-gtk"
  install -D -m644 "./data/generic.png" "${pkgdir}/usr/share/icons/jstest-gtk.png"
  install -D -m644 "../jstest-gtk.desktop" "${pkgdir}/usr/share/applications/jstest-gtk.desktop"
  mkdir -p "${pkgdir}/usr/share/jstest-gtk"
  cp -r "../jstest-gtk/data" "${pkgdir}/usr/share/jstest-gtk/"
}

