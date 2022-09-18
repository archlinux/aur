# Contributor: Black_Codec / <orso.f.regna@gmail.com>
# Original Contributor: Erufu / Sébastien Lacroix <erufu.sennin@gmail.com>

pkgname=wmfs2-git
pkgver=r459.b7b8ff8
pkgrel=1
pkgdesc="A lightweight and highly configurable tiling window manager for X"
arch=('i686' 'x86_64')
url="https://github.com/xorg62/wmfs"
license=('BSD')
depends=('libxft' 'imlib2' 'libxinerama' 'libxrandr')
makedepends=('git')
provides=('wmfs2')
conflicts=('wmfs' 'wmfs-git')
source=("git+https://github.com/xorg62/wmfs.git"
	'gcc-10.patch')
md5sums=('SKIP'
	'4031b1efc5437fa641c279d7b67f6776')
_pkgname="wmfs"

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${_pkgname}"
  patch -Np1 < ../gcc-10.patch
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
