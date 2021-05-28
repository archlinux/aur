
# Maintainer: Gyro7 <gyro@sach1.tk>
pkgname=mangodl
pkgver=r19.68d3b56
pkgrel=1
pkgdesc="An easy-to-use cli tool for downloading manga"
arch=(x86_64 i686 armv7h amd64)
url="https://github.com/Gyro7/mangodl"
license=('GPL')
makedepends=(git go)
source=("mangodl::git+$url.git#branch=main")
sha256sums=('SKIP')
provides=($pkgname)
conflicts=($pkgname)

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $pkgname

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o $pkgname .
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  if [ -f /usr/bin/$pkgname ]
  then
	  echo Removing previously installed version...
	  sudo rm /usr/bin/$pkgname
  fi 
  sudo install -Dm755 $pkgname /usr/bin/$pkgname
  sudo install -Dm644 LICENSE /usr/share/licenses/$pkgname/LICENSE
}

