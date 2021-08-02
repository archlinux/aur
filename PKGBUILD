# Maintainer: samarthj <dev@samarthj.com>

pkgname=conmon-git
_pkgname=conmon
pkgver=2.0.30_dev.r385.gc79dc94
pkgrel=1
pkgdesc="OCI container runtime monitor (git)"
arch=('any')
depends=(glib2 systemd-libs)
makedepends=(go go-md2man git)
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/containers/$_pkgname.git"
license=(Apache)
options=('emptydirs')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1
  commit=$(printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  ver=$(cat VERSION)
  echo "${ver//-/_}.${commit}"
}

build() {
  export BUILDTAGS='seccomp apparmor'
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"

  cd $_pkgname || exit 1
  make EXTRA_LDFLAGS='-s -w -linkmode=external'
}

package() {
  cd $_pkgname || exit 1
  make install PREFIX="$pkgdir"/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
