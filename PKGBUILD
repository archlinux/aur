# Maintainer: wim07101993
# Contributor: Michał Lisowski <lisu at riseup dot net>
# Contributor: Pierre Mavro <pmavro at qovery dot com>
# Contributor: Mesmer <ldepaulaf at gmail dot com
#
# Check for new Linux releases in: https://github.com/VantaInc/vanta-agent-scripts/blob/main/install-linux.sh

_binname=vanta
_svcname=vanta-agent

pkgname=vanta-agent
# https://app.vanta.com/downloads
pkgver=2.16.1
pkgrel=6
pkgdesc="Vanta agent"
arch=('x86_64')
url="https://www.vanta.com/"
depends=('systemd')
license=('custom:vanta')
install=$pkgname.install
source=(
    "https://agent-downloads.vanta.com/targets/versions/${pkgver}/${_binname}-amd64.deb"
    "${_svcname}.conf"
    "vanta-setup.sh"
)
sha256sums=('bb8eccb929b63dc7c7137fd35716a69d5e20b616ae200a89ae519c6d2d6cf7f1'
            '2d650c20f8cabb78d3c629c38d8eed3b15f0e3f9f0b96b68f67fbe5831b41307'
            '9c93408050135a85d874bc30346ba132a230704de5f0367548128207e923e70d')

package() {
  echo "  -> Extracting the data.tar.gz..."
  tar -xzf data.tar.gz -C .

  echo "  -> Moving stuff in place..."
  install -Dm644 "$srcdir"/usr/lib/systemd/system/vanta.service "$pkgdir"/usr/lib/systemd/system/$_svcname.service
  # systemd override for regular restart because of Agent instability
  install -Dm644 $_svcname.conf "$pkgdir"/etc/systemd/system/$_svcname.service.d/$_svcname.conf
  # changelog
  install -Dm644 usr/share/doc/vanta/changelog.gz "$pkgdir"/usr/share/doc/$_binname/changelog.gz
  # custom install script to create the conf file
  install -Dm755 "$srcdir/vanta-setup.sh" "$pkgdir/usr/bin/vanta-setup"
  # vanta
  for i in var/vanta/* ; do
    install -Dm755 $i "$pkgdir"/$i
  done

  # Create a symlink to vanta-cli in /usr/bin for easy access
  mkdir -p "$pkgdir/usr/bin"
  ln -s /var/vanta/vanta-cli "$pkgdir/usr/bin/vanta-cli"
}
