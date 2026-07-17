# Maintainer: Snowvy <a40166895@gmail.com>
pkgname=golfetch-git
pkgver=r0.g1a2b3c4 # It would change automatically when compiles
pkgrel=1
pkgdesc="A minimalist, suckless-style system fetch utility written in Go."
arch=('x86_64') # I don't think program will work on ARM, so I wouldn't add any other (compile program for your processor if needed)
url="https://github.com/snowvy01/golfetch"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
prepare() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
}
pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "${srcdir}/${pkgname}"
  # delete some debuging information
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-s -w" \
    -o build/golfetch .
}
package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 build/golfetch "${pkgdir}/usr/bin/golfetch"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # because of BSD-3-Clause nature, AUR packages needs to provide it to system
}
