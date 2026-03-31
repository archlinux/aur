pkgname=chip-tool
pkgver=1.4.2.0
pkgrel=1
pkgdesc="Matter CLI tool (chip-tool) from Project CHIP"
arch=('x86_64' 'aarch64')
url="https://github.com/project-chip/connectedhomeip"
license=('Apache')
depends=('dbus' 'openssl' 'avahi' 'zlib')
makedepends=('git' 'glib2-devel' 'gcc' 'make' 'pkgconf' 'python' 'python-virtualenv' 'ninja' 'gn')
source=()
sha256sums=()

prepare() {
  cd "$srcdir"
  rm -rf connectedhomeip
  git clone \
    --branch "v${pkgver}" \
    --depth=1 \
    https://github.com/project-chip/connectedhomeip.git \
    connectedhomeip
}

build() {
  cd "$srcdir/connectedhomeip"
  ./scripts/checkout_submodules.py --shallow --platform linux
  source scripts/bootstrap.sh

  mkdir -p out/host
  export MAKEFLAGS="${MAKEFLAGS:--j2}"
  ./scripts/examples/gn_build_example.sh examples/chip-tool out/host
}

package() {
  cd "$srcdir/connectedhomeip"
  install -d "${pkgdir}/usr/bin"
  install -m755 out/host/chip-tool "${pkgdir}/usr/bin/chip-tool"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
