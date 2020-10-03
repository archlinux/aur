# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=git-lfs-git
pkgver=2.12.0.r43.g68a8f8a4
pkgrel=1
pkgdesc="Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://git-lfs.github.com/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'go-tools' 'ruby-ronn')
provides=('git-lfs')
conflicts=('git-lfs')
source=("git+https://github.com/git-lfs/git-lfs.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "git-lfs"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "git-lfs"

  go build \
    ./
  make man
}

check() {
  cd "git-lfs"

  go test \
    ./...
}

package() {
  cd "git-lfs"

  install -Dm755 "git-lfs" -t "$pkgdir/usr/bin"

  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/git-lfs"
  install -Dm644 "man"/*.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "man"/*.5 -t "$pkgdir/usr/share/man/man5"
}
