# Maintainer: Matt R <dev at rhoatech.com>
# Contributor: Christian Hesse <mail at eworm.de>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail.com> ([community] package)

pkgname=remmina-git
pkgver=1.4.28.r31.g07c0a3f27
pkgrel=1
pkgdesc='A remote desktop client written in GTK+ - git checkout'
arch=(i686 x86_64)
url='http://www.remmina.org/'
license=('GPL')
depends=('zlib' 'libjpeg' 'libssh' 'avahi' 'vte3'
	'libgcrypt' 'libxdmcp' 'libgnome-keyring' 'libvncserver'
	'libsecret' 'webkit2gtk-4.1' 'libsodium')
makedepends=('git' 'intltool' 'pkgconfig' 'cmake' 'avahi'
    'libxkbfile' 'freerdp' 'gobject-introspection'
    'spice' 'spice-gtk' 'spice-protocol' 'gnome-keyring' 'kwallet' 'gtk-vnc'
    'libgnome-keyring' 'docbook-xsl' 'libpulse' 'libappindicator-gtk3')
optdepends=('avahi' 'libxkbfile' 'gobject-introspection' 'spice' 'spice-gtk' 'spice-protocol' 'pyhoca-cli')
replaces=('remmina-plugins')
provides=('remmina' 'grdc' "grdc=${pkgver}" 'remmina-plugins')
conflicts=('remmina' 'grdc')
install=remmina.install
source=('git+https://gitlab.com/remmina/remmina.git')
sha256sums=('SKIP')

pkgver() {
	cd remmina/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd remmina/

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
        -DWITH_FREERDP_MASTER=ON \
        -DWITH_CUPS=ON \
	-DWITH_LIBSSH=ON \
        -DWITH_NEWS=ON \
        -DWITH_KF5WALLET=ON \
        -DWITH_PYTHONLIBS=OFF \
        -DWITH_GVNC=ON \
        -DWITH_X2GO=ON \
		.
	make
}

package() {
	cd remmina/

	make DESTDIR="${pkgdir}/" install
}
