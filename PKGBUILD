# Maintainer: samarthj <dev@samarthj.com>

# shellcheck disable=2034,2148,2154

pkgname=podman-dnsname-git
_pkgname=podman-dnsname
_gitpkgname=dnsname
pkgver=1.3.1.r13.g9a66485
pkgrel=1
pkgdesc="name resolution for containers"
arch=('any')
depends=('dnsmasq')
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/containers/$_gitpkgname.git"
license=(Apache)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitpkgname}" || exit 1
  ver=$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo "${ver#v}"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

  cd $_gitpkgname || exit 1
  LDFLAGS="-X main.gitCommit=$(git rev-parse HEAD)" make
}

package() {
  cd $_gitpkgname || exit 1
  # non-standard dir since it needs to sit beside the other cni-plugins
  make PREFIX="/usr" LIBEXECDIR="/usr/lib/cni" DESTDIR="${pkgdir}" install
  install -vDm 755 "$pkgdir/usr/lib/cni/dnsname" -t "$pkgdir/opt/cni/bin/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
