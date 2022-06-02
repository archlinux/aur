# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=geesefs
pkgname=$_pkgbin-git
pkgdesc="A high-performance, POSIX-ish S3 (Yandex, Amazon) file system written in Go (Git version)."
license=("Apache")
url="https://github.com/yandex-cloud/geesefs"
pkgver=0.31.2
pkgrel=2
arch=("x86_64")
makedepends=("git" "go")
depends=("fuse3")
provides=("$_pkgbin")
conflicts=("$_pkgbin" "$_pkgbin-bin")
source=("$pkgname::git+$url")
sha512sums=("SKIP")


pkgver() {
  cd $pkgname

  ( set -o pipefail
    # cutting off 'v' prefix that presents in the git tag
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
  cd $pkgname
  export GOPATH="$srcdir"
  go install
  go clean -modcache
}


package() {
  # Install license
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install the binary
  install -Dm755 bin/$_pkgbin "$pkgdir/usr/bin/$_pkgbin"
}
