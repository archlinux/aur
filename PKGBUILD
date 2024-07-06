# Maintainer: Simon Paul <simonpaul@mailbox.org>

pkgname=twad-git
_pkgname=twad
pkgver=v0.23.0.r0.g789baaf
pkgrel=1
pkgdesc='Manage DOOM engines and mods with the terminal wad launcher'
arch=('any')
url="https://github.com/zmnpl/twad"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/zmnpl/twad.git#branch=rc")
sha256sums=('SKIP')

pgkver() {
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/${_pkgname}
  #git checkout rc
  #export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  CGO_ENABLED=0 go build -o $pkgname .
}

package() {
  cd "${srcdir}"/${_pkgname}
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "${srcdir}/${_pkgname}"/LICENSE     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
