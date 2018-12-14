# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmmail
_appname=WMMail
_realname=${_appname}.app
pkgver=0.64
pkgrel=10
pkgdesc="A WindowMaker dock applet for email reporting."
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/93"
url="http://web.archive.org/web/20121102092600/http://dockapps.windowmaker.org/file.php/id/70"
license=('GPL')
options=('!emptydirs')
depends=('windowmaker')
source=("http://www.gnu-darwin.org/distfiles/${_realname}-${pkgver}.tar.gz"
	"https://gist.github.com/bbidulock/24159efea1ae3f75ba7c/raw/20fa6953be62d1ebdcde794364863fdea218b3af/wmmail.patch"
	"system.${_appname}"
	"${_appname}.1")
md5sums=('fc596db9f2f6b52eec3a303178106c8e'
         '687c39c6f26ee60b1e04de44bc2765d7'
         '3e4e2e065c6e419a522949cb0afc22d0'
         'ccaf16328da78a003274f230c3640cdb')

prepare() {
  cd ${_realname}-${pkgver}
  patch -Np2 -b -z .orig -i "${srcdir}/${pkgname}.patch"
  cp /usr/share/automake-1.16/config.sub .
  cp /usr/share/automake-1.16/config.guess .
  autoreconf -fiv
}

build() {
  appspath=usr/lib/GNUstep/Apps

  cd ${_realname}-${pkgver}
  ./configure --with-appspath=/${appspath} --x-includes=/usr/include/X11 --x-libraries=/usr/lib/X11
  make
}

package() {
  appspath=usr/lib/GNUstep/Apps
  dfltsdir=etc/GNUstep/Defaults

  cd ${_realname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm0755 "${pkgdir}/${appspath}/${_realname}/${_appname}" \
     "${pkgdir}/usr/bin/${_appname}"
  ln -s ${_appname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 -p "${srcdir}/system.${_appname}" \
     "${pkgdir}/${dfltsdir}/${_appname}"
  install -Dm0644 "${srcdir}/${_appname}.1" \
     "${pkgdir}/usr/share/man/man1/${_appname}.1"
}
