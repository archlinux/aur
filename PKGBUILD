# Maintainer: Carlos Mogas da Silça <r3pek@r3pek.org>
# Contributer: Andrey Vihrov

pkgname=xfce4-screensaver
pkgver=0.1.3
pkgrel=2
pkgdesc='Screensaver for XFCE Desktop'
url="https://www.xfce.org"
arch=('x86_64')
license=('GPL')
depends=('libxss' 'libxklavier>=5.2' 'garcon>=0.5.0')
makedepends=('intltool' 'systemd' 'xfce4-dev-tools' 'xmlto' 'docbook-xsl' 'exo')
groups=('xfce4')
conflicts=('mate-screensaver-gtk3' 'mate-screensaver' 'gnome-screensaver')
replaces=('mate-screensaver-gtk3' 'mate-screensaver' 'gnome-screensaver')
source=("https://git.xfce.org/apps/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz" 
	"xfce4-screensaver.pam")
sha256sums=('8ca6d27d00b907d84188ec8dbd5d66d6c8efe8a30d3b22ebf77bd838e5492574'
            'f8f58c56a2543a005b13271624bbeec43bd6fe4403a7a4b5e9d10e643cd46f37')

build() {
	cd "${pkgname}-${pkgver}"
    	./autogen.sh \
        	--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir="/usr/lib/${pkgname}" \
		--enable-docbook-docs \
		--disable-dependency-tracking
	sed -i -e '/\$CC/s/-shared/\0 -Wl,--as-needed/' libtool
    	make
}

package() {
    	cd "${pkgname}-${pkgver}"
    	make DESTDIR="${pkgdir}" install

	cp -f "${srcdir}/xfce4-screensaver.pam" "${pkgdir}/etc/pam.d/xfce4-screensaver"
}
