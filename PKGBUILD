# Maintainer: xstaticxgpx (optimum.reflex<at>gmail<dot>com)

pkgname=podman
pkgver=0.8.5
pkgrel=2
pkgdesc="Utility for running OCI-based containers."
arch=('x86_64')
url="https://github.com/containers/libpod"
license=('Apache-2.0')
depends=(
  'cri-o' # Doesn't need the crio service running, uses conmon
  'device-mapper'
  'libseccomp'
  'iptables'
  'runc'
  'go'
  'ostree'
)
makedepends=(
  'libseccomp'
  'libselinux'
  'git'
  'go'
  'go-md2man'
)
source=("https://github.com/containers/libpod/archive/v0.8.5.tar.gz"
        "registries.conf"
        "mounts.conf"
        "seccomp.json"
        "policy.json"
)
sha256sums=('14a92bf7c6905e8fa042c1b46cd42cc94f2b517dead0ff31c3d2d97ae98ab7ae'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
)

prepare() {
  export GOPATH="$srcdir/go"
  # prepare go src directories
  mkdir -p "$srcdir/go/src/github.com/containers"
  mv "libpod-0.8.5" "$srcdir/go/src/github.com/containers/libpod"

  go get -d github.com/containernetworking/plugins 2>/dev/null || :
}
build() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/github.com/containers/libpod"
  make install.tools
  LDFLAGS= make BUILDTAGS='seccomp apparmor selinux'

  # cni plugins
  cd "$GOPATH/src/github.com/containernetworking/plugins"
  ./build.sh
}
package() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/github.com/containers/libpod"
  make install DESTDIR="$pkgdir" PREFIX="$pkgdir/usr"
  install -Dm644 "$srcdir/registries.conf" "$pkgdir/etc/containers/registries.conf"
  install -Dm644 "$srcdir/mounts.conf" "$pkgdir/etc/containers/mounts.conf"
  install -Dm644 "$srcdir/seccomp.json" "$pkgdir/usr/share/containers/seccomp.json"
  install -Dm644 "$srcdir/policy.json" "$pkgdir/etc/containers/policy.json"

  # cni plugins
  install -d "$pkgdir/opt/cni/bin"
  find "$GOPATH/src/github.com/containernetworking/plugins/bin" -type f -exec install -Dm 755 "{}" "$pkgdir/opt/cni/bin/" \;
}

