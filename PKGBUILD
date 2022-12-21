# Maintainer: robertfoster

_pkgname=indy-node
pkgname=hyperledger-${_pkgname}
pkgver=1.12.6
pkgrel=1
pkgdesc="A self-sovereign identity ecosystem on top of a distributed ledger. It is the core project for Indy"
arch=(i686 x86_64)
url="https://github.com/hyperledger/${_pkgname}"
license=('APACHE')
groups=('hyperledger')
depends=('python-charm-crypto-git' 'python-dateutil' 'hyperledger-indy-anoncreds' 'hyperledger-indy-plenum' 'python-timeout-decorator')
makedepends=('python')
source=("https://github.com/hyperledger/${_pkgname}/archive/v$pkgver.tar.gz"
	indy-node.conf
	indy-node-control.service
	indy-node.service
	init_indy_node
	node_control.conf
)

prepare() {
        # dirs to be created
        node_dirs="/etc/indy /var/log/indy"

        # create dirs
        for dr in $node_dirs
        do
                mkdir -p $pkgdir$dr
        done

        cat << EOF > $pkgdir/etc/indy/indy_config.py
NETWORK_NAME = 'sandbox'
LEDGER_DIR = '/var/lib/indy'
LOG_DIR = '/var/log/indy'
KEYS_DIR = '/var/lib/indy'
GENESIS_DIR = '/var/lib/indy'
BACKUP_DIR = '/var/lib/indy/backup'
PLUGINS_DIR = '/var/lib/indy/plugins'
NODE_INFO_DIR = '/var/lib/indy'
CLI_BASE_DIR = '~/.indy-cli/'
CLI_NETWORK_DIR = '~/.indy-cli/networks'
EOF
}

package() {
	cd $srcdir/${_pkgname}-$pkgver
	python setup.py install -O1 --root="$pkgdir"

	install -Dm755 ../init_indy_node $pkgdir/usr/bin/init_indy_node
	install -Dm644 ../indy-node.service $pkgdir/usr/lib/systemd/system/system/indy-node.service
        install -Dm644 ../indy-node-control.service $pkgdir/usr/lib/systemd/system/indy-node-control.service
	install -Dm644 ../node_control.conf $pkgdir/etc/indy/node_control.conf

	# cleaning
	rm -rf $pkgdir/home
	rm -rf $pkgdir/usr/bin/{create_dirs.sh,get_keys,init_bls_keys,*.bat}
	rm -rf $pkgdir/usr/lib/python3.6/site-packages/data/{__init__.py,__pycache__}

	# creating user indy
	install -Dm644 ../indy-node.conf $pkgdir/usr/lib/sysusers.d/indy-node.conf
}

md5sums=('7596d31e33d7bbe0858f537efdadb51c'
         '43505a7341a671fd343dd13bd49e9ab2'
         '02486863bad2eab23a40510a3d6f0747'
         '6d0ef3bcbfe3dead0a875768f8d133eb'
         '1882142ad925365e0aa4ce269ce6b7ed'
         'ae156c4380f773d48f51650932d2b518')
