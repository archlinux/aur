# Maintainer: Jiuyang Liu <liu@jiuyang.me>
_pkgname=lfs-test-server
pkgname=lfs-test-server-git
pkgver=v0.4.0.r35.g24ca93f
pkgrel=1
pkgdesc="Standalone Git LFS server"
url="https://github.com/github/lfs-test-server"
license=('custom')
arch=('x86_64')
makedepends=('git' 'go')
md5sums=('SKIP'
         '805dc8dd4cf983a8433d385c37c29627'
         '8f3045a45599a9311eee85baaaa412fc')
source=(
  'git+https://github.com/github/lfs-test-server'
  'config'
  'lfs-test-server.service'
)

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  mkdir -p build/
}

build() {
  cd $_pkgname
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./
}

package() {
  cd $_pkgname
  install -Dm755 build/$_pkgname $pkgdir/usr/bin/$_pkgname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 $srcdir/$_pkgname.service $pkgdir/usr/lib/systemd/system/$_pkgname.service
  install -Dm644 $srcdir/config $pkgdir/etc/$_pkgname/config
}
