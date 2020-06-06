# Maintainer: Hao Long <aur@esd.cc>

pkgname=esbuild-git
pkgver=r558.42309b7
pkgrel=1
pkgdesc="An extremely fast JavaScript bundler and minifier"
arch=("x86_64" "i686")
url="https://github.com/evanw/esbuild"
license=(MIT)
depends=(glibc)
makedepends=(go git)
provides=(esbuild)
conflicts=(esbuild)
source=("${pkgname}::git+https://github.com/evanw/esbuild.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/cmd/esbuild/"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 cmd/esbuild/esbuild ${pkgdir}/usr/bin/esbuild
}
