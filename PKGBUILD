# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=waybackurls
pkgname=${_pkgname}-git
pkgver=0.0.2.r6.g89da10c
pkgrel=3
pkgdesc='Fetch all the URLs that the Wayback Machine knows about for a domain'
arch=('x86_64')
url='https://github.com/tomnomnom/waybackurls'
# License from gron as per https://github.com/BlackArch/blackarch/blob/master/packages/waybackurls/PKGBUILD#L27
_rawurl="https://raw.githubusercontent.com/tomnomnom/gron"
license=('MIT')
makedepends=('git' 'go')
provides=("${_pkgname}")
source=("git+${url}.git"
        "${_pkgname}-${pkgver}-LICENSE::${_rawurl}/master/LICENSE")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"

  cd "${_pkgname}"
  go build -v -o "${_pkgname}" main.go
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}/${_pkgname}"
  install -Dm644 "${_pkgname}/README.mkd" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
