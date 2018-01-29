# Maintainer: robertfoster

_pkgname=indy-node
pkgname=hyperledger-${_pkgname}
pkgver=1.2.284
pkgrel=1
pkgdesc="A self-sovereign identity ecosystem on top of a distributed ledger. It is the core project for Indy"
arch=(i686 x86_64)
url="https://github.com/hyperledger/${_pkgname}"
license=('APACHE')
groups=('hyperledger')
depends=('python-dateutil' 'hyperledger-indy-anoncreds' 'hyperledger-indy-plenum' 'python-timeout-decorator')
makedepends=('python')
source=("https://github.com/hyperledger/${_pkgname}/archive/$pkgver-master.tar.gz")

package() {
  cd $srcdir/${_pkgname}-$pkgver-master
  python setup.py install -O1 --root="$pkgdir"

# dirs to be created
  node_dirs="/etc/indy /var/lib/indy /var/log/indy"

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
  rm -rf $pkgdir/home
  rm -rf $pkgdir/usr/bin/{create_dirs.sh,get_keys,init_bls_keys,*.bat}
  rm -rf $pkgdir/usr/lib/python3.6/site-packages/data/{__init__.py,__pycache__}
}

md5sums=('dc98170bbb10ea1504084b44576a708f')
