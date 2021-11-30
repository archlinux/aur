# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=gammastep-git
pkgver=2.0.7.r1.gc5c3ac0
pkgrel=1
pkgdesc="Adjust the color temperature of your screen according to your surroundings."
arch=('x86_64')
url="https://gitlab.com/chinstrap/gammastep"
license=('GPL3')
provides=('gammastep')
conflicts=('gammastep')
depends=('geoclue' 'glibc' 'hicolor-icon-theme' 'libdrm' 'libx11' 'libxcb'
'libxxf86vm' 'wayland')
makedepends=('git' 'glib2' 'intltool' 'python' 'systemd')
optdepends=('python-gobject: for gammastep-indicator'
            'python-xdg: for gammastep-indicator'
            'gtk3: for gammastep-indicator')
source=("git+https://gitlab.com/chinstrap/gammastep.git")
sha256sums=('SKIP')

pkgver() {
  cd gammastep
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"/gammastep
  ./bootstrap
}

build() {
  cd "$srcdir"/gammastep
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir"/gammastep
  make -k check
}

package() {
  depends+=('libgio-2.0.so' 'libgobject-2.0.so' 'libglib-2.0.so')
  cd "$srcdir"/gammastep
  make DESTDIR="$pkgdir/" install
  install -vDm 644 {CONTRIBUTING,NEWS,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
