# Maintainer: Robert Sprunk <archlinux@sprunk.me>

pkgname=hyperion-git
pkgver=r680.c8a2fe8
pkgrel=1
pkgdesc="An opensource 'AmbiLight' implementation"
arch=('i686' 'x86_64')
url="https://github.com/tvdzwan/hyperion"
license=('MIT')

depends=('protobuf' 'libusb' 'qt4')
optdepends=('xorg-server: X11 grabbing')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=('etc/conf.d/hyperion.config.json')
options=()
source=('hyperion::git+https://github.com/tvdzwan/hyperion#branch=master'
        'hyperiond.service')

sha256sums=('SKIP'
            'aab12fb3d901ea4c8694bd713b1a2187beae6a6ed40f3355d12fc7ad50aaf3fe')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init 
	git submodule update
	cmake -DENABLE_DISPMANX=OFF -DENABLE_SPIDEV=OFF -DENABLE_X11=ON
	make hyperiond hyperion-remote hyperion-v4l2 hyperion-x11
}

package() {
  install -d "$pkgdir"/{usr/bin,etc/conf.d,usr/lib/systemd/system,opt/hyperion}

  install -Dm755 "$srcdir/${pkgname%-git}/bin/hyperiond" "$pkgdir/usr/bin/hyperiond"
  install -Dm755 "$srcdir/${pkgname%-git}/bin/hyperion-remote" "$pkgdir/usr/bin/hyperion-remote"
  install -Dm755 "$srcdir/${pkgname%-git}/bin/hyperion-v4l2" "$pkgdir/usr/bin/hyperion-v4l2"
  install -Dm755 "$srcdir/${pkgname%-git}/bin/hyperion-x11" "$pkgdir/usr/bin/hyperion-x11"
  
  install -m 644 "$srcdir/${pkgname%-git}/config/hyperion_x86.config.json" "$pkgdir/etc/conf.d/hyperion.config.json"

  install -m 644 hyperiond.service "$pkgdir"/usr/lib/systemd/system/

  cp -r "$srcdir/${pkgname%-git}/effects" "$pkgdir/opt/hyperion/"
}
