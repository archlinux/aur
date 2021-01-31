pkgname="motionserver-git"
_pkgname="motionserver"
pkgver=r10.165c98d
pkgrel=1
pkgdesc="A DualShock 3/4 controller motion server."
arch=("x86_64")
url="https://github.com/kenshaw/motionserver"
license=("mit")
makedepends=("go")
source=(
  "motionserver::git+https://github.com/kenshaw/motionserver.git"
  "50-motionserver.rules"
)
sha256sums=(
  "SKIP"
  "15854d540245d0f40080e5d006ed92715763744afd901ba549b76a6c1e5efce3"
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$srcdir/$_pkgname"
  mkdir -p build/
}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/$_pkgname"
  go build -o build .
}

package() {
  cd "$srcdir"
  install -Dm755 "$_pkgname/build/$_pkgname" "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 -t "$pkgdir"/usr/lib/udev/rules.d 50-motionserver.rules
}
