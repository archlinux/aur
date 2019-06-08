# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=cryptpad
pkgver=2.23.0
pkgrel=1
pkgdesc="Realtime collaborative visual editor with zero knowlege server"
arch=('any')
url="https://github.com/xwiki-labs/cryptpad"
license=('AGPL3')
depends=('nodejs')
makedepends=('npm' 'bower' 'git')
source=("https://github.com/xwiki-labs/cryptpad/archive/$pkgver.tar.gz"
	"cryptpad.service"
	"cryptpad.sysusers"
	"cryptpad.tmpfiles")
sha256sums=('5a13821092441db8b699e2196443c231a8096275c6305e750c39d1c6148f3099'
            '522851fbe4e0e41fd6ece8b2b0ed17bbae0233a58328b7994a5207aa341a635b'
            '999a271d64b75c7c447fdb21486b27463c04679677e57ea9551a3b0429c618f6'
            'fa710a977248c1cd2482d4624325d3f8ac8479c9d748dd636077f55f48906d44')

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	
	npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache" 
        bower install --allow-root

	rm -rv "${pkgdir}"/usr

	# make sure directory permissions are acceptable
	find . -type d -exec chmod 755 {} +

	# Documentation
	install -v -t "${pkgdir}"/usr/share/doc/$pkgname -Dm 644 docs/ARCHITECTURE.md -Dm 644 docs/example.nginx.conf -Dm 644 CHANGELOG.md 
	
	# Cryptpad
	install -vd "${pkgdir}"/usr/share/$pkgname 
	cp -rv {customize.dist,historyKeeper.js,import,lib,node_modules,rpc.js,scripts,server.js,storage,www,package.json} "${pkgdir}"/usr/share/$pkgname

	# Config
	sed -e "s|\(Path: '\)\./|\1/var/lib/cryptpad/|" \
	    -e "s|'/var/lib/cryptpad/data/logs'|false|" \
	    -e "s|logToStdout: false|logToStdout: true|" \
	    -i config/config.example.js

	install -vDm 644 config/config.example.js "${pkgdir}/etc/webapps/$pkgname/config.example.js"
	ln -vs "/etc/webapps/$pkgname" "${pkgdir}"/usr/share/$pkgname/config

	# systemd
	install -Dm 644 "${srcdir}"/cryptpad.sysusers "${pkgdir}"/usr/lib/sysusers.d/cryptpad.conf
	install -Dm 644 "${srcdir}"/cryptpad.service "${pkgdir}"/usr/lib/systemd/system/cryptpad.service
    	install -Dm 644 "${srcdir}"/cryptpad.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/cryptpad.conf
}
