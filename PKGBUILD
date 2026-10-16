# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-indexer
pkgver=4.14.9
pkgrel=1
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgdesc="Wazuh Indexer for Arch Linux"
arch=('x86_64')
url="https://wazuh.com/"
license=('gpl2')
groups=("wazuh-siem")
depends=(
  'coreutils'
)
optdepends=(
)
validpgpkeys=(
)

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
  "wazuh-passwords-tool.sh"
  "wazuh-certs-tool.sh"
  "config.yml"
)

sha512sums=('8d0ac7dd82990f5f7984f2c0d20df556a15386403a1a9b5b1c7bd3aad35ca2b1b75485ce909cd4d39fd8feff4163d0670974d1a97f4dc7f541aa001b09b6a8b7'
            'e38bc65e55f51d639c9521090ab0370f8b1fc33fdcba4ec7eab49d0f065b4c744a215dd2380b2c6d57803bba4b865dcd2f82ec0ba67bad8831cbc531e957dae9'
            'b767202849ed28c7b080fdbf17f70b4f26ee1b3f90b9806db9493e83de29244f80c6a8b8c68a571e3dd2931cb80399feffade90a55cacbc4110c38072dabfee3'
            '5d062026225f0befba836c176858cee040b27057c93f6ae791e042dbb015c5c3b462fd11a5d3cdc7a7172f33e090dd600919b08b391e15aa573e1739f0116db8')

install=$pkgname.install

package() {
  #only 2 files require special patches for arch: wazuh-passwords-tool.sh and wazuh-certs-tool.sh, so we replace them
  #Setup
  cd $pkgdir

  mv $srcdir/etc .
  mv $srcdir/usr .
  mv $srcdir/var .

  tools_dir="$pkgdir/usr/share/wazuh-indexer/plugins/opensearch-security/tools"
  install -Dm755 "$srcdir/wazuh-passwords-tool.sh" "$tools_dir/wazuh-passwords-tool.sh"
  install -Dm755 "$srcdir/wazuh-certs-tool.sh" "$tools_dir/wazuh-certs-tool.sh"
  install -Dm644 "$srcdir/config.yml" "$tools_dir/config.yml"

  #Set systemd service file perms
  chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-indexer-performance-analyzer.service
  chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-indexer.service
}
