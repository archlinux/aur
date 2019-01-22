# Maintainer: robertfoster

_pkgname=indy-node
pkgname=hyperledger-${_pkgname}
pkgver=1.6.767
pkgrel=1
pkgdesc="A self-sovereign identity ecosystem on top of a distributed ledger. It is the core project for Indy"
arch=(i686 x86_64)
url="https://github.com/hyperledger/${_pkgname}"
license=('APACHE')
groups=('hyperledger')
depends=('python-charm-crypto-git' 'python-dateutil' 'hyperledger-indy-anoncreds' 'hyperledger-indy-plenum' 'python-timeout-decorator')
makedepends=('python')
source=("https://github.com/hyperledger/${_pkgname}/archive/$pkgver-master.tar.gz"
	indy-node.conf
	indy-node-control.service
	indy-node.service
	init_indy_node
	node_control.conf
)

package() {
	cd $srcdir/${_pkgname}-$pkgver-master
	python setup.py install -O1 --root="$pkgdir"

	# dirs to be created
	node_dirs="/etc/indy /var/log/indy /usr/lib/systemd/system /usr/lib/sysusers.d"

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

	install -Dm755 ../init_indy_node $pkgdir/usr/bin/init_indy_node
	cp ../*.service $pkgdir/usr/lib/systemd/system
	cp ../node_control.conf $pkgdir/etc/indy/

	# cleaning
	rm -rf $pkgdir/home
	rm -rf $pkgdir/usr/bin/{create_dirs.sh,get_keys,init_bls_keys,*.bat}
	rm -rf $pkgdir/usr/lib/python3.6/site-packages/data/{__init__.py,__pycache__}

	# creating user indy
	cp ../indy-node.conf $pkgdir/usr/lib/sysusers.d
}

md5sums=('21bd42cc98df27a8ecc4311d346cb13e'
	'43505a7341a671fd343dd13bd49e9ab2'
	'02486863bad2eab23a40510a3d6f0747'
	'6d0ef3bcbfe3dead0a875768f8d133eb'
	'1882142ad925365e0aa4ce269ce6b7ed'
'ae156c4380f773d48f51650932d2b518')
