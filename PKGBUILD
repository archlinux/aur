# Maintainer: Oscar Vidakovic <vidakovic-aur at vidakovic dot es>
pkgname=ring-daemon
pkgver=2.2.0
pkgrel=2
pkgdesc="Ring daemon"
license=('GPL3')
arch=('i686' 'x86_64')
url="http://ring.cx/"
provides=('ring-daemon')
conflicts=('ring-daemon-git')
depends=('boost-libs' 'dbus-c++' 'expat' 'ffmpeg' 'gsm' 'gnutls' 'libdbus' 'libsamplerate'
	 'libsndfile' 'libsrtp' 'libupnp' 'opendht-git' 'openssl' 'opus' 'pcre'
	 'speex' 'speexdsp' 'udev' 'yaml-cpp' 'yasm')
makedepends=('alsa-lib' 'boost' 'dbus-c++' 'git' 'jack' 'libpulse')
optdepends=('alsa-lib: alsa support'
	    'jack: for jack audio server support'
	    'libpulse: pulseaudio audio server support')
source=("git+https://gerrit-ring.savoirfairelinux.com/${pkgname}#tag=${pkgver}"
	"nullptr-bool-gcc5.patch"
	"fix-isblank-gcc5.patch"
	"pjproject-apply-isblank.patch")
md5sums=('SKIP'
	 '50a40e0dc25f060271f6a6360f02ed71'
	 '26b03afc683fd62de8dfc8a6eb925d95'
	 '2b8d61e324ea8483b65ac3782bd3d739')

prepare() {
	msg2 'Creating directory for custom pjproject build...'
	mkdir -p "${pkgname}/contrib/native"
	# Patches from Baptiste Jonglez to support building with gcc 5
	# Taken fom https://aur.archlinux.org/packages/ring-daemon-git
	msg2 'Applying patches to allow building with gcc 5'
	cd "${pkgname}"
	# See https://gcc.gnu.org/gcc-5/porting_to.html ("C++ language issues")
	patch -p1 -i "$srcdir/nullptr-bool-gcc5.patch"
	# Patch bundled pjproject for gcc 5, see
	# https://projects.savoirfairelinux.com/issues/73855
	cp "${srcdir}/fix-isblank-gcc5.patch" "contrib/src/pjproject/"
	patch -p1 -i "$srcdir/pjproject-apply-isblank.patch"
}

build() {
	msg2 'Building pjproject'
	cd "${srcdir}/${pkgname}/contrib/native"
	../bootstrap
	make .pjproject

	msg2 'building'
	cd ../..
  	./autogen.sh
	./configure --prefix=/usr \
		--sbindir=/usr/bin \
		--libexecdir=/usr/bin \
		--sysconfdir=/etc
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" install

	msg2 'Cleaning up pkgdir...'
	find "$pkgdir" -type d -name .git -exec rm -r '{}' +
	find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

