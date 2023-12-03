# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=iptvorg-epg
pkgver=r6880.35709ae6
pkgrel=1
pkgdesc='Utilities for downloading the EPG (Electronic Program Guide) for thousands of TV channels from hundreds of sources'
arch=(any)
url=https://github.com/iptv-org/epg
license=(Unlicense)
depends=(
	python
	libxml2
	nodejs
	npm
	subversion
)
makedepends=(
	git
	nodejs
	npm
)
source=(
	git+https://github.com/iptv-org/epg.git
	iptvorg-epg.sh
	my.channels.xml
)
sha256sums=('SKIP'
            '44f5824af71a9f000d10b5360ade4d9e3dab3386956326ee7f60b5e35c51809f'
            '26e87976d170c78e458ac44e65d305374aef67d2ab44a17bce151e86a2b783e5')

pkgver() {
	cd epg
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd epg
	npm i --cache ../npm-cache
	cd ..
	bsdtar -a -cf epg.tgz epg
}

package() {
	# Install npm application
	install -d "$pkgdir"/usr/share/$pkgname "$pkgdir"/usr/bin
	install -Dm644 epg.tgz "$pkgdir"/usr/share/$pkgname
	# Install executable and license
	install -Dm755 iptvorg-epg.sh "$pkgdir"/usr/bin/iptvorg-epg
	install -Dm644 epg/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	# Install example custom-channels-xml file
	install -Dm644 my.channels.xml "$pkgdir"/usr/share/$pkgname/my.channels.xml
}
