# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=magic
pkgver=8.3.548
pkgrel=2
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

_archive="${pkgname}-${pkgver}"
source=(
   "${_archive}::git+${_git_url}#tag=${pkgver}"
   "0001-fixup-magsgtty.patch"
   "0002-fix-save-file-tcl.patch"
)

b2sums=('538cdc7bce5a5464174adea5b7c5f7008ee8221852d0d824e309976fdc3f24dcd89caf5a26d1fafb04aadf0a9e84e3d7387203b29e82a27020cbec383200903f'
        '72d1a9742c72041204c05aca45639251ab49768c43b1829bc40e6f0857fd93c0a7e32e433a0090996e17af1fc588e26677c24487bf04d5a14a86c8f5e4a2402c'
        '533edbe10b94874c7fa66d1de54d26d9a52708072ab5da497d5eb99fd5d00a50bd831eec0ddbd3ce50aa8bca600a644584cca5b338ac6abae1718f5e519c2f98')


options=()

prepare() {
   cd "${_archive}"

   # To compile with Glibc v2.42 we need to patch magsgtty
   # See: https://github.com/RTimothyEdwards/magic/issues/434
   patch -Np1 < "../0001-fixup-magsgtty.patch"

   # Fix segfault
   # See: https://github.com/RTimothyEdwards/magic/issues/446
   patch -Np1 < "../0002-fix-save-file-tcl.patch"

}

build() {
   cd "${_archive}"
   # See upstream issue: https://github.com/RTimothyEdwards/magic/issues/401
   # for more details about why we need to use C17
   export CFLAGS="${CFLAGS} -std=c17 -D_DEFAULT_SOURCE=1"
   ./configure --prefix=/usr
   make
}

package() {
   cd "${_archive}"
   make DESTDIR="$pkgdir" MANDIR=/usr/share/man install

   # License
   install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
   # Avoid name collision
   mv "$pkgdir/usr/share/man/man1/extcheck.1" "$pkgdir/usr/share/man/man1/extcheck-magic.1"
}

