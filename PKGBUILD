# Maintainer: Marcel Radzio <info@nordgedanken.de>
pkgbase=riot-desktop-git
pkgver=r3963.cf5cf025
pkgrel=2
pkgname=riot-desktop-git
pkgdesc="A glossy Matrix collaboration client for the desktop."
arch=('any')
url="https://riot.im"
_url="https://github.com/vector-im/riot-web"
license=('Apache')
makedepends=('git' 'npm')
conflicts=('riot-desktop' 'riot-web' 'electron')
backup=("etc/riot/config.json")
source=('riot-desktop-git::git://github.com/vector-im/riot-web.git'
        "riot-desktop.desktop"
        "riot-desktop.sh")
sha256sums=('SKIP'
	    'ae0654027f0646178961f6397322aefdc817d052625772dd297d636fe9726aff'
            '0f8d896793e6f6f677febb5921b2256c9786fad67294cb32efd6d059ed21e04c')

pkgver() {
	cd "$srcdir/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}"
	sed -i 's@https://riot.im/download/desktop/update/@null@g' electron_app/riot.im/config.json
}

build() {
	cd "$srcdir/${pkgname}"
	npm install --cache "${srcdir}/npm-cache"
	npm run build --cache "${srcdir}/npm-cache"
}

package() {
	cd "$srcdir/${pkgname}"
	npm install -g --user root --prefix "$pkgdir/usr" electron --cache "${srcdir}/npm-cache"
	chmod -R go-w "$pkgdir"/usr

	install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/riot

	cp -r webapp/* "${pkgdir}"/usr/share/webapps/riot/
	install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/riot/
	ln -s /etc/webapps/riot/config.json "${pkgdir}"/usr/share/webapps/riot/
	echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/riot/version

	cd electron_app
	npm install --cache "${srcdir}/npm-cache"
	cd ..

	install -d "${pkgdir}"{/usr/lib/riot/electron_app,/etc/webapps/riot}

	ln -s /usr/share/webapps/riot "${pkgdir}"/usr/lib/riot/webapp
	ln -s /etc/riot/config.json "${pkgdir}"/etc/webapps/riot/config.json

	install -Dm644 package.json -t "${pkgdir}"/usr/lib/riot
	cp -r electron_app/src "${pkgdir}"/usr/lib/riot/electron_app/
	cp -r electron_app/node_modules "${pkgdir}"/usr/lib/riot/electron_app/
	install -Dm644 electron_app/img/riot.png -t "${pkgdir}"/usr/lib/riot/electron_app/img
	install -Dm644 electron_app/riot.im/config.json -t "${pkgdir}"/etc/riot

	install -Dm644 "${srcdir}"/riot-desktop.desktop "${pkgdir}"/usr/share/applications/riot.desktop
	install -Dm755 "${srcdir}"/riot-desktop.sh "${pkgdir}"/usr/bin/riot-desktop

	install -Dm644 src/skins/vector/img/logos/riot-logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/riot.svg
	for i in 16 24 48 64 96 128 256 512; do
		install -Dm644 electron_app/build/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/riot.png
	done
}
