# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=aprsc-9m2pju-bin
pkgver=2.1.21
pkgrel=1
pkgdesc="APRS-IS core server in C with chroot sandboxing, SCTP support, and web UI. Pre-built binary from GitHub releases."
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/aprsc"
license=('BSD-3-Clause')
depends=('libevent' 'openssl' 'lksctp-tools' 'libcap' 'zlib')
makedepends=('binutils')
source_x86_64=("aprsc_${pkgver}.+bookworm1_amd64.deb::${url}/releases/download/v${pkgver}/aprsc_${pkgver}.%2Bbookworm1_amd64.deb")
source_aarch64=("aprsc_${pkgver}.+bookworm1_arm64.deb::${url}/releases/download/v${pkgver}/aprsc_${pkgver}.%2Bbookworm1_arm64.deb")
sha256sums_x86_64=('e3a3914c31e5e30af0a303be719e6a3ef3a7ff21148c1f560182580b267888aa')
sha256sums_aarch64=('cc8735c4f4e4e193bb38951bc9aa2bf0f79c1c03d206c833ea95cb78ea95bb9b')
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
