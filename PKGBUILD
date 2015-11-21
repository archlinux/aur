# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sébastien Luttringer
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>
# Maintainer: TingPing <tingping@tingping.se>

_gitname=znc
pkgname=znc-git
pkgver=1.6.2.r482.gf3bc06c
pkgrel=1
pkgdesc='An IRC bouncer with modules & scripts support'
url='http://znc.in/'
license=('Apache')
arch=('i686' 'x86_64')
provides=('znc')
conflicts=('znc')
depends=('libsasl' 'icu')
makedepends=('swig' 'tcl' 'python' 'perl' 'git')
optdepends=('tcl: modtcl module'
            'python: modpython module'
			'perl: modperl module' 
			'cyrus-sasl: saslauth module')
source=('git+https://github.com/znc/znc.git'
        'git+https://github.com/jimloco/Csocket.git'
        'git+https://github.com/google/googletest.git'
        'znc.sysusers')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '919705dccc42d3bff1549d3b3680e55a')
install='znc-git.install'

pkgver(){
	cd "$_gitname"

	git describe | sed 's/^znc-//; s/-/.r/; s/-/./'
}

prepare() {
	cd "$_gitname"

	git submodule init
	git config submodule.Csocket.url "$srcdir/Csocket"
	git config submodule.third_party/googletest.url "$srcdir/googletest"
	git submodule update

	# service file is invalid: https://github.com/znc/znc/issues/1165
	sed -i 's|@bindir@|/usr/bin|' znc.service.in
}

build() {
	cd "$_gitname"

	./autogen.sh
	./configure --prefix=/usr \
		--with-systemdsystemunitdir=/usr/lib/systemd/system \
		--enable-cyrus \
		--enable-tcl \
		--enable-perl \
		--enable-python
	make
}

package() {
	cd "$_gitname"

	DESTDIR="$pkgdir" make install
	install -Dm644 "$srcdir/znc.sysusers" "$pkgdir/usr/lib/sysusers.d/znc.conf"

}
