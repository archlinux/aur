# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Angel de Vicente <angel.de.vicente at iac dot es>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Kaspar Bumke <kaspar dot bumke at gmail dot com>
# Contributor: maleadt <tim dot besard at gmail dot com>
pkgname="turbovnc"
pkgdesc="A derivative of Virtual Network Computing that is tuned to provide peak performance for 3D and video workloads"
pkgver=3.1.1
pkgrel=2
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://www.turbovnc.org/"
license=('GPL-2.0-or-later')
depends=('hicolor-icon-theme'
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
source=("https://github.com/TurboVNC/turbovnc/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.sig}
        'vncserver.service')
sha256sums=('3530a4ab7dfe36be7aa1bd9da6e9cf048be9f585b1940949d3c286ce53ec2b30'
            '8849ad625dfa64c1e175f0f4556b68179164e4c5a487de4ce4c53196059e19ff'
            'ccadf1fc708fad601e6113464d6c533a629f6dc9116f6071347cd0b465c1f48b')
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
	      -DTJPEG_LIBRARY=/usr/lib/libturbojpeg.so \
	      -DTVNC_SYSTEMLIBS=1 \
	      -DTVNC_SYSTEMX11=1
	cmake --build build
}

package() {
	install -D -m644 vncserver.service "${pkgdir}"/usr/lib/systemd/system/vncserver.service
	cd build
	make DESTDIR="${pkgdir}" install
	rm -f "${pkgdir}"/usr/share/man/man1/Xserver.1
	rm -r "${pkgdir}"/etc/turbovnc/init.d
}
