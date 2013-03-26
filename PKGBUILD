# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmmail
_appname=WMMail
_realname=${_appname}.app
pkgver=0.64
pkgrel=1
pkgdesc="A WindowMaker dock applet for email reporting."
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/93"
license=('GPL')
options=('!emptydirs')
depends=('libx11' 'libxext' 'libxcb' 'libxau' 'windowmaker')
source=("${_realname}-${pkgver}.tar.gz" "${pkgname}.patch" "system.${_appname}" "${_appname}.1")
md5sums=('fc596db9f2f6b52eec3a303178106c8e'
         '740f3d7e1851cd6b5897ed58f36cbd20'
         '3e4e2e065c6e419a522949cb0afc22d0'
         'ccaf16328da78a003274f230c3640cdb')

build() {
  appspath=usr/lib/GNUstep/Apps

  cd "${srcdir}/${_realname}-${pkgver}"
  patch -p1 <"${srcdir}/${pkgname}.patch"
  cp /usr/share/automake-1.13/config.sub .
  cp /usr/share/automake-1.13/config.guess .
  ./configure --with-x --with-appspath=/${appspath} --x-includes=/usr/include --x-libraries=/usr/lib
  make
}
package() {
  appspath=usr/lib/GNUstep/Apps
  dfltsdir=etc/GNUstep/Defaults

  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm0755 "${pkgdir}/${appspath}/${_realname}/${_appname}" \
     "${pkgdir}/usr/bin/${_appname}"
  ln -s ${_appname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 -p "${srcdir}/system.${_appname}" \
     "${pkgdir}/${dfltsdir}/${_appname}"
  install -Dm0644 "${srcdir}/${_appname}.1" \
     "${pkgdir}/usr/share/man/man1/${_appname}.1"
}
