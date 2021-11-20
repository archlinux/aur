pkgname=rtl-gopow-git
_pkgname=${pkgname%-git}
_binary=gopow
pkgver=0.0.5.r0.gf799efc
pkgrel=2
pkgdesc='Render tables from rtl_power to a nice heat map'
arch=(x86_64)
url='https://github.com/dhogborg/rtl-gopow'
license=(unknown)
makedepends=("go" "git" "go-bindata")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' 
}

prepare() {
    cd "${srcdir}/${pkgname}"
    go-bindata -pkg resources -o internal/resources/resources.go resources/...
}

build() {
  cd "${srcdir}/${pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${_binary}" .
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 "${_binary}" "${pkgdir}/usr/bin/${_binary}"
}
