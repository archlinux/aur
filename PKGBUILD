# Maintainer: Marcel W. Wysocki <maci.stgn@gmail.com>
pkgname=appattic
pkgver=3.6.0
pkgrel=1
pkgdesc="Leftovers, stale apps, unused packages, and disk usage (command line)"
arch=('x86_64')
url="https://github.com/maci0/appattic"
license=('LicenseRef-proprietary')
depends=('glibc' 'gcc-libs' 'curl' 'libxml2')
makedepends=('ncurses' 'patchelf')
source=(
  "appattic-${pkgver}.tar.gz::https://github.com/maci0/appattic/archive/refs/tags/v${pkgver}.tar.gz"
  "https://download.swift.org/swift-5.10.1-release/ubuntu2204/swift-5.10.1-RELEASE/swift-5.10.1-RELEASE-ubuntu22.04.tar.gz"
)
sha256sums=(
  '2ab4bedc3e9a2aef72759ac4515d4bb6f139925564e6b7e3b835814664cfb301'
  'cab1bfffd33b79ebd49f4b7475bef6c7eb2d60cf3948cbc693d61afabd23c282'
)

prepare() {
  # The 5.10.1 driver was linked against libncurses.so.6. Arch ships that
  # SONAME as libncursesw.so.6. The symlink is for the compiler only.
  ln -sf /usr/lib/libncursesw.so.6 \
    "${srcdir}/swift-5.10.1-RELEASE-ubuntu22.04/usr/lib/swift/linux/libncurses.so.6"
}

build() {
  # .swift-version is 5.10.1. Arch extra has no Swift, and the Ubuntu 22.04
  # toolchain is the pin scripts/dep-checksums.sha256 already records.
  export PATH="${srcdir}/swift-5.10.1-RELEASE-ubuntu22.04/usr/bin:${PATH}"
  cd "appattic-${pkgver}"
  source scripts/swift-build.sh
  # Linux Package.swift has no dependencies. Static stdlib keeps the Swift
  # runtime out of the package; curl and libxml2 stay dynamic.
  appattic_swift_build release --product appattic --static-swift-stdlib
}

package() {
  cd "appattic-${pkgver}"
  local bin="" candidate
  for candidate in \
    ".build/release/appattic" \
    ".build/x86_64-unknown-linux-gnu/release/appattic"
  do
    if [[ -x "$candidate" ]]; then
      bin="$candidate"
      break
    fi
  done
  [[ -n "$bin" ]]

  # Bundle.module reads AppAttic_AppAtticScan.resources beside the real
  # binary. /usr/bin/appattic is a symlink, so the file lives with the binary.
  install -Dm755 "$bin" "${pkgdir}/usr/lib/appattic/appattic"
  install -Dm644 Sources/AppAtticScan/linux-system-names.txt \
    "${pkgdir}/usr/lib/appattic/AppAttic_AppAtticScan.resources/linux-system-names.txt"
  patchelf --remove-rpath "${pkgdir}/usr/lib/appattic/appattic"
  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/appattic/appattic "${pkgdir}/usr/bin/appattic"
  install -Dm644 packaging/appattic.1 "${pkgdir}/usr/share/man/man1/appattic.1"
}
