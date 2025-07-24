# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=magic
pkgver=8.3.530
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
   "0001-set_std_gnu17_default.patch"
   "0002-makefile-ensure-objs-folder.patch"
)

b2sums=('624acd576fbe8928e5a58ca1198d2e939a5f4d572d42c6c8d3ba69aaf1f85c251693dbf56f3f8078d03e37c89b783cef5f5262eb29ed08e3b84a950e339952ba'
        '37eaa5bbaab691216ffc06485e6d5d934c74f63e74a876da5bedb0f9fd98f404abfbaa902b9fa979e276e38ba660b4049fbe3d6ff43b591e1d1d3fb2d128eb51'
        'd4f1518e6366c65201df29c50d03862744a8218d192ca510cca8954385f25e51d87a985bfa468347104db2ec767ba84bd58aaa25def2d230ea757e3b36ca600a')


options=(!ccache !lto)

prepare() {
   cd "${_archive}"

   # See upstream issue: https://github.com/RTimothyEdwards/magic/issues/401
   # for more details about why we need to use C17 + GNU extensions
   patch -Np1 < "../0001-set_std_gnu17_default.patch"

   # SCMOS techfiles doesn't get copied due to racyness of the makefile
   # TODO: report upstream
   patch -Np1 < "../0002-makefile-ensure-objs-folder.patch"

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

