# maintainer sa7dse (me [at] sa7d [dot] se)

pkgname=gopass-jsonapi-git
pkgver=r6.374b795
pkgrel=2
pkgdesc="The jsonapi for gopass used for bridging to browsers"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gopasspw/gopass-jsonapi"
license=('MIT')
makedepends=('go' 'git')
depends=('gopass')
provides=("gopass-jsonapi")
conflicts=("gopass-jsonapi")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd gopass-jsonapi
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gopass-jsonapi
  sed -i 's|-gcflags="-trimpath=$(GOPATH)" -asmflags="-trimpath=$(GOPATH)"||' Makefile
}

build() {
  cd gopass-jsonapi
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make
  sed -i 's/install-completion//g' Makefile
}

package() {
  cd gopass-jsonapi
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
