# Maintainer: nizne <nizne@outlook.com>
pkgname=pwdsafety-git
_pkgname=pwdsafety
pkgver=0.4.2.r6.g4b0571e
pkgrel=1
pkgdesc='Command line tool that checks how much a password is safe (Git version)'
arch=('x86_64' 'aarch64' 'i686')
url='https://github.com/edoardottt/pwdsafety'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
source=("git+https://github.com/edoardottt/pwdsafety.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  
  export CGO_LDFLAGS="${LDFLAGS}"
  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -extldflags '${LDFLAGS}' -s -w" \
    -o "$_pkgname" ./cmd/pwdsafety
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
