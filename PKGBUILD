# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=git-orchard
_pkgname=git-orchard
pkgver=0.0.1
pkgrel=3
pkgdesc='A command-line utility for managing git-subtrees.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/git-orchard'
license=('MIT')
makedepends=('go' 'git')
_commit='00ac69aaf081b86ea550ba87b5a1580817c2b736'
source=("${_pkgname}::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "${_pkgname}" || exit
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  cd "${_pkgname}" || exit

  go build -buildmode=pie -trimpath -modcacherw -ldflags="-X main.version=v$pkgver -X main.commit=$_commit -s -w" -o "${_pkgname}"
}

package() {
  cd "${_pkgname}" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
