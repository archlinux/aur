# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=zfsmond-git
pkgver=90cc056
pkgrel=1
pkgdesc='Tiny ZFS Web Interface written in AngularJS and Flask Restful'
url='https://github.com/FireDrunk/ZFSmond'
license=('GPL')
depends=('python2-pyudev' 'python2-pysmart' 'python2-flask' 'python2-flask-restful' 'python2-enum34' 'python2-cffi' 'python2-libzfs-git')
source=('git://github.com/FireDrunk/ZFSmond'
'zfsmond.service')
sha256sums=('SKIP'
            '27f05cd919b88ee691c6a1fd95c51ced540bbbd96b1ba3458c17149cc8fd25da')
arch=('any')

pkgver() {
	cd "${srcdir}/ZFSmond"
	git describe --always
}

build() {
	# Ugly hack to decrease verbosity
	sed -i 's/app.debug = True/app.debug = False'$"\n"'import logging'$"\n"'logging.getLogger("werkzeug").setLevel(logging.ERROR)/g' "${srcdir}/ZFSmond/main.py"
}

package() {
	cd "${srcdir}/ZFSmond"
	install -Dm755 main.py "${pkgdir}/usr/share/webapps/ZFSmond/main.py"
	install -Dm644 "${srcdir}/zfsmond.service" "${pkgdir}/usr/lib/systemd/system/zfsmond.service"
	cp -Rp models static "${pkgdir}/usr/share/webapps/ZFSmond"
}
