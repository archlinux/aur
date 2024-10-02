# Maintainer: aksr <aksr at t-com dot me>
pkgname=mailx-git
pkgver=r134.8d4e5b7
pkgrel=3
pkgdesc='A small mailx clone, optimized to handle large mbox files.'
arch=('i686' 'x86_64')
url='http://litcave.rudi.ir/'
url='http://repo.or.cz/w/mailx.git'
license=('custom:BSD')
makedepends=('git')
optdepends=('pop3-git: A simple pop3 mail client.'
            'smtp-git: A simple smtp mail sender.')
provides=("${pkgname%-*}")
install="${pkgname}".install
source=("$pkgname::git://repo.or.cz/mailx.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/$pkgname
	sed -i 's@\(#define VISUAL\).*"@\1 "vi"@g' config.h
	sed -i 's@\(#define SENDMAIL\).*@\1 "sendmail"@g' config.h

	# obligatory: define your home directory
	sed -i 's@\(#define FOLDER\).*@\1 "'$HOME'/.mailx/"@g' config.h
	# obligatory: define your e-mail address
	sed -i 's!\(#define FROM\).*!\1 "YOUR-E-MAIL@ADDRESS"!g' config.h
}

build() {
	cd $srcdir/$pkgname
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 mailx $pkgdir/usr/bin/neatmailx
	install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
}
