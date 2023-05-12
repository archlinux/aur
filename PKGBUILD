# Maintainer: éclairevoyant

pkgname=git-subrepo
pkgver=0.4.6
pkgrel=1
pkgdesc="Git submodule alternative"
arch=(any)
url="https://github.com/ingydotnet/$pkgname"
license=(MIT)
depends=(bash git)
checkdepends=(perl)
backup=("etc/profile.d/$pkgname.sh")
source=("git+$url.git#commit=110b9eb13f259986fffcf11e8fb187b8cce50921")
b2sums=('SKIP')

check() {
	# TODO handle empty email/user in clean chroots
	make -C $pkgname test
}

package() {
	cd $pkgname

	install -vdm755 "$pkgdir/opt/"
	cp -R . "$pkgdir/opt/$pkgname"
	rm -rf "$pkgdir/opt/$pkgname/"{.git{,attributes,ignore},ext/test-more-bash,man,test}

	install -vdm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sf "/opt/$pkgname/License" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -vDm644 man/man1/$pkgname.1 -t "$pkgdir/usr/share/man/man1/"
	install -vDm755 /dev/stdin "$pkgdir/etc/profile.d/$pkgname.sh" <<eof
source /opt/git-subrepo/.rc
eof

	#make DESTDIR="$pkgdir" PREFIX="/usr" install
	#install -vDm755 lib/$pkgname -t "$pkgdir/usr/bin/"
	#install -vDm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	#install -vDm644 _$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
}
