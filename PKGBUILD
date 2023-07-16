# Maintainer: jdev082 <jdev0894@gmail.com>
# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: Andrew Conrad <aconrad103@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

_pkgname=dmenu-wayland
pkgname=$_pkgname-git
pkgver=4.2.1.r59.a380201
pkgrel=2
pkgdesc="Wayland port of a generic menu for X"
url="https://github.com/nyyManni/dmenu-wayland"
arch=('i686' 'x86_64')
license=('MIT')
depends=('wayland' 'wayland-protocols' 'cairo' 'pango' 'libxkbcommon' 'glib2')
makedepends=('git' 'meson' 'ninja')
# Not providing "dmenu" is intented: it does not provide a "dmenu" command, it's "dmenu-wl"
provides=(dmenu-wayland)
conflicts=(dmenu-wayland)
source=(git+https://github.com/nyyManni/dmenu-wayland.git)
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  base_ver=$(sed -En "s/^.*version:.*(([[:digit:]]+\.?){3}).*$/\1/p" meson.build)
  git_ver=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")

  echo "$base_ver.$git_ver"
}

prepare() {
  cd $srcdir/$_pkgname
  # to use a custom config.h, place it in the package directory
  if [[ -f ${SRCDEST}/config.h ]]; then
      cp "${SRCDEST}/config.h" .
  fi
}

build(){
  cd $srcdir
  arch-meson ${_pkgname} build
  ninja -C build
}

package() {
  cd $srcdir
  DESTDIR="$pkgdir" ninja -C build install

  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
