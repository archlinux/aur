# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-xdm-xlogin-git
pkgver=1.1.11.26.g95e6f0e
pkgrel=1
pkgdesc="X Display Manager"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libbsd' 'pam' 'libxaw' 'libxinerama' 'xorg-xrdb' 'xorg-sessreg' 'libxft' 'systemd')
provides=('xorg-xdm' 'xorg-xdm-xlogin')
conflicts=('xorg-xdm' 'xorg-xdm-xlogin' 'xorg-xdm-git')
makedepends=('git' 'pkgconfig' 'xorg-util-macros' 'xtrans')
backup=(etc/X11/xdm/Xaccess etc/X11/xdm/Xresources etc/X11/xdm/Xservers etc/X11/xdm/xdm-config etc/pam.d/xdm etc/X11/xdm/Xsetup_0 etc/X11/xdm/Xsession)
options=('!libtool')
source=("$pkgname::git://anongit.freedesktop.org/git/xorg/app/xdm"
	xlogin.patch
        Xsession-loginshell.patch
        Xsession-xsm.patch
        xdm-1.0.5-sessreg-utmp-fix-bug177890.patch
	build-fixes.patch
        xdm.pam)
sha256sums=('SKIP'
            '4bb8742f9bef48df06430112fa7665dd78a5d5d6a5f835dd21b0ea0fc8c04801'
            'fd3e7c20837b42a8ab111369fd6dc9612f9edb91c1f6904cca1d6a1fa3cfa0ff'
            '77a1ce9bdf363591b72798db08b4df3589bd4e64737fd32cf9028f9245450edb'
            '5f380a2d6f77feb910d77f7f6843fce9b00ff7610c159fc029ee44cc6c23a48a'
            '5da6ed875db3cc07dc1d87d96c92a62f638e1735b22bb365be4b15409af871f7'
            '7d6818a1c1a44e9bd38774c035e03b0b831f6646681bc2bf556761aec7baf418')

pkgver() {
  cd $pkgname
  git describe | sed 's,xdm-,,;s,-,.,g'
}

prepare() {
  cd $pkgname
  patch -Np1 -i "${srcdir}/xlogin.patch"
  patch -Np0 -i "${srcdir}/Xsession-loginshell.patch"
  patch -Np1 -i "${srcdir}/Xsession-xsm.patch"
  patch -Np0 -i "${srcdir}/xdm-1.0.5-sessreg-utmp-fix-bug177890.patch"
  patch -Np2 -i "${srcdir}/build-fixes.patch"
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
