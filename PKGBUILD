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
pkgver=4.2.1.r26.de4fcbf
pkgrel=1
pkgdesc="Wayland port of a generic menu for X"
url="https://github.com/nyyManni/dmenu-wayland"
arch=('i686' 'x86_64')
license=('MIT')
depends=('wayland-protocols' 'cairo' 'pango' 'libxkbcommon' 'glib2')
makedepends=('git')
# Not providing "dmenu" is intented: it does not provide a "dmenu" command, it's "dmenu-wl"
provides=(dmenu-wayland)
conflicts=(dmenu-wayland)
source=(git+https://github.com/nyyManni/dmenu-wayland.git)
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  base_ver=$(cat config.mk | grep VERSION | head -n1 | awk '{ print $3 }')
  git_ver=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")

  echo "$base_ver.$git_ver"
}

prepare() {
  cd $srcdir/$_pkgname
  # to use a custom config.h, place it in the package directory
  if [[ -f ${SRCDEST}/config.h ]]; then
      cp "${SRCDEST}/config.h" .
  fi

  sed -i 's/^PREFIX = .*$/PREFIX = \/usr/' config.mk
  sed -i 's/lib\/x86_64-linux-gnu/lib/g' config.mk
}

build(){
  cd $srcdir/$_pkgname
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
