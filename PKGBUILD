# Maintainer: earthintruders <<earthintruders at tutanota dot de>>
pkgname=onepdfplease-git
pkgver=r181.06d41c2
pkgrel=1
pkgdesc="A TUI for doing simple PDF tasks"
arch=('x86_64')
url="https://github.com/chetanjangir0/onepdfplease"
license=('MIT')
conflicts=("onepdfplease")
depends=()
makedepends=("go" "git")
source=("onepdfplease-git::git+https://github.com/chetanjangir0/onepdfplease.git")
sha256sums=('SKIP')


pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"  
}

prepare() {
  cd "${pkgname}"
  export GOPATH="${srcdir}"
  echo "Downloading go modules"
  go mod download -modcacherw

}


build() {
  cd ${pkgname}
  export CGO_ENABLED=0 # Build an standalone package
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o bin/onepdfplease .




}

package() {
    cd ${pkgname}
    install -Dm644 ${srcdir}/${pkgname}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm755 "${srcdir}/${pkgname}/bin/onepdfplease" "${pkgdir}/usr/bin/onepdfplease"
    }
