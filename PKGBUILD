# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=startdde-git
pkgver=6.0.13.r0.gb4b8740
pkgrel=1
pkgdesc="starter of deepin desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/startdde"
license=('GPL3')
# deepin-wloutput-daemon: org.deepin.dde.KWayland1
depends=('dconf' 'glib2' 'glibc' 'gtk3' 'libgnome-keyring' 'libgudev' 'libx11' 'libxi'
         'deepin-wloutput-daemon')
makedepends=('go' 'git')
provides=('startdde')
conflicts=('startdde')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/startdde")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's/sbin/bin/' Makefile
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

