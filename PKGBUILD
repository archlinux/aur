# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# Upstream: https://github.com/phillipberndt/fakexrandr
pkgname=fakexrandr-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Fake XRandR configurations for multi-head setups with crappy video drivers, like fakexinerama but with xrandr"
arch=(any)
url="https://github.com/phillipberndt/fakexrandr"
license=('GPL')
depends=('xorg-xrandr')
makedepends=('git' 'glibc' 'sed' 'python2')
source=("$pkgname"::'git://github.com/phillipberndt/fakexrandr.git')
sha1sums=('SKIP')

_pkgname=fakexrandr
_lib_dir=/usr/lib/$_pkgname

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  # Fix python interpreter (python -> python2)
  sed -i '1s/python/python2/g' make_skeleton.py
  # Add custom fakexrandr lib path (bypass detection)
  sed -i "s|^\(FAKE_LIBRARY_DIRECTORY=\)$|\1${_lib_dir}|" configure
  # FIXME THIS AINT WORKING
  # Fix missing target
  sed -i "s|\(install\) \(.*\) \(.*\);|\1 \2 \3/\2;|" Makefile
  # Fix missing DEST_DIR in Makefile
  sed -i "s|\(TARGET_DIR=\).*|\1${pkgdir}${_lib_dir}; \\\|" Makefile
  # Don't even try to run ldconfig now
  sed -i "s/\(ldconfig\)/#\1/" Makefile
  # Create ld.so.conf.d config file
  echo "$_lib_dir" > "${_pkgname}.conf"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  echo cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/$_lib_dir"
  make install
  install -D -m 644 "${_pkgname}.conf" "$pkgdir/etc/ld.so.conf.d/${_pkgname}.conf"
}

# vim: set et ts=2 sw=2 :
