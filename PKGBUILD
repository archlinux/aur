# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=wayfire-git 
pkgver=r616.7e011aa
pkgrel=1
pkgdesc="3D wayland compositor"
arch=('x86_64')
url="https://github.com/ammen99/wayfire"
license=('MIT')
depends=('wlroots-git' 'cairo' 'glm' 'libjpeg' 'gtk3')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols' )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=('git+https://github.com/ammen99/wayfire')
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/wayfire"
  git submodule update --init --recursive
}
pkgver() {
	cd "$srcdir/wayfire"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/wayfire/"
   meson setup build \
  --prefix         /usr \
  --libdir         /usr/lib \
  --libexecdir     /usr/lib \
  --bindir         /usr/bin \
  --sbindir        /usr/bin \
  --includedir     /usr/include \
  --datadir        /usr/share \
  --mandir         /usr/share/man \
  --infodir        /usr/share/info \
  --localedir      /usr/share/locale \
  --sysconfdir     /etc \
  --localstatedir  /var \
  --sharedstatedir /var/lib \
  --buildtype      release \
  --wrap-mode      default
  ninja -C build
}


package() {
	cd "$srcdir/wayfire"
	DESTDIR="$pkgdir/" ninja -C build install
  cp wayfire.ini.default $pkgdir/usr/share
}
