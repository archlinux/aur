# Maintainer: quequotion <quequotion@bugmenot.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=(liboverlay-scrollbar-gtk2-bzr)
#pkgbase=overlay-scrollbar-bzr
pkgver=r395
pkgrel=1
pkgdesc="Ayatana Scrollbars, pointer-triggered overlay scrollbars to save screen real-estate."
arch=('i686' 'x86_64')
url="https://launchpad.net/ayatana-scrollbar"
license=('LGPL')
groups=('unity')
makedepends=('gtk2-ubuntu')
options=('!emptydirs')
extrafiles=('overlay-scrollbar.install')
source=('bzr+lp:overlay-scrollbar')
sha512sums=('SKIP')


pkgver() {
  cd overlay-scrollbar

  printf "r%s" "$(bzr revno)"
}

build() {
  cd "${srcdir}/overlay-scrollbar"

  autoreconf -vfi

  [[ -d ../build-gtk2 ]] || mkdir ../build-gtk2
  pushd ../build-gtk2
  ../overlay-scrollbar/configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
  popd

}

package() {
  pkgdesc+=" gtk2"
  provides=(liboverlay-scrollbar{,-gtk2}{,-bzr}="${pkgver}")
  conflicts=('liboverlay-scrollbar')

  cd "${srcdir}/build-gtk2/"
  make DESTDIR="${pkgdir}/" install

  rm -rvf "${pkgdir}/etc/"
  rm -rvf "${pkgdir}/usr/share/glib-2.0/"
}

