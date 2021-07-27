# Maintainer: samarthj <dev@samarthj.com>

# shellcheck disable=2034,2154

pkgbase=podman-git
pkgname=(podman-git podman-docker-git)
_pkgname=podman
_pkgname_docker=podman-docker
pkgver=3.3.0_dev.r12212.g31c3b952e
pkgrel=1
pkgdesc="Tool and library for running OCI-based containers in pods (git)"
arch=('any')
depends=(cni-plugins conmon containers-common device-mapper iptables
  runc slirp4netns libsystemd fuse-overlayfs)
makedepends=(go go-md2man git)
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/containers/$_pkgname.git"
license=(Apache)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1
  commit=$(printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  ver=$(./hack/get_release_info.sh VERSION)
  echo "${ver//-/_}.${commit}"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"

  cd $_pkgname || exit 1
  make EXTRA_LDFLAGS='-s -w -linkmode=external'
}

package_podman-git() {
  depends+=('libseccomp.so' 'libgpgme.so')
  optdepends+=('podman-docker: for Docker-compatible CLI'
    'libapparmor.so: support for apparmor'
    'libselinux: support for selinux'
    'btrfs-progs: support btrfs backend devices'
    'catatonit: --init flag support'
    'crun: support for unified cgroupsv2')

  cd $_pkgname || exit 1
  make install install.completions DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
  # remove man pages provided by containers-common
  rm -rvf "${pkgdir}/usr/share/man/man5"
}

package_podman-docker-git() {
  pkgdesc='Emulate Docker CLI using podman'
  depends=(podman)
  conflicts=(docker)
  provides=(docker)

  cd $_pkgname || exit 1
  make docker-docs EXTRA_LDFLAGS='-s -w -linkmode=external'
  make install.docker-full DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
}
