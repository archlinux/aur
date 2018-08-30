# Maintainer: xstaticxgpx (optimum.reflex<at>gmail<dot>com)

pkgname=podman
pkgver=0.8.4
pkgrel=1
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
source=("https://github.com/containers/libpod/archive/v0.8.4.tar.gz"
        "registries.conf"
        "mounts.conf"
        "seccomp.json"
        "policy.json"
)
sha256sums=('2ab6c755f54e0263f1dbcf56d84c7cbe07bcd0b61db20b3ee3a8e82dab3661f2'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
)

prepare() {
  export GOPATH="$srcdir/go"
  # prepare go src directories
  mkdir -p "$srcdir/go/src/github.com/containers"
  mv "libpod-0.8.4" "$srcdir/go/src/github.com/containers/libpod"

  go get -d github.com/containernetworking/plugins 2>/dev/null || :
}
build() {
  cd "$GOPATH/src/github.com/containers/libpod"
  make install.tools
  LDFLAGS= make BUILDTAGS='seccomp apparmor selinux'

  # cni plugins
  cd "$GOPATH/src/github.com/containernetworking/plugins"
  ./build.sh
}
package() {
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

