# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-pw-check-git
pkgver=5.1.17.r5.g2b1147e
pkgrel=2
pkgdesc='deepin-pw-check is a tool to verify the validity of the password'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/deepin-pw-check"
license=('GPL3')
depends=('cracklib' 'iniparser' 'pam')
makedepends=('git' 'go' 'golang-github-linuxdeepin-go-dbus-factory-git' 'deepin-gettext-tools-git')
groups=('deepin-git')
provides=('deepin-pw-check')
conflicts=('deepin-pw-check')
source=("$pkgname::git+https://github.com/linuxdeepin/deepin-pw-check")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

    export GOPATH="$srcdir/build:/usr/share/gocode"
    export GO111MODULE=off
    go get -v github.com/godbus/dbus
    go get -v github.com/fsnotify/fsnotify
    sed -i 's/<iniparser\//</g' lib/deepin_pw_check.c
    sed -i 's/<iniparser\//</g' tool/pwd_conf_update.c
    sed -i 's/local\///g' Makefile
}

build() {
  cd $pkgname
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir/build:/usr/share/gocode"
  export GO111MODULE=off
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
