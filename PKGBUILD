# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>

pkgname=perl-adwaita
pkgver=0.001.r6.54334c1
pkgrel=1
url="https://gitlab.gnome.org/World/Perl/perl-adwaita/"
license=('LGPL')
pkgdesc="Perl bindings to the 1.x series of the libadwaita platform library for writing GNOME applications"
arch=('any')
depends=('libadwaita' 'perl-cairo-gobject' 'perl-glib-object-introspection')
makedepends=('perl-dist-zilla' 'perl-dist-zilla-plugin-git')
source=(
	${pkgname}::git+https://gitlab.gnome.org/World/Perl/perl-adwaita/
)
sha512sums=('SKIP')

pkgver() {
	cd $srcdir/$pkgname

	printf "%s.r%s.%s" \
		$(perl -MConfig::INI::Reader -e 'print Config::INI::Reader->read_file(q{dist.ini})->{_}->{version}') \
		$(git rev-list --count HEAD) \
		$(git rev-parse --short=7 HEAD)
}

build() {
	cd $srcdir/$pkgname
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

	dzil build
}

check() {
	cd $srcdir/$pkgname
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1

	dzil test
}

package() {
	cd $srcdir/$pkgname
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

	dzil run make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
