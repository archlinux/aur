## Initial Maintainer: Augusto F. Hack <hack.augusto@gmail.com>
Maintainer='Gilles Hamel <hamelg@laposte.net>'
pkgname=python2-carbon
pkgver=1.1.1
pkgrel=1
pkgdesc='Backend data caching and persistence daemon for Graphite'
arch=('any')
url='https://github.com/graphite-project/carbon'
license=('Apache')
depends=('python2' 'python2-whisper' 'python2-twisted>=13.2.0')
optdepends=('python2-txamqp: AMQP support')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/graphite-project/carbon/archive/$pkgver.tar.gz"
	carbon.conf
	carbon-aggregator.service
	carbon-aggregator@.service
	carbon-cache.service
	carbon-cache@.service
	carbon-relay.service
	carbon-relay@.service
	carbon.sysusers
	carbon.tmpfiles)
	
md5sums=(
	fdadbf316a9d1145fe14ec7fdf5cf732
	c6201ce8a290d919b7f486916fb2f9b9
	33c2251f7dfbe484e1a627e0408fdf36
	f7914dbb75fc3d65623a159333ea0528
	11354dec647b82eb4099e9d2025ddf61
	d4d37f4e603f1ab798e77caae335358f
	5440bb9e2bb2aa8a48ee8de985f50cb8
	35eeae37bf98235ec77ae0b2ecd3270c
	89269343d20915b28b75d8d845c8e71f
	035251ab4036df23c75c521b702fbea1)
	
backup=(
	etc/carbon/aggregation-rules.conf
	etc/carbon/blacklist.conf
	etc/carbon/carbon.amqp.conf
	etc/carbon/carbon.conf
	etc/carbon/relay-rules.conf
	etc/carbon/rewrite-rules.conf
	etc/carbon/storage-aggregation.conf
	etc/carbon/storage-schemas.conf
	etc/carbon/whitelist.conf)

package() {

  cd "$srcdir"
  ls *.service | while read service; do
    install -D -m644 $service "$pkgdir"/usr/lib/systemd/system/$service
  done ;
  install -Dm644 carbon.sysusers "$pkgdir"/usr/lib/sysusers.d/carbon.conf
  install -Dm644 carbon.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/carbon.conf

  cd "$srcdir/carbon-$pkgver"
  python2 setup.py install --root="$pkgdir/" --install-lib=/usr/lib/python2.7/site-packages --install-data=/var/lib/graphite --install-scripts=/usr/bin --optimize=1
  
  # change the directory of the config files
  ls conf | while read conf; do
    install -D -m644 conf/$conf "$pkgdir"/etc/carbon/examples/${conf/.example}
  done;
  rm -r "$pkgdir"/var

  install -D -m644 /dev/null "$pkgdir"/etc/carbon/aggregation-rules.conf
  install -D -m644 /dev/null "$pkgdir"/etc/carbon/blacklist.conf
  install -D -m644 /dev/null "$pkgdir"/etc/carbon/carbon.amqp.conf
  install -D -m644 /dev/null "$pkgdir"/etc/carbon/relay-rules.conf
  install -D -m644 /dev/null "$pkgdir"/etc/carbon/rewrite-rules.conf
  install -D -m644 /dev/null "$pkgdir"/etc/carbon/whitelist.conf
  install -D -m644 conf/storage-aggregation.conf.example "$pkgdir"/etc/carbon/storage-aggregation.conf
  install -D -m644 conf/storage-schemas.conf.example "$pkgdir"/etc/carbon/storage-schemas.conf
  
  # use our simple config with FHS
  install -D -m644 "$srcdir"/carbon.conf "$pkgdir"/etc/carbon/carbon.conf
}

# vim:set ts=2 sw=2 et:
