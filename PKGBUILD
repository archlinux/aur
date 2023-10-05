# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: René 'Necoro' Neumann <arch@necoro.dev>
pkgname=arch-log-git
_pkgname=${pkgname%-git}
pkgver=0.4.0.r3.gd200944
pkgrel=1
pkgdesc='Quickly check commit log of Arch and AUR packages'
arch=('x86_64')
url="https://github.com/Necoro/arch-log"
license=('GPL')
makedepends=('go>=1.21' 'git')
source=('git+https://github.com/Necoro/arch-log')
sha256sums=('SKIP')
conflicts=('arch-log')

pkgver() {
  cd "${_pkgname}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare(){
  cd "${_pkgname}"
  mkdir -p build/
}

build() {
  cd "${_pkgname}"

  _ldflags="-s -w"
 
  # Flags as per Arch Guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -o build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode external $ldflags"
}

package() {
  cd "${_pkgname}"
  install -Dm755 build/${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
