# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-xdm-git
_pkgname=xorg-xdm
pkgver=1.1.12.r6.gd0fa514
pkgrel=1
pkgdesc="X Display Manager"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libbsd' 'pam' 'libxaw' 'libxinerama' 'xorg-xrdb' 'xorg-sessreg' 'libxft' 'systemd')
makedepends=('git' 'pkgconfig' 'xorg-util-macros' 'xtrans')
backup=(etc/X11/xdm/Xaccess etc/X11/xdm/Xresources etc/X11/xdm/Xservers etc/X11/xdm/xdm-config etc/pam.d/xdm etc/X11/xdm/Xsetup_0 etc/X11/xdm/Xsession)
options=('!libtool')
source=("$pkgname::git://anongit.freedesktop.org/git/xorg/app/xdm"
	fixes.patch
        xdm.pam)
sha512sums=('SKIP'
            '568d9b17caf410e4e5c3033ec4a751a75b6015bf9d20af29414aac14f0b8dffb90f2b20d83999026af5e024379c32508c2f0bdd7b685e536b8511444ab2a11cd'
            'cb912013a294f0801b357a43f3e5313ffa9ac5fcc493b2318843983388eb0b839c84060a97c355e12ca03f3b056644aa4a2bb8a74ed73a0f2405816b8d6efdc0')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  patch -Np2 -b -z .orig -i ../fixes.patch
  autoreconf -vfi
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr \
      --sysconfdir=/etc \
      --disable-xdm-auth \
      --disable-static \
      --with-xdmconfigdir=/etc/X11/xdm \
      --with-xdmscriptdir=/etc/X11/xdm \
      --with-pixmapdir=/usr/share/xdm/pixmaps \
      DEF_USER_PATH="/usr/local/bin:/usr/bin:/bin" \
      DEF_SYSTEM_PATH="/usr/local/bin:/usr/bin:/bin"

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make CWARNFLAGS=""
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
