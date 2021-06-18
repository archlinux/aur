# Maintainer: samarthj <dev@samarthj.com>

pkgname=podman-git
_pkgname=podman
pkgver=3.3.0_dev.r0.gce04a3e17
pkgrel=1
pkgdesc="Tool and library for running OCI-based containers in pods (git)"
arch=('any')
depends=(cni-plugins conmon containers-common device-mapper iptables
  runc slirp4netns libsystemd fuse-overlayfs)
optdepends=('podman-docker: for Docker-compatible CLI'
  'btrfs-progs: support btrfs backend devices'
  'catatonit: --init flag support'
  'crun: support for unified cgroupsv2')
makedepends=(btrfs-progs go go-md2man git gpgme systemd)
backup=('etc/cni/net.d/87-podman-bridge.conflist')
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/containers/$_pkgname.git"
license=(Apache)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1
  commit=$(git rev-parse --short HEAD)
  ver=$(./hack/get_release_info.sh VERSION)
  echo "${ver//-/_}.r0.g${commit}"
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
  depends+=('libseccomp.so' 'libdevmapper.so' 'libgpgme.so')

  cd $_pkgname || exit 1
  make install install.completions DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # remove man pages provided by containers-common
  rm -rvf "${pkgdir}/usr/share/man/man5"
}
