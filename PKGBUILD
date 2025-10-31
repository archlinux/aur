# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=magic
pkgver=8.3.571
pkgrel=1
pkgdesc="A VLSI layout system"
_git_url="https://github.com/RTimothyEdwards/magic"
url="http://opencircuitdesign.com/magic/"
arch=('i686' 'x86_64')
license=('LicenseRef-Custom')
depends=(
   'glibc'
   'tcl'
   'tk'
   'libx11'
   'zlib'
   'python'
   'bash'
)
makedepends=(
   'git'
   'gcc'
   'make'
   'tcsh'
   #'ghostscript'
)
optdepends=(
   'libgl: OpenGL for performant 2D graphics, needs "glu" as well'
   'glu: Vector fonts for OpenGL renderer'
   'cairo: 2D accelerated graphics, alternative to OGL'
   'blt: to create a tree diagram of the cell hierarchy in a design'
)

source=(
   "${pkgname}::git+${_git_url}#tag=${pkgver}"
   "0001-fixup-magsgtty.patch"
)

b2sums=('0f05b0eb0bedab1c14d5bfbd4c8ebc4042bce822eef6c09d37a1457c9126b3b80105b7518fe8a5c4c17e4a08180111d2c4978b2bf520f5d4f045e4520147a1d7'
        '72d1a9742c72041204c05aca45639251ab49768c43b1829bc40e6f0857fd93c0a7e32e433a0090996e17af1fc588e26677c24487bf04d5a14a86c8f5e4a2402c')


options=()

prepare() {
   cd "${pkgname}"

   # To compile with Glibc v2.42 we need to patch magsgtty
   # See: https://github.com/RTimothyEdwards/magic/issues/434
   patch -Np1 < "../0001-fixup-magsgtty.patch"
}

build() {
   cd "${pkgname}"
   # See upstream issue: https://github.com/RTimothyEdwards/magic/issues/401
   # for more details about why we need to use C17
   export CFLAGS="${CFLAGS} -std=c17 -D_DEFAULT_SOURCE=1"
   ./configure --prefix=/usr
   make
}

package() {
   cd "${pkgname}"
   make DESTDIR="$pkgdir" MANDIR=/usr/share/man install

   # License
   install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
   # Avoid name collision
   mv "$pkgdir/usr/share/man/man1/extcheck.1" "$pkgdir/usr/share/man/man1/extcheck-magic.1"
}

