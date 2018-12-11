# Maintainer: xstaticxgpx (optimum.reflex<at>gmail<dot>com)

pkgname=podman
pkgver=0.12.1.1
pkgrel=1
pkgdesc="Utility for running OCI-based containers."
arch=('x86_64')
url="https://github.com/containers/libpod"
license=('Apache-2.0')
depends=(
  'cri-o' # Doesn't need the crio service running, uses conmon
  'device-mapper'
  'libseccomp'
  'libselinux'
  'iptables'
  'runc'
  'ostree'
)
makedepends=(
  'git'
  'go'
  'go-md2man'
)
source=("https://github.com/containers/libpod/archive/v${pkgver}.tar.gz"
        "registries.conf"
        "mounts.conf"
        "seccomp.json"
        "policy.json"
)
sha256sums=('ccd5b7f8cff0af9f7d9558c70a674ac192f4126056705e968a71a8b8069d63e3'
            'bf720633c4c9906e93665813bbf13a73a6cb0df2b412d81228c7673505513d1f'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'c883cff9c50b01d71ad96403a9e12cab934490fa02b0dce01a602e9c9f720db7'
            'cddfaa8e6a7e5497b67cc0dd8e8517058d0c97de91bf46fff867528415f2d946')

prepare() {
  export GOPATH="$srcdir/go"
  # prepare go src directories
  mkdir -p "$srcdir/go/src/github.com/containers"
  mv "libpod-$pkgver" "$srcdir/go/src/github.com/containers/libpod"

  go get -d github.com/containernetworking/plugins 2>/dev/null || :
}
build() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/github.com/containers/libpod"
  make install.tools
  LDFLAGS= make BUILDTAGS='seccomp apparmor selinux'

  # cni plugins
  cd "$GOPATH/src/github.com/containernetworking/plugins"
  ./build_linux.sh
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
