# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: samarthj <dev@samarthj.com>

pkgbase=podman-git
pkgname=(podman-git podman-docker-git)
pkgver=r25942.1671029
pkgrel=1
pkgdesc='Tool and library for running OCI-based containers in pods (git)'
arch=(x86_64)
url='https://github.com/containers/podman'
license=(Apache-2.0)
makedepends=(
  apparmor
  btrfs-progs
  catatonit
  git
  go
  go-md2man
  gpgme
  libseccomp
  man-db
  shadow
  sqlite
  systemd
)
# https://github.com/containers/podman/issues/13297
options=(!lto)
source=(
  "git+$url"
)
sha256sums=('SKIP')

pkgver() {
  cd podman
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie"
  export GOPATH="${srcdir}"

  make -j1 EXTRA_LDFLAGS='-compressdwarf=false -linkmode=external' PREFIX=/usr -C podman
  make docker-docs -C podman
}

package_podman-git() {
  depends=(
    catatonit
    conmon
    containers-common
    oci-runtime
    gcc-libs
    glibc
    iptables
    gpgme libgpgme.so
    libseccomp libseccomp.so
    passt
    shadow
    sqlite
  )
  optdepends=(
    'apparmor: for AppArmor support'
    'btrfs-progs: support btrfs backend devices'
    'fuse-overlayfs: for deprecated storage driver in rootless environment'
    'slirp4netns: for alternative rootless network support'
    'podman-compose: for docker-compose compatibility'
    'podman-docker: for Docker-compatible CLI'
  )
  conflicts=(podman)
  provides=(podman)

  make install install.completions DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib -C podman
}


package_podman-docker-git() {
  pkgdesc='Emulate Docker CLI using podman'
  depends=(
    podman
    sh
  )
  conflicts=(docker)
  provides=(docker)

  make -j1 install.docker-full DESTDIR="$pkgdir" PREFIX=/usr -C podman
}

