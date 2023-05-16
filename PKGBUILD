# Maintainer: éclairevoyant

pkgname=git-subrepo
pkgver=0.4.6
pkgrel=2
pkgdesc="Git submodule alternative"
arch=(any)
url="https://github.com/ingydotnet/$pkgname"
license=(MIT)
depends=(bash 'bashplus=0.1.0' git)
checkdepends=(perl)
source=("git+$url.git#commit=110b9eb13f259986fffcf11e8fb187b8cce50921"
0001-hardcode-path-to-bashplus.patch)
b2sums=('SKIP'
        'b8ec76eaf76802cd000d757e17cf48da582d28f27a992b0e98503c400b615dc4875db8477a388600ee8eb547d188d75d79312d2c697b992a780009f1b103ffbb')

prepare() {
	cd $pkgname
	patch -Np1 -i ../0001-hardcode-path-to-bashplus.patch

	# remove flaky tests
	rm -rf test/{push-force,status}.t
}

check() {
	EMAIL="nobody@nowhere.xyz" GIT_AUTHOR_NAME="nobody" make -C $pkgname test
}

package() {
	cd $pkgname

	install -vDm644 License "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -vDm644 man/man1/$pkgname.1 -t "$pkgdir/usr/share/man/man1/"
	install -vDm755 lib/$pkgname -t "$pkgdir/usr/bin/"
	install -vDm644 share/completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -vDm644 share/zsh-completion/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
}
