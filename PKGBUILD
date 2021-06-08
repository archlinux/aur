# Maintainer: timescam <rex.ky.ng at gmail dot com>
# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname=zentile-git
pkgver=0.1.1.r8.g8d1b3d4
pkgrel=1
pkgdesc="On-demand tiling for Openbox, Xfce and other EWMH Complaint Window Managers (git version)"
arch=(any)
url="https://github.com/blrsn/zentile"
license=(MIT)
optdepends=('xorg-server: with EWMH Complaint Window Managers')
makedepends=(git go)
provides=('zentile')
conflicts=(bin32-zentile zentile-bin zentile)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    # cutting off 'v' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare(){
#  cd "$pkgname"
#}

build() {
  cd "$pkgname"
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go get
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 "$srcdir"/bin/zentile "$pkgdir"/usr/bin/zentile
}
