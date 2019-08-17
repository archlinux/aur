# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=blobby-volley-svn
pkgver=r1681
pkgrel=2
pkgdesc="Official continuation of the famous Blobby Volley 1.x arcade game"
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/blobby/"
makedepends=('subversion' 'boost' 'cmake' 'zip')
depends=('physfs' 'sdl2')
license=('GPL')
source=("blobby-code::svn+https://svn.code.sf.net/p/blobby/code/trunk"
        "blobby2.desktop"
        "blobby2.png"
        "0001-fix-vector-include.patch")
sha512sums=('SKIP'
            '715b4337dc868cf51ca69c01476e1fa3a3dd631397fca91dc55f4d45e241b35dd0850f4be3e12a0afd7c2a94b6adfa623c633d4ce79ca6098f8e7ee6e69b3917'
            '8b7b85d8e02f8174054a724752d5d40c609820be1e5e06c4868dc0e383d4cf4befe73ab0e910e9838b70be3f7e106ee71ef1e04f0560fdde7bff6ca473fa81ec'
            '6313ed40a37dcb852c617ad12419a55a0d801a9a4c5462c6c1dadf57bdcfca0f93e6df61083378ecbe23f9aae9e909732990d7abf031c3f7c93c7d750d4dbb99')

pkgver() {
  cd blobby-code
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd blobby-code
  # Only patch if patch applies
  if patch -p0 -N -i "$srcdir/0001-fix-vector-include.patch" --dry-run; then
    patch -p0 -N -i "$srcdir/0001-fix-vector-include.patch"
  fi
}

build() {
  cd blobby-code
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd blobby-code
  make DESTDIR="$pkgdir/" install

  # install .desktop file and icon
  install -dm755 "$pkgdir"/usr/share/{applications,pixmaps}
  install -m644 "$srcdir"/blobby2.desktop "$pkgdir"/usr/share/applications
  install -m644 "$srcdir"/blobby2.png "$pkgdir"/usr/share/pixmaps
}

# vim:set ts=2 sw=2 et:
