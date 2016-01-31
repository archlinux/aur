## Initial Maintainer: Augusto F. Hack <hack.augusto@gmail.com>
Maintainer='Gilles Hamel <hamelg@laposte.net>'
pkgname=python2-carbon
pkgver=0.9.15
pkgrel=1
pkgdesc='Backend data caching and persistence daemon for Graphite'
arch=('any')
url='https://github.com/graphite-project/carbon'
license=('Apache')
groups=()
depends=('python2' 'python2-twisted>=13.2.0'  'python2-whisper>=0.9.15' 'python2-txamqp')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/graphite-project/carbon/archive/$pkgver.tar.gz" carbon.service carbon.conf)
md5sums=(1962b92b8b672b33d99b00c303fdd5aa 0baa839a459430e58177351cab0ba394 4be791bd13db60510f7459c47afc1e5d)
backup=(etc/carbon/aggregation-rules.conf etc/carbon/blacklist.conf etc/carbon/carbon.amqp.conf etc/carbon/carbon.conf etc/carbon/relay-rules.conf etc/carbon/rewrite-rules.conf etc/carbon/storage-aggregation.conf etc/carbon/storage-schemas.conf etc/carbon/whitelist.conf)

package() {
  cd "$srcdir/carbon-$pkgver"
  python2 setup.py install --root="$pkgdir/" --install-lib=/usr/lib/python2.7/site-packages --install-data=/var/lib/graphite --install-scripts=/usr/bin --optimize=1
  install -D -m644 $srcdir/carbon.service $pkgdir/usr/lib/systemd/system/carbon.service

  # change the directory of the config files
  ls conf | while read conf; do
    install -D -m644 conf/$conf $pkgdir/etc/carbon/${conf/.example}
  done;
  rm -r $pkgdir/var

  # use our config with FHS
  install -D -m644 $srcdir/carbon.conf $pkgdir/etc/carbon/carbon.conf
}

# vim:set ts=2 sw=2 et: