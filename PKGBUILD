# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=aprsc-9m2pju-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="APRS-IS core server in C with chroot sandboxing, SCTP support, and web UI. Pre-built binary from GitHub releases."
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/9M2PJU-APRSC-Installer"
license=('BSD-3-Clause')
depends=('libevent' 'openssl' 'lksctp-tools' 'libcap' 'zlib' 'protobuf-c')
makedepends=('binutils')
source_x86_64=("aprsc_${pkgver}.+bookworm1_amd64.deb::${url}/releases/download/v${pkgver}/aprsc_${pkgver}.%2Bbookworm1_amd64.deb")
source_aarch64=("aprsc_${pkgver}.+bookworm1_arm64.deb::${url}/releases/download/v${pkgver}/aprsc_${pkgver}.%2Bbookworm1_arm64.deb")
sha256sums_x86_64=('53f244da9173b4e8be7b38ad8710e2066c32927937219874a43c409a1c2211be')
sha256sums_aarch64=('0eaa874c4217a0151516739966b9494ba5208f7652c24f70fd35f7116181af72')
backup=('opt/aprsc/etc/aprsc.conf')
install=${pkgname}.install
provides=('aprsc')
conflicts=('aprsc' 'aprsc-9m2pju-git')

# Map Arch arch names to Debian arch names used in the .deb filenames
case "$CARCH" in
  x86_64)   _debarch=amd64 ;;
  aarch64)  _debarch=arm64 ;;
  *)        _debarch=$CARCH ;;
esac

package() {
  cd "$pkgdir"

  # Re-extract data.tar.xz from the .deb (makepkg's bsdtar extraction
  # already unpacks it into srcdir, but we do it here for robustness).
  ar x "$srcdir/aprsc_${pkgver}.+bookworm1_${_debarch}.deb" data.tar.xz
  tar -xJf data.tar.xz -C "$pkgdir"
  rm -f data.tar.xz

  # The .deb installs systemd units under /lib/systemd/system (Debian
  # convention). Move them to /usr/lib/systemd/system (Arch convention).
  if [ -d "$pkgdir/lib/systemd/system" ]; then
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    mv "$pkgdir/lib/systemd/system"/* "$pkgdir/usr/lib/systemd/system/"
    rm -rf "$pkgdir/lib"
  fi
}
