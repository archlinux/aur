## Initial Maintainer: Augusto F. Hack <hack.augusto@gmail.com>
Maintainer='Gilles Hamel <hamelg@laposte.net>'
pkgname=python-carbon
pkgver=1.1.7
pkgrel=1
pkgdesc='Backend data caching and persistence daemon for Graphite'
arch=('any')
url='https://github.com/graphite-project/carbon'
license=('Apache')
conflicts=('python2-carbon')
depends=('python' 'python-whisper' 'python-twisted')
makedepends=('python-setuptools')
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
  28b83a0fd446a730678be335326446bd
	c6201ce8a290d919b7f486916fb2f9b9
	33c2251f7dfbe484e1a627e0408fdf36
	f7914dbb75fc3d65623a159333ea0528
	11354dec647b82eb4099e9d2025ddf61
	d4d37f4e603f1ab798e77caae335358f
	5440bb9e2bb2aa8a48ee8de985f50cb8
	35eeae37bf98235ec77ae0b2ecd3270c
	bfeed48d338a306869381fe80a21b0ad
	d1f67d2baeac57365b3622aa9c6f2d37)
	
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
  GRAPHITE_NO_PREFIX=1 python setup.py install --root="$pkgdir/" --install-data=/var/lib/graphite --install-scripts=/usr/bin --optimize=1
  
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
