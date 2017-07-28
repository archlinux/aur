# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xdm-xlogin
_pkgname=xorg-xdm
pkgver=1.1.11
pkgrel=9
pkgdesc="X Display Manager"
arch=(i686 x86_64)
#url="http://xorg.freedesktop.org/"
url="https://github.com/bbidulock/xdm"
license=('custom')
depends=('libbsd' 'pam' 'libxaw' 'libxinerama' 'xorg-xrdb' 'xorg-sessreg' 'libxft' 'systemd')
optdepends=('slim-xdm: for separate greeter')
provides=("${_pkgname}=${pkgver}")
conflicts=(${_pkgname})
makedepends=('pkgconfig' 'xorg-util-macros' 'xtrans')
backup=(etc/X11/xdm/Xaccess etc/X11/xdm/Xresources etc/X11/xdm/Xservers etc/X11/xdm/xdm-config etc/pam.d/xdm etc/pam.d/greeter etc/X11/xdm/Xsetup_0 etc/X11/xdm/Xsession)
source=("xdm.zip::https://github.com/bbidulock/xdm/archive/2806205d33afa981ed2228355699eb2c0d3150d0.zip"
	xdm.pam)
sha256sums=('bc83891ad601e275c50ea310b6673ef510d8decd08352bcf73e87313c9b7e6c5'
            'e8c4c5fd3b801a390d201166fd1fb9730e78a5c62928768103b870b6bd980ea0')

build() {
  cd xdm-*
  ./autogen.sh --prefix=/usr \
      --sysconfdir=/etc \
      --disable-xdm-auth \
      --disable-static \
      --with-xdmconfigdir=/etc/X11/xdm \
      --with-xdmscriptdir=/etc/X11/xdm \
      --with-pixmapdir=/usr/share/xdm/pixmaps
  make CWARNFLAGS=""
}

package() {
  cd xdm-*
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
