# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=lightdm-webkit2-greeter
pkgver=2.0.0
_bgver=0.6
pkgrel=1
pkgdesc="A webkit2 greeter for LightDM"
arch=('i686' 'x86_64')
url="https://github.com/antergos/lightdm-webkit2-greeter"
license=('GPL3')
source=("${pkgname}-${pkgver}::git+https://github.com/antergos/${pkgname}.git"
		"https://antergos.com/antergos-wallpapers-0.6.zip")
groups=('system')
makedepends=('gnome-doc-utils' 'gobject-introspection' 'intltool' 'gnome-common' 'exo' 'git')
depends=('lightdm' 'webkit2gtk>=2.10' 'webkit2gtk<2.12' 'gtk-engines'
		'gtk3>=3.18' 'gtk3<3.20' 'dbus-glib')
provides=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos=2.3.2')
conflicts=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos')
replaces=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos<2.2.4')
install=greeter.install
backup=("etc/lightdm/${pkgname}.conf")
md5sums=('SKIP'
         'c996d26914e71897019c33854b0ae634')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	git submodule init && git submodule update
	LIBS+="-ljavascriptcoregtk-4.0" \
		./autogen.sh \
			--prefix=/usr \
			--sysconfdir=/etc \
			--libexecdir=/usr/lib/lightdm \
			--bindir=/usr/bin \
			--sbindir=/usr/bin
	make

	cd themes/antergos
	sed -i 's%/usr/share/%/usr/share/lightdm-webkit/themes/%g' index.html
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=$pkgdir install 
	cp -dpr --no-preserve=ownership \
		"${srcdir}/antergos-wallpapers-${_bgver}" \
		"${pkgdir}/usr/share/lightdm-webkit/themes/antergos/wallpapers"
}
