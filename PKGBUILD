# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

_name=rogerrouter
pkgname=roger-router-git
pkgver=v2.1.5.r12.gbaa7274
pkgrel=1
pkgdesc="Journal, Fax-Software and Call-Monitor for AVM FRITZ!Box or compatible"
arch=('i686' 'x86_64')
url="https://www.tabos.org/"
license=('GPL2')

# depends=(curl dbus glib2 libsndfile spandsp speex libxml2 gtk3 isdn4k-utils libpeas libsoup gupnp)
depends=(gtk3 libsoup ghostscript librm poppler-glib libgdata libappindicator-gtk3 evolution-data-server)
makedepends=(intltool gobject-introspection meson git)
optdepends=(
	# 'cups: FAX printer'
	# 'evolution-data-server: Address book integration'
	# 'libpulse: Pulse Audio support'
	'portaudio: PortAudio support'
	# 'libsecret: Store passwords in keyring (requires a compatible keyring application like gnome-keyring)'
	# 'libnotify: Desktop notifications'
	# 'libappindicator-gtk3: App indicator support'
)

conflicts=("${_name}" "roger" "roger-router")
provides=("${_name}=${pkgver}" "roger=${pkgver}")
options=('!emptydirs')
install=roger-router.install
source=("git+https://gitlab.com/tabos/rogerrouter.git"
		"open-hiden.patch")
sha1sums=('SKIP'
		  'SKIP')

pkgver() {
	cd "${srcdir}/${_name}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	echo "==> Applying patch"
	patch -Np1 -i "$srcdir"/open-hiden.patch "${srcdir}/${_name}"/roger/org.tabos.roger.desktop.in
}

build() {
	cd "${srcdir}/${_name}"
	meson --prefix /usr --buildtype=plain "builddir"
	ninja -v -C "builddir"
}

check() {
	cd "${srcdir}/${_name}"
	ninja -C "builddir" test
}

package() {
	cd "${srcdir}/${_name}"
	DESTDIR="$pkgdir" ninja -C "builddir" install
}
