# Contributor: Black_Codec / <orso.f.regna@gmail.com>
# Original Contributor: Erufu / Sébastien Lacroix <erufu.sennin@gmail.com>

pkgname=wmfs2-git
pkgver=r442.3c701a9
pkgrel=1
pkgdesc="A lightweight and highly configurable tiling window manager for X"
arch=('i686' 'x86_64')
url="http://www.wmfs.info/"
license=('BSD')
depends=('libxft' 'imlib2' 'libxinerama' 'libxrandr')
makedepends=('git')
provides=('wmfs2')
conflicts=('wmfs' 'wmfs-git')
source="git+https://github.com/xorg62/wmfs.git"
md5sums=('SKIP')
_pkgname="wmfs"

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  export CFLAGS=""
  ./configure --prefix /usr \
              --xdg-config-dir /etc/xdg \
              --man-prefix /usr/share/man
  make clean
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  msg "WARNING ! Please copy the default config file '/etc/xdg/wmfs/wmfsrc' in '~/.config/wmfs/', or wmfs2 won't start !"
}
