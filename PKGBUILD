pkgname=chip-tool
pkgver=1.4.2.0
pkgrel=1
pkgdesc="Matter CLI tool (chip-tool) from Project CHIP"
arch=('x86_64' 'aarch64')
url="https://github.com/project-chip/connectedhomeip"
license=('Apache')
depends=('dbus' 'openssl' 'avahi' 'zlib')
makedepends=('git' glib2-devel 'gcc' 'make' 'pkgconf' 'python' 'python-virtualenv' 'ninja' 'gn')
source=("https://github.com/project-chip/connectedhomeip/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a381f8eedc0411d3699890a3c961b7e3bbe6f751c26224ab80d84059c05d9196')

build() {
  cd "$srcdir/connectedhomeip"

  # fetch needed submodules
  ./scripts/checkout_submodules.py --shallow --platform linux

  # prepare env
  source scripts/bootstrap.sh

  # build only chip-tool
  mkdir -p out/host
  ./scripts/examples/gn_build_example.sh examples/chip-tool out/host
}

package() {
  cd "$srcdir/connectedhomeip"
  install -d "${pkgdir}/usr/bin"
  install -m755 out/host/chip-tool "${pkgdir}/usr/bin/chip-tool"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
