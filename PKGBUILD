# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>

_pkgname=john
pkgname=john-git
pkgver=r10260.8ebb42d
pkgrel=1
pkgdesc="fast password cracker (using the git repository of the jumbo patch)"
arch=('i686' 'x86_64')
url="http://www.openwall.com/$_pkgname/"
license=('GPL2' 'custom')
depends=('openssl')
makedepends=('git' 'libgsf' 'libxml2' 'nss')
optdepends=("perl: for executing some of the scripts at /usr/share/john"
            "ruby: for executing some of the scripts at /usr/share/john"
            "python: for executing some of the scripts at /usr/share/john"
            "nss: to use mozilla2john"
            "libgsf: to use office2john"
            "libxml2: to use office2john")
provides=('john')
conflicts=('john')
backup=('etc/john/john.conf')
install=john.install
options=('!strip')
source=("$_pkgname::git+https://github.com/magnumripper/JohnTheRipper.git"
        "params.h.patch")
md5sums=('SKIP'
        'f69ed632eba8fb9e45847a4b4a323787')


pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname/src"

	patch -p0 -i ${srcdir}/params.h.patch
}

build() {
  cd "$srcdir/$_pkgname/src"

  ./configure --with-systemwide

  make clean

  make
}

package() {
	# config file
	sed -i 's|$JOHN/john.local.conf|/etc/john/john.local.conf|g' ${srcdir}/$_pkgname/run/john.conf
	sed -i 's|$JOHN|/usr/share/john|g' ${srcdir}/$_pkgname/run/john.conf
	install -Dm644 ${srcdir}/$_pkgname/run/john.conf ${pkgdir}/etc/john/john.conf

	# docs
	install -d ${pkgdir}/usr/share/doc/john
	install -m644 ${srcdir}/$_pkgname/doc/* ${pkgdir}/usr/share/doc/john/
	install -Dm644 ${srcdir}/$_pkgname/doc/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

	# install password list, charset files
	install -d ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/$_pkgname/run/password.lst ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/$_pkgname/run/dictionary.rfc2865 ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/$_pkgname/run/stats ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/$_pkgname/run/*.chr \
			${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/$_pkgname/run/{dumb16,dumb32,dynamic,dynamic_flat_sse_formats,korelogic,regex_alphabets,repeats16,repeats32}.conf \
			${pkgdir}/usr/share/john/

	# install scripts
	john_scripts=(benchmark-unify \
		cracf2john.py \
		genincstats.rb \
		ikescan2john.py \
		ldif2john.pl \
		lion2john-alt.pl \
		lion2john.pl \
		netntlm.pl \
		netscreen.py \
		odf2john.py \
		pass_gen.pl \
		radius2john.pl \
		sap2john.pl \
		sha-dump.pl \
		sha-test.pl \
		sipdump2john.py)
	for john_script in "${john_scripts[@]}"; do
		install -m755 ${srcdir}/$_pkgname/run/${john_script} \
			${pkgdir}/usr/share/john
	done

	install -m644 ${srcdir}/$_pkgname/run/dynamic.conf ${pkgdir}/etc/john/
	install -Dm644 ${srcdir}/$_pkgname/run/john.bash_completion \
		${pkgdir}/etc/bash_completion.d/john

	# install binaries
	install -Dm755 ${srcdir}/$_pkgname/run/john ${pkgdir}/usr/bin/john
	install -Dm755 ${srcdir}/$_pkgname/run/calc_stat ${pkgdir}/usr/bin/calc_stat
	install -Dm755 ${srcdir}/$_pkgname/run/genmkvpwd ${pkgdir}/usr/bin/genmkvpwd
	install -Dm755 ${srcdir}/$_pkgname/run/mkvcalcproba ${pkgdir}/usr/bin/mkvcalcproba
	install -Dm755 ${srcdir}/$_pkgname/run/relbench ${pkgdir}/usr/bin/relbench
	install -Dm755 ${srcdir}/$_pkgname/run/tgtsnarf ${pkgdir}/usr/bin/tgtsnarf
	install -Dm755 ${srcdir}/$_pkgname/run/mailer ${pkgdir}/usr/bin/john-mailer
	install -Dm755 ${srcdir}/$_pkgname/run/raw2dyna ${pkgdir}/usr/bin/raw2dyna
	install -Dm755 ${srcdir}/$_pkgname/run/office2john.py ${pkgdir}/usr/bin/office2john

	# create links
	cd ${pkgdir}/usr/bin
	ln -s john hccap2john
	ln -s john keepass2john
	ln -s john mozilla2john
	ln -s john pdf2john
	ln -s john pfx2john
	ln -s john pwsafe2john
	ln -s john racf2john
	ln -s john rar2john
	ln -s john ssh2john
	ln -s john unafs
	ln -s john unique
	ln -s john unshadow
	ln -s john undrop
	ln -s john zip2john
}

# vim:set ts=2 sw=2 et:

