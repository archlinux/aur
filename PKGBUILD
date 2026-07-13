# Maintainer: Ruiqi "Richard" Niu <rniu5@jh.edu>
# Contributor: GLM-5.2 <https://docs.z.ai/guides/llm/glm-5.2>
pkgname=irsim-git
pkgver=9.7.121.r131.g037a1b9
pkgrel=1
pkgdesc='IRSIM switch-level simulator for digital circuits'
arch=(x86_64 aarch64)
url='http://opencircuitdesign.com/irsim/'
# License: the project is declared GPL v2 (see COPYRIGHT / GitHub metadata). The
# core base/ sources are under a permissive Stanford license and tclsubckt/
# diglib.c is marked "GPL license"
license=(GPL-2.0-only)
depends=(tcl tk libx11)
makedepends=(git)
provides=(irsim)
conflicts=(irsim)
source=("git+https://github.com/RTimothyEdwards/irsim.git")
sha256sums=('SKIP')
options=(!emptydirs !debug)

# strip the "-git" suffix from package name
_srcdir="${pkgname%-git}"

pkgver() {
  cd "$srcdir/$_srcdir"

  printf '%s.r%s.g%s' \
    "$(cat VERSION)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_srcdir"

  # IRSIM uses old K&R-style function declarations with empty parameter lists
  # GCC 15 changed the default C dialect to gnu23, where `()` means `(void)`
  export CFLAGS="$CFLAGS -std=gnu17"

  # The real autoconf script lives in scripts/. The top-level ./configure
  # wrapper just cd's into scripts/ but also forces CFLAGS="-g", which would
  # discard the distro build flags exported by makepkg. Call scripts/configure
  # directly so CFLAGS/CPPFLAGS/LDFLAGS from makepkg.conf are honored.
  ( cd scripts && ./configure --prefix=/usr )

  # ALL_TARGET=tcl when Tcl is found
  make
}

package() {
  cd "$srcdir/$_srcdir"

  # DESTDIR is respected by the install-tcl target. Files land in:
  #   $pkgdir/usr/bin                              (executables)
  #   $pkgdir/usr/lib/irsim/{doc,prm,sys,tcl}      (runtime data + Tcl library)
  #   $pkgdir/usr/share/man/man{1,3,5}             (manual pages)
  make DESTDIR="$pkgdir" install
}
