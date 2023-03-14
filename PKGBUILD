# Maintainer: Lari Tikkanen <lartza@outlook.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sébastien Luttringer
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>
# Contributor: TingPing <tingping@tingping.se>

_gitname=znc
pkgname=znc-git
pkgver=1.8.2.r252.g0772dd57
pkgrel=1
pkgdesc='An IRC bouncer with modules & scripts support'
url='https://wiki.znc.in/ZNC'
license=('Apache')
arch=('i686' 'x86_64')
provides=('znc')
conflicts=('znc')
depends=('libsasl' 'icu' 'boost-libs')
makedepends=('swig' 'tcl' 'python' 'perl' 'cmake' 'boost' 'git')
optdepends=('tcl: modtcl module'
            'python: modpython module'
            'perl: modperl module'
            'cyrus-sasl: saslauth module')
source=('git+https://github.com/znc/znc.git'
        'git+https://github.com/znc/Csocket.git'
        'git+https://github.com/google/googletest.git'
        'znc.sysusers'
        'znc.tmpfiles')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '8802f1b84ab3031db7cc45678f008ceca9b08b2012412a3d4ff1ea596586bb2a'
            '8cd1b5b011c706fea9dc0c70d4daa75a53bf0966d6e96a3fce3a541777aa2771')
install='znc-git.install'

pkgver(){
	cd "$_gitname"

	git describe | sed 's/^znc-//; s/-/.r/; s/-/./'
}

prepare() {
        mkdir -p build

	cd "$_gitname"

	git submodule init
	git config submodule.Csocket.url "$srcdir/Csocket"
	git config submodule.third_party/googletest.url "$srcdir/googletest"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd build

	cmake "../$_gitname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DWANT_PYTHON=ON \
		-DWANT_PERL=ON \
		-DWANT_TCL=ON \
		-DWANT_SYSTEMD=ON \
		-DSYSTEMD_DIR=/usr/lib/systemd/system
	make
}

package() {
	cd build

	DESTDIR="$pkgdir" make install
	install -Dm644 "$srcdir/znc.sysusers" "$pkgdir/usr/lib/sysusers.d/znc.conf"
	install -Dm644 "$srcdir/znc.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/znc.conf"
}
