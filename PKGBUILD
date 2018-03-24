# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=git-lfs-git
pkgver=2.4.0.r52.gbe5da9fa
pkgrel=1
pkgdesc="Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://git-lfs.github.com/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go-pie' 'glide' 'ruby-ronn')
provides=('git-lfs')
conflicts=('git-lfs')
source=("git+https://github.com/git-lfs/git-lfs.git")
sha256sums=('SKIP')


prepare() {
  mv "git-lfs/vendor" "src"

  ln -s "$srcdir/git-lfs" "src/github.com/git-lfs/git-lfs"

  cd "$srcdir/git-lfs"
  GOPATH="$srcdir" glide install
}

pkgver() {
  cd "git-lfs"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "git-lfs"

  GOPATH="$srcdir" go build
  . script/man
}

package() {
  cd "git-lfs"

  install -Dm755 "git-lfs" "$pkgdir/usr/bin/git-lfs"

  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -d "$pkgdir/usr/share/man/man1"
  install -Dm644 "man"/*.1 "$pkgdir/usr/share/man/man1"
}
