# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
# Source: https://github.com/jmelahman/pkgbuilds

pkgname=git-orchard
_pkgname=git-orchard
pkgver=1.2.1
pkgrel=1
pkgdesc='A command-line utility for managing git-subtrees.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/git-orchard'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='aec397c8c2fcc93657f7342356dd450f47650562'
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

  go build -buildmode=pie -trimpath -modcacherw -ldflags="-linkmode=external -X main.version=v$pkgver -X main.commit=$_commit -s -w" -o "${_pkgname}"
}

package() {
  cd "${_pkgname}" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
