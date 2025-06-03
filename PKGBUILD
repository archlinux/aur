# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Angel de Vicente <angel.de.vicente at iac dot es>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Kaspar Bumke <kaspar dot bumke at gmail dot com>
# Contributor: maleadt <tim dot besard at gmail dot com>
pkgname="turbovnc"
pkgdesc="A derivative of Virtual Network Computing that is tuned to provide peak performance for 3D and video workloads"
pkgver=3.2
pkgrel=1
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://www.turbovnc.org/"
license=('GPL-2.0-or-later')
depends=('bash'
         'glibc'
         'hicolor-icon-theme'
         'java-runtime>11'
         'libglvnd'
         'libjpeg-turbo'
         'libx11'
         'libxau'
         'libxdmcp'
         'libxext'
         'libxfont2'
         'libxi'
         'openssl'
         'pam'
         'perl'
         'pixman'
         'python'
         'zlib')
makedepends=('cmake>=3.12'
             'java-environment>11'
             'libxaw'
             'libxcursor'
             'libxt'
             'xorg-server'
             'xtrans')
conflicts=('tigervnc' 'tigervnc-git' 'tightvnc' 'tightvnc-git')
backup=(etc/turbovnc/turbovncserver.conf
        etc/turbovnc/turbovncserver-security.conf)
source=("https://github.com/TurboVNC/turbovnc/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('a4fd895ebb8a40a5962db8c38e3de61e4d22c77d64d2ea0afe8fd78c7a8aff72'
            'c48fe608bbf82c100e19aebd2f3a09cc423cf1bf7e7775275416979dac1dfab0')
validpgpkeys=(AE1A7BA4EFFF9A9987E1474C4BACCAB36E7FE9A1) # The VirtualGL Project <information@VirtualGL.org>

build() {
	export JAVA_HOME=/usr/lib/jvm/default/
	cmake -B build \
	      -S "$pkgname-$pkgver" \
	      -DCMAKE_BUILD_TYPE='None' \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/$pkgname \
	      -DCMAKE_INSTALL_MANDIR=/usr/share/man/$pkgname \
	      -DCMAKE_INSTALL_SYSCONFDIR=/etc/turbovnc \
	      -Wno-dev \
	      -G "Unix Makefiles" \
	      -DTJPEG_LIBRARY=/usr/lib/libturbojpeg.so
	cmake --build build
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
	rm -f "${pkgdir}/usr/share/man/man1/Xserver.1"
	rm -r "${pkgdir}/etc/turbovnc/init.d"
	printf "[Desktop Entry]\nName=TurboVNC Viewer\nComment=TurboVNC client application\n\
Exec=/usr/bin/vncviewer\nTerminal=false\nIcon=turbovnc\nType=Application\n\
Categories=Application;Utility;\n" >> tvncviewer.desktop
	install -Dm755 tvncviewer.desktop "${pkgdir}/usr/share/applications/tvncviewer.desktop"
}
