# Maintainer: JonnyRobbie

pkgbase=xsane-git
pkgname=('xsane-git' 'xsane-gimp-git')
_gitname=xsane
pkgver=0.999.r89.gfee5f42
pkgrel=1
arch=(x86_64)
url="https://gitlab.com/sane-project/frontend/xsane"
license=('GPLv2')
makedepends=('gtk2' 'lcms2' 'sane' 'zlib' 'libjpeg' 'gimp')
source=(git+https://gitlab.com/sane-project/frontend/$_gitname.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  # make with gimp support
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-gimp
  make
  mv src/xsane src/xsane-gimp

  # make without gimp support
  make clean
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --mandir=/usr/share/man \
    --disable-gimp
  make
}

package_xsane-git() {
  pkgdesc="A GTK-based X11 frontend for SANE and plugin for Gimp. Git version."
  depends=('gtk2' 'lcms2' 'sane' 'zlib' 'libjpeg')
  optdepends=('xsane-gimp: for gimp plugin support')
  conflicts=('xsane')
  provides=('xsane')

  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
}

package_xsane-gimp-git() {
  pkgdesc="XSane Gimp plugin. Git version."
  depends=('xsane' 'gimp')
  conflicts=('xsane-gimp')
  provides=('xsane-gimp')

  cd "$srcdir/$_gitname"
  install -D -m755 src/xsane-gimp "$pkgdir/usr/bin/xsane-gimp"

  ## Link the plugin binary to gimp plug-in directory
  mkdir -p "$pkgdir/usr/lib/gimp/2.0/plug-ins"
  ln -sf /usr/bin/xsane-gimp "$pkgdir"/usr/lib/gimp/2.0/plug-ins/xsane
}

