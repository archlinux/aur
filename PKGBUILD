# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Augusto F. Hack <hack.augusto@gmail.com>

pkgname=diamond
pkgver=4.0.41
pkgrel=2
pkgdesc="Diamond is daemon that collects system metrics and publishes them to graphite and others"
arch=(any)
url="https://github.com/python-diamond/Diamond"
license=('mit')
depends=('python2' 'python2-configobj')
makedepends=('unzip')
optdepends=('python2-psycopg2: Postgresql collector'
            'python2-pysensors: LMSensors collector'
	    'libvirt-python: LibvirtKVM collector'
	    'python2-yaml: PuppetAgent collector')
backup=(etc/diamond/diamond.conf)
source=("https://pypi.python.org/packages/source/d/diamond/diamond-${pkgver}.tar.gz"
        'diamond.service')
md5sums=('063ee62fc30a678260df582335a583c3'
         '98d7bd00ba751ab416c325eda82e740f')

package() {
	cd "$srcdir/diamond-${pkgver}"

	install -D -m644 "$srcdir/diamond.service" "$pkgdir/usr/lib/systemd/system/diamond.service"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	rm "$pkgdir/etc/diamond/diamond.conf.example.windows"
	rm "$pkgdir/etc/diamond/collectors/"*
	rm "$pkgdir/etc/diamond/handlers/"*
	mv "$pkgdir/etc/diamond/diamond.conf.example" "$pkgdir/etc/diamond/diamond.conf"

	mkdir -p "$pkgdir/var/log/diamond" "$pkgdir/etc/diamond/collectors"
}
