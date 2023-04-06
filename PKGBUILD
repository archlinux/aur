# Maintainer: Jakob Kreuze <jakob@memeware.net>
# Contributor: Bader <Bad3r@unsigned.sh>
pkgname=pince-git
pkgver=r1222.9db33c3
pkgrel=1
pkgdesc="A Linux reverse engineering tool inspired by Cheat Engine."
arch=('any')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL3')
depends=('python' 'python-pexpect' 'python-psutil' 'python-pyqt6' 'python-distorm' 'python-pygdbmi' 'python-gobject' 'python-keyboard' 'gdb' 'sudo')
makedepends=('git' 'intltool')
source=("$pkgname::git+https://github.com/korcankaraokcu/PINCE.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  # Compile and copy libscanmem dependencies.
  git submodule update --init --recursive
  mkdir -p libpince/libscanmem

  cd scanmem
  sh autogen.sh
  ./configure --prefix="$pkgdir/usr"
  make libscanmem.la
  cp --preserve .libs/libscanmem.so ../libpince/libscanmem/libscanmem.so
  cp --preserve gui/scanmem.py ../libpince/libscanmem
  cp --preserve gui/misc.py ../libpince/libscanmem
  cd ..

  sed -i 's/import misc/from \. import misc/g' libpince/libscanmem/scanmem.py
  sed -i 's/\.\/gdb_pince\/gdb.*\/bin\/gdb/\/usr\/bin\/gdb/g' libpince/type_defs.py
  sed -i 's/\ssudo/cd \/usr\/share\/PINCE \&\& sudo/' PINCE.sh
  sed -i 's/\sgksudo/cd \/usr\/share\/PINCE \&\& gksudo/' PINCE.sh
  sed -i 's/OS=.*/OS="Arch"/' PINCE.sh

  install -d "$pkgdir/usr/bin"
  install PINCE.sh "$pkgdir/usr/bin/pince"
  install -d "$pkgdir/usr/share/PINCE"
  install PINCE.py COPYING AUTHORS THANKS "$pkgdir/usr/share/PINCE"
  cp -r GUI libpince media "$pkgdir/usr/share/PINCE"
}
