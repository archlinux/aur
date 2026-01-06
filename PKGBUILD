# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=magic
pkgver=8.3.589
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

b2sums=('0c87cc9b32179427e248cace5a578af94aa53e501a0f4c9fe191bbc656b388c01ad00b413d90c4b425b8f4e11ed6c41fc27238501c8c58e43b3a44d10b57b5b5'
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

