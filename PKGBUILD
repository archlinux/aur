# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Jesse Harjunpää <harjuje1@gmail.com>
# Contributor: Jens Adam <jra@byte.cx>

pkgname=bastet
pkgver=0.43.2
pkgrel=6
pkgdesc="Tetris(r) clone with 'bastard' block-choosing AI"
url="http://fph.altervista.org/prog/bastet.html"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('boost-libs' 'ncurses')
makedepends=('git' 'boost')
backup=('var/games/bastet.scores2')
_commit='5037e410fde6fafe8e6bc4cf17a12ad98e01c17e'
source=(
  "$pkgname::git+https://github.com/fph/bastet.git#commit=$_commit"
  'fix_build_new_boost.patch'
  'fix_format_security.patch::https://github.com/fph/bastet/pull/21.patch'
  'tmpfiles.conf'
)
install=$pkgname.install
sha512sums=('SKIP'
            'c6b65f3fd44eef43126b051990c2e0075f970c451f1d944d8a48f6f530bf792e875ac485dd3048d72433b636adc85bcb36f798d9b001021a2c3a4e39894f972e'
            'cbbcb59a56027d314fd8c4b74bf9b4c79b6f12d66ff10c5ed37d37d136e21b6c98486749c09f1b05f3894e69194b966d83923f45a64b415c1c3c9453800d5d7b'
            '8aa5d06313a5bc072449cf5b04298d98086403649aa84e335fa33775c71afc798f0f5ca2fa6b2c4644273b4750022584b8944b86d86c8c2fa820df6d666c4b38')
b2sums=('SKIP'
        'c127757675f133ec4131c159d41e08c5db166968e23b1462576a43002ee3e1c819d656e1be8ad2ad487472daf010bf7fbc722df578af24145c9c734ba9d671ac'
        '7fc3e27b5aa8b633e5e5ce2849421a3c8d4bdee61d749c758817cc252e4f9967ab1b6030b7ad411ad3f685cf55b5d18a6f9a77e7a63d3f5d02e58d0c9633c0d1'
        'f7376e71ea3daf6110a6148887879bbcb3a4a8087b7b3dfd42a249a9e13a9002004ff0a6a6447fbfe2f8b6c3d5941e4c4eb47bb381915a295b77803a8a91ff4f')

pkgver() {
  cd "$pkgname"

  git describe --tags
}

prepare() {
  cd "$pkgname"

  patch -p1 -i ../fix_build_new_boost.patch
  patch -p1 -i ../fix_format_security.patch
}

build() {
  cd "$pkgname"

  make
}

package() {
  # let systemd-tmpfiles generate global highscore file
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" bastet

  # man
  install -vDm644 -t "$pkgdir/usr/share/man/man6" bastet.6

  # desktop files
  install -vDm644 -t "$pkgdir/usr/share/pixmaps" bastet.png
  install -vDm644 -t "$pkgdir/usr/share/applications" bastet.desktop
  install -vDm644 -t "$pkgdir/usr/share/appdata" bastet.appdata.xml

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" AUTHORS INSTALL NEWS README
}
