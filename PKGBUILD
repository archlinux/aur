# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=magic
pkgver=8.3.692
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
   'zlib'
   'bash'
   'libx11'
)
makedepends=(
   'git'
   'gcc'
   'make'
   'tcsh'
   'python'
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
   "0001-pass-LDFLAGS.patch"
)

b2sums=('7ffef04bf7a2de2e1218929c901e028c3ca230977089d8d8eeb797113349e3caddb17639ca814692e4fffcc99ebf73cf1c77c3b4c8feb1f776e6c88d79bc68cc'
        '702bca8c771c100b050379970a40f141edfd93a16e9f321aa50c2815de5b9c3204f2141af071ed90696d8b317691893027950aa74661927643d02cbb7615ef88')

options=()

prepare() {
   cd "${pkgname}"

   # Patch to pass makepkg.conf LDFLAGS
   patch -Np1 < ../"0001-pass-LDFLAGS.patch"
}

build() {
   # See upstream issue: https://github.com/RTimothyEdwards/magic/issues/401
   # for more details about why we need to use C17
   # export CFLAGS="${CFLAGS} -std=c17 -D_DEFAULT_SOURCE=1"
   # Make build directory and run configure
   export CFLAGS="${CFLAGS} -std=c17 -D_DEFAULT_SOURCE=1"
   (
      mkdir -p build
      cd build
      ../"${pkgname}"/configure --prefix=/usr
   )
   # build
   make -C build
}

package() {
   make -C build DESTDIR="$pkgdir" MANDIR=/usr/share/man install

   # License
   install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" ${pkgname}/LICENSE
   # Avoid name collision
   mv "$pkgdir/usr/share/man/man1/extcheck.1" "$pkgdir/usr/share/man/man1/extcheck-magic.1"
}

