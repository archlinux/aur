# Maintainer: xstaticxgpx (optimum.reflex<at>gmail<dot>com)

pkgname=podman
pkgver=0.9.2.1
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
source=("https://github.com/containers/libpod/archive/v0.9.2.1.tar.gz"
        "registries.conf"
        "mounts.conf"
        "seccomp.json"
        "policy.json"
)
sha256sums=('0c612a45aec67abd8fd03aa9a735b50f4d6f29c492958f8a03bf67589a0a34c8'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
)

prepare() {
  export GOPATH="$srcdir/go"
  # prepare go src directories
  mkdir -p "$srcdir/go/src/github.com/containers"
  mv "libpod-${pkgver}" "$srcdir/go/src/github.com/containers/libpod"

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

