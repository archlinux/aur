# Maintainer: samarthj <dev@samarthj.com>
# Contributor: Morten Linderud <morten@linderud.pw>

# shellcheck disable=2034,2148,2154

pkgname=buildah-git
_pkgname=buildah
pkgver=1.26.0.r50.g468b1309
pkgrel=1
pkgdesc="A tool which facilitates building OCI images (git)"
arch=(x86_64 aarch64)
depends=(crun skopeo slirp4netns)
makedepends=(go go-md2man git gcc bash-bats
  btrfs-progs bzip2 libapparmor.so libassuan.so libdevmapper.so libgpgme.so libseccomp.so runc skopeo containers-common)
options=(!lto)
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/containers/$_pkgname.git"
license=(Apache)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit 1
  ver=$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo "${ver#v}"
}

build() {
  # Fails if using clang
  export CC=gcc
  export CXX=g++
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
  make install install.completions DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
