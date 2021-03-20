# Maintainer: Yuriusu <yuriusu@tuta.io>

pkgname='material-icons-fonts'
pkgver=r1.ebab72802
pkgrel=1
pkgdesc='Material Design icons by Google'
arch=('any')
url='https://material.io/icons'
license=('Apache')
makedepends=('git')
options=('!strip')

prepare() {
	# Use filtered clone with sparse checkout to minimize objects fetched from remote server.
	git clone --filter=blob:none --depth=1 --no-checkout https://github.com/google/material-design-icons $pkgname
	cd $pkgname
	git config core.sparseCheckout true
	echo LICENSE >> .git/info/sparse-checkout
	echo font/*.ttf >> .git/info/sparse-checkout
	echo font/*.otf >> .git/info/sparse-checkout
	git checkout master
}

pkgver() {
	cd $pkgname
	printf 'r%s.%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
	cd $pkgname
	install -D -m 0644 -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" font/*.{ttf,otf}
	install -D -m 0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
