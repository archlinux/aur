# Maintainer:  Levinit <levinit at outlook dot com> 
# Contributor: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Angel de Vicente <angel.de.vicente at iac dot es>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Kaspar Bumke <kaspar dot bumke at gmail dot com>
# Contributor: maleadt <tim dot besard at gmail dot com>
pkgname="turbovnc"
pkgdesc="A derivative of Virtual Network Computing that is tuned to provide peak performance for 3D and video workloads"
pkgver=3.3
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://www.turbovnc.org/"
license=('GPL-2.0-or-later')
depends=('bash'
         'glibc'
         'hicolor-icon-theme'
         'java-runtime>=16'
         'libglvnd'
         'libjpeg-turbo'
         'libx11'
         'libxau'
         'libxdmcp'
         'libxext'
         'libxfont2'
         'libxi'
         'libxshmfence'
         'mesa'
         'openssl'
         'pam'
         'perl'
         'pixman'
         'python'
         'xkeyboard-config'
         'xorg-xauth'
         'xorg-xkbcomp'
      #   'zlib'
       )
makedepends=('cmake>=3.16'
             'java-environment>=16'
             'libxaw'
             'libxcursor'
             'libxt'
             'xorg-server'
             'xtrans')
conflicts=('tigervnc' 'tigervnc-git' 'tightvnc' 'tightvnc-git')
backup=(etc/turbovnc/turbovncserver.conf
        etc/turbovnc/turbovncserver-security.conf)
source=("https://github.com/TurboVNC/turbovnc/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('579d71e95beb7790badc1e40b36b52ccec71f255493e89e21721dfd86bbf2a5a'
            'SKIP')
validpgpkeys=('AE1A7BA4EFFF9A9987E1474C4BACCAB36E7FE9A1') # The VirtualGL Project <information@VirtualGL.org>

build() {
	export JAVA_HOME=/usr/lib/jvm/default/
	cmake -B build \
	      -S "$pkgname-$pkgver" \
	      -DCMAKE_BUILD_TYPE='None' \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/$pkgname \
	      -DCMAKE_INSTALL_MANDIR=/usr/share/man \
	      -DCMAKE_INSTALL_SYSCONFDIR=/etc/turbovnc \
	      -Wno-dev \
	      -G "Unix Makefiles" \
	      -DTJPEG_LIBRARY=/usr/lib/libturbojpeg.so
	cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  rm -f "${pkgdir}/usr/share/man/man1/Xserver.1"
  rm -rf "${pkgdir}/etc/turbovnc/init.d"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/tvncviewer.desktop" <<'EOF'
[Desktop Entry]
Name=TurboVNC Viewer
Comment=TurboVNC client application
Exec=/usr/bin/vncviewer
Terminal=false
Icon=turbovnc
Type=Application
Categories=Utility;RemoteAccess;
EOF
}

