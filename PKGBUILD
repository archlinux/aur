# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=magic
pkgver=8.3.527
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

_archive="${pkgname}-${pkgver}"
source=(
   "${_archive}::git+${_git_url}#tag=${pkgver}"
   "0001-set_std_gnu17_default.patch"
)

b2sums=('4c21ad8428f05e8d66f4d03d8abe4c059e31a00f72807fe95fcc4b361ee237193b499d5fa4dc41d5991bb6d27b8818e2e71b9ab2a774d17fb47eb21a0564c6ed'
        '37eaa5bbaab691216ffc06485e6d5d934c74f63e74a876da5bedb0f9fd98f404abfbaa902b9fa979e276e38ba660b4049fbe3d6ff43b591e1d1d3fb2d128eb51')


options=(!ccache)

prepare() {
   cd "${_archive}"

   # See upstream issue: https://github.com/RTimothyEdwards/magic/issues/401
   # for more details about why we need to use C17 + GNU extensions
   patch -Np1 < "../0001-set_std_gnu17_default.patch"
}

build() {
   cd "${_archive}"
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

