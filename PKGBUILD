# Maintainer: samarthj <dev@samarthj.com>

pkgname=skopeo-git
_pkgname=skopeo
pkgver=1.4.1_dev.r1875.g8060e41d
pkgrel=1
pkgdesc="A command line utility for various operations on container images and image repositories (git)"
arch=('any')
depends=(containers-common)
makedepends=(btrfs-progs go go-md2man git systemd)
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
  ver=$(grep const version/version.go | sed -re 's|.*"(.*)"$|\1|g')
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
  depends+=('libdevmapper.so' 'libgpgme.so')

  cd $_pkgname || exit 1
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # remove man pages provided by containers-common
  rm -rvf "${pkgdir}/usr/share/man/man5"
  rm -rvf "${pkgdir}/etc"
}
