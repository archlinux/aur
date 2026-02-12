# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-indexer
pkgver=4.14.3
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

sha512sums=('711a0aaa44772f9a1e638a2dec9b462a4542fd22059f5a8eec44b6c9c1b1c36cca66c57594dc980a97a08ab57f632bad4548320af262b22bfb02e462d658862c'
            'e38bc65e55f51d639c9521090ab0370f8b1fc33fdcba4ec7eab49d0f065b4c744a215dd2380b2c6d57803bba4b865dcd2f82ec0ba67bad8831cbc531e957dae9'
            'f6383d5a839ba740ccf9c3c17ea3a9c996a1469f7ab77c3ad6023c4e9398162d309ef7ddb299320f9b5f321ecb70a3b7b6e247fc754ef6d90c87cbb0312c40e2'
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
