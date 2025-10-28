# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-indexer
pkgver=4.14.0
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
);
optdepends=(
);
validpgpkeys=(
)

source=(
    "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
    "wazuh-passwords-tool.sh"
    "wazuh-certs-tool.sh"
)

sha512sums=('eb970b5eebf77377e2ec46972e93532a6570632a10d5caaadcc39ca041a823e2ca6594ed8a217937fe921d5504d67008a9d99ac143d48580cbe12706f40e3546'
            'e38bc65e55f51d639c9521090ab0370f8b1fc33fdcba4ec7eab49d0f065b4c744a215dd2380b2c6d57803bba4b865dcd2f82ec0ba67bad8831cbc531e957dae9'
            'f6383d5a839ba740ccf9c3c17ea3a9c996a1469f7ab77c3ad6023c4e9398162d309ef7ddb299320f9b5f321ecb70a3b7b6e247fc754ef6d90c87cbb0312c40e2')

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
    
    #Set systemd service file perms
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-indexer-performance-analyzer.service
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-indexer.service
}
