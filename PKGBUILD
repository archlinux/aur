# Maintainer: a821
# Contributor: christian rebischke <chris.rebischke at archlinux org>

pkgname=gopass-hibp-git
pkgver=1.12.0.r27.g89969dc
pkgrel=1
pkgdesc="haveibeenpwnd.com integration for gopass"
arch=('x86_64')
url="https://github.com/gopasspw/gopass-hibp"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

prepare(){
  cd ${pkgname%-git}
  sed -i 's|-gcflags="-trimpath=$(GOPATH)" -asmflags="-trimpath=$(GOPATH)"||' Makefile
}

build(){
  cd ${pkgname%-git}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
