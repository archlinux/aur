# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: éclairevoyant

pkgname=git-subrepo
pkgver=0.4.9
pkgrel=1
pkgdesc='Git submodule alternative'
arch=(any)
url="https://github.com/ingydotnet/$pkgname"
license=(MIT)
depends=(bash
         bashplus
         git)
checkdepends=(perl)
source=("git+$url.git#tag=$pkgver"
        0001-hardcode-path-to-bashplus.patch)
sha256sums=('f30ca71f4a9115381e266985cb3b63a1c983c52a86a0951799641340dee484a2'
            '2f6d99fa9f253195e87cbe8c443dfc25f2c87342c490acf2f0f3dcf19cc8a23a')

prepare() {
	cd $pkgname
	patch -Np1 -i ../0001-hardcode-path-to-bashplus.patch
	# remove flaky tests
	rm -rf test/{push-force,status}.t
	# remove tests irrelevant to integration
	rm -rf test/{shellcheck,zsh}.t
}

check() {
	export EMAIL="nobody@nowhere.xyz"
        export GIT_AUTHOR_NAME="nobody"
        make -C $pkgname test
}

package() {
	cd $pkgname
	install -Dm755 -t "$pkgdir/usr/bin/" "lib/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" "man/man1/$pkgname.1"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" License
	install -Dm644 share/completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions/" "share/zsh-completion/_$pkgname"
}
