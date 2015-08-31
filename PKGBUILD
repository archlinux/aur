# Maintainer: Abelardo Ricart <aricart@gmail.com>
# Contributor: Thorsten TÃpper <atsutane-tu@freethoughts.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Michal Krenek <mikos@sg1.cz>
# Contributor: Ryon Sherman <ryon.sherman@gmail.com>
# Moved 2 AUR4: GI_Jack <iamjacksemail@hackermail.com>

pkgname=john-opencl
pkgver=1.7.9
pkgrel=2
_jumbover=7
pkgdesc="John The Ripper - A fast password cracker (jumbo-$_jumbover and OpenCL support included)"
arch=('i686' 'x86_64')
url="http://www.openwall.com/john/"
license=('GPL2' 'custom')
depends=('openssl' 'libcl')
conflicts=('john')
provides=('john')
makedepends=('opencl-headers')
optdepends=("perl: for executing some of the scripts at /usr/share/john"
            "ruby: for executing some of the scripts at /usr/share/john"
            "python: for executing some of the scripts at /usr/share/john")
backup=('etc/john/john.conf')
install=john.install
source=(http://www.openwall.com/john/g/john-$pkgver.tar.bz2
        http://www.openwall.com/john/g/john-$pkgver-jumbo-$_jumbover.diff.gz
        ftp://ftp.kfki.hu/pub/packages/security/ssh/ossh/libdes-4.04b.tar.gz
        params.h.patch)
sha256sums=('1d40083e37a7bc1ba1177651cbb27898dcf2a812b8ccf1430db0c372ac6dc199'
            '9e87e5660965e6e55214176299f67dd1b8a40820805441c62a57af6a6a4a19f5'
            'd6b69409fdfc6c8ff092d3d3b65254bc29dd8cd73f8e97320710095909a6e2e9'
            '10c051d7b1948a406c34e8baf07a5c5b9f141b5161a0c2168ca46ca8db336d52')

build() {
	# jumbo patch
	cd ${srcdir}/john-$pkgver
	patch -p1 < ${srcdir}/john-$pkgver-jumbo-$_jumbover.diff
	cd ${srcdir}/john-$pkgver/src/

	# patch default params
	patch -p0 < ${srcdir}/params.h.patch
	if [ "$CARCH" == "x86_64" ]; then
	    sed -i 's|CFLAGS = -c -Wall -O2|CFLAGS = -c -Wall -O2 -march=x86-64 -DJOHN_SYSTEMWIDE=1|' Makefile
	    sed -i 's|^LDFLAGS =\(.*\)|LDFLAGS =\1 -lm|' Makefile
	    sed -i -e 's|-m486||g' Makefile
	  else sed -i 's|CFLAGS = -c -Wall -O2|CFLAGS = -c -Wall -O2 -march=i686 -DJOHN_SYSTEMWIDE=1|' Makefile
	fi
	sed -i 's|LIBS = -ldes|LIBS = -ldes -Ldes|' Makefile
#	sed -i 's|#include <des.h>|#include "des/des.h"|' KRB5_fmt.c
	sed -i 's|#include <des.h>|#include "des/des.h"|' KRB5_std.h

	# enable OMP
	sed -i 's|#OMPFLAGS = -fopenmp$|OMPFLAGS = -fopenmp|' Makefile

	# build john
	if [ "$CARCH" == "x86_64" ]; then
	    make linux-x86-64-opencl
	  else make linux-x86-opencl
	fi
}

package() {
	# config file
	sed -i 's|$JOHN/john.local.conf|/etc/john/john.local.conf|g' ${srcdir}/john-$pkgver/run/john.conf
	sed -i 's|$JOHN|/usr/share/john|g' ${srcdir}/john-$pkgver/run/john.conf
	install -Dm644 ${srcdir}/john-$pkgver/run/john.conf ${pkgdir}/etc/john/john.conf

	# docs
	install -d ${pkgdir}/usr/share/doc/john
	install -m644 ${srcdir}/john-$pkgver/doc/* ${pkgdir}/usr/share/doc/john/
	install -Dm644 ${srcdir}/john-$pkgver/doc/LICENSE ${pkgdir}/usr/share/licenses/john/LICENSE

	# install password list, charset files
	install -d ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/john-${pkgver}/run/password.lst ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/john-${pkgver}/run/dictionary.rfc2865 ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/john-${pkgver}/run/stats ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/john-${pkgver}/run/{all,alnum,alpha,digits,lanman}.chr \
 			${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/john-${pkgver}/run/{dumb16,dumb32,dynamic}.conf \
			${pkgdir}/usr/share/john/

	# install opencl files
	install -m644 ${srcdir}/john-${pkgver}/run/*.cl ${pkgdir}/usr/share/john/

	# install scripts
	john_scripts=(benchmark-unify \
		cracf2john.py \
		genincstats.rb \
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
		install -m755 ${srcdir}/john-${pkgver}/run/${john_script} \
			${pkgdir}/usr/share/john
	done

	install -m644 ${srcdir}/john-${pkgver}/run/dynamic.conf ${pkgdir}/etc/john/
	install -Dm644 ${srcdir}/john-${pkgver}/run/john.bash_completion \
		${pkgdir}/etc/bash_completion.d/john

	# install binaries
	install -Dm755 ${srcdir}/john-$pkgver/run/john ${pkgdir}/usr/bin/john
	install -Dm755 ${srcdir}/john-$pkgver/run/calc_stat ${pkgdir}/usr/bin/calc_stat
	install -Dm755 ${srcdir}/john-$pkgver/run/genmkvpwd ${pkgdir}/usr/bin/genmkvpwd
	install -Dm755 ${srcdir}/john-$pkgver/run/mkvcalcproba ${pkgdir}/usr/bin/mkvcalcproba
	install -Dm755 ${srcdir}/john-$pkgver/run/relbench ${pkgdir}/usr/bin/relbench
	install -Dm755 ${srcdir}/john-$pkgver/run/tgtsnarf ${pkgdir}/usr/bin/tgtsnarf
	install -Dm755 ${srcdir}/john-$pkgver/run/mailer ${pkgdir}/usr/bin/john-mailer
	install -Dm755 ${srcdir}/john-$pkgver/run/raw2dyna ${pkgdir}/usr/bin/raw2dyna

	# create links
	cd ${pkgdir}/usr/bin
	ln -s john hccap2john
	ln -s john keepass2john
	ln -s john pdf2john
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

