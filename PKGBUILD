# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-xdm-git
pkgver=1.1.11.43.g994d32a
pkgrel=1
pkgdesc="X Display Manager"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libbsd' 'pam' 'libxaw' 'libxinerama' 'xorg-xrdb' 'xorg-sessreg' 'libxft' 'systemd')
provides=('xorg-xdm')
conflicts=('xorg-xdm' 'xorg-xdm-xlogin' 'xorg-xdm-xlogin-git')
makedepends=('git' 'pkgconfig' 'xorg-util-macros' 'xtrans')
backup=(etc/X11/xdm/Xaccess etc/X11/xdm/Xresources etc/X11/xdm/Xservers etc/X11/xdm/xdm-config etc/pam.d/xdm etc/X11/xdm/Xsetup_0 etc/X11/xdm/Xsession)
options=('!libtool')
source=("$pkgname::git://anongit.freedesktop.org/git/xorg/app/xdm"
	fixes.patch
        xdm.pam)
sha256sums=('SKIP'
            '0aba5f8e58dead488544962376531e1067e7a55a441f62c601645cd31762caf9'
            '7d6818a1c1a44e9bd38774c035e03b0b831f6646681bc2bf556761aec7baf418')

pkgver() {
  cd $pkgname
  git describe | sed 's,xdm-,,;s,-,.,g'
}

prepare() {
  cd $pkgname
  patch -Np2 -b -z .orig -i ../fixes.patch
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr \
      --disable-xdm-auth \
      --disable-static \
      --with-xdmconfigdir=/etc/X11/xdm \
      --with-xdmscriptdir=/etc/X11/xdm \
      --with-pixmapdir=/usr/share/xdm/pixmaps
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/var/lib/xdm"
  install -m755 -d "${pkgdir}/etc/pam.d"
  install -m644 "${srcdir}/xdm.pam" "${pkgdir}/etc/pam.d/xdm"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

  sed -i -e 's/\/X11R6//g' "${pkgdir}"/etc/X11/xdm/*

  sed -i 's|^Alias=.*|Alias=display-manager.service|' \
    "$pkgdir/usr/lib/systemd/system/xdm.service"
}
