# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=aprstac-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A modern APRS web client, digipeater, IGate, BBS, and fileshare (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://aprstac.com/"
license=('custom:proprietary')
depends=()
provides=('aprstac')
conflicts=('aprstac')
source=('LICENSE'
        'aprstac.desktop')
source_x86_64=("aprstac-${pkgver}-x86_64.deb::https://aprstac.com/downloads/aprstac_${pkgver}_amd64.deb")
source_aarch64=("aprstac-${pkgver}-aarch64.deb::https://aprstac.com/downloads/aprstac_${pkgver}_arm64.deb")
sha256sums=('d2309a72446dac53dbe391ec2e8972f2fccbc6a06ab144c9011d5bd419c998e7'
            '6c57b27e9502b24d45105c6bd64f4e692750f485611285a92a75a87c5ffd2a12')
sha256sums_x86_64=('30394793fce1efcd89db745f7c6efecee4e62b7795fc02de0ccf11f129c9019a')
sha256sums_aarch64=('219e4b5d4b518156b03890dce243af8b6dbed7c286eda26561c41e353aa5e209')

package() {
  # Extract data.tar.xz to the package root.
  # makepkg automatically extracts the downloaded .deb ar archive into $srcdir.
  # We extract the inner data archive to $pkgdir.
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir/" --no-same-owner

  # Align systemd service path with Arch Linux packaging standards
  # (Debian uses /etc/systemd/system, Arch packages use /usr/lib/systemd/system)
  install -d "$pkgdir/usr/lib/systemd/system"
  mv "$pkgdir/etc/systemd/system/aprstac.service" "$pkgdir/usr/lib/systemd/system/"
  rm -rf "$pkgdir/etc"

  # Install enhanced desktop entry (adds GenericName, Keywords for Ham Radio menu integration)
  install -Dm644 "$srcdir/aprstac.desktop" "$pkgdir/usr/share/applications/aprstac.desktop"

  # Install the custom license file
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
