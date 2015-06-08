# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=oogl-git
pkgver=r140.150aebf
pkgrel=1
pkgdesc="Object-oriented C++ wrapper for OpenGL"
arch=('any')
url="https://github.com/Overv/OOGL"
license=('MIT')
makedepends=('make')
source=("$pkgname::git+$url"
        'OOGL.pc')
sha256sums=('SKIP'
        'd4cfaee3cf9d2af0edd1b12baced60d8b765a0d1e81e8f045e3fb6366bc8ed8a')
options=('staticlibs')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"

  # Add version number to pkg-config file
  cp ../OOGL.pc .
  sed s/@OOGL_VERSION@/$pkgver/ -i OOGL.pc

# Temporary fix, until upstream patches it
  # include/GL/GL/Extensions.hpp:411:0: error: "GL_DRAW_FRAMEBUFFER_BINDING" redefined [-Werror]
  # /usr/include/GL/glext.h:1010:0: note: this is the location of the previous definition
  sed 's/#define GL_DRAW_FRAMEBUFFER_BINDING/#undef  GL_DRAW_FRAMEBUFFER_BINDING\n#define GL_DRAW_FRAMEBUFFER_BINDING/' -i include/GL/GL/Extensions.hpp \
    || true # allow this patch to fail
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"

  # Copy sources directly to /usr/include/
  # Note: if there ever is a file conflict, we'll need to put it somewhere else
  #       and add it to `OOGL.pc`
	mkdir -p "$pkgdir/usr/include/GL/"
	cp -r include/GL/* "$pkgdir/usr/include/GL/"

  # Arguably the most important file here: the archive
	install -Dm755 lib/OOGL.a "$pkgdir/usr/lib/OOGL.a"

  # pkg-config's... config
	install -Dm755 OOGL.pc "$pkgdir/usr/lib/pkgconfig/OOGL.pc"

  # License
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
