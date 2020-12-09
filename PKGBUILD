# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=needrestart-git
pkgver=3.5.r24.g0a43727
pkgrel=2
pkgdesc='Restart daemons after library updates.'
arch=('any')
url="https://github.com/liske/needrestart"
license=('GPL')
depends=('perl-module-find' 'perl-term-readkey' 'perl-proc-processtable'
         'perl-sort-naturally' 'perl-module-scandeps' 'perl-libintl-perl')
makedepends=('git')
optdepends=('iucode-tool: for outdated Intel microcode detection')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}/${pkgname%-git}.conf")
source=('git+https://github.com/liske/needrestart.git'
        'https://github.com/liske/needrestart/pull/200.patch')
sha256sums=('SKIP'
            '852f8a7edc4dda7c7c59a393d4a4ae6defc25d37461a204dc22b7f27bdba7089')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i -e 's|/usr/sbin|/usr/bin|' Makefile
	
	# Add ignore for memfd file used by nvidia binary drivers
	git apply -3 "$srcdir/200.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make DESTDIR="$pkgdir/" install
}
