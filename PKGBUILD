# Maintainer: L <alaviss 0 at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>
# Contributor: Jan Willemson <janwil@hot.ee>
# Contributor: Hugo Ideler <hugoideler@dse.nl>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Original PKGBUILD: Andre Naumann <anaumann@SPARCed.org>
# See http://bbs.archlinux.org/viewtopic.php?t=9318&highlight=fpc

pkgbase=fpc-svn
pkgname=(fpc-svn fpc-src-svn)
pkgver=3.1.1.r31028
_pkgver=${pkgver/${pkgver:5}}
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.freepascal.org/"
license=('GPL' 'LGPL' 'custom')
depends=(ncurses zlib expat)
makedepends=(fpc)
source=(fpcbuild::svn+http://svn.freepascal.org/svn/fpcbuild/trunk)
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/fpcbuild/fpcsrc"
  printf "%s.r%s" \
    $(grep -m1 version Makefile.fpc |sed 's/version=//') \
    $(svnversion)
}

build() {
  cd "${srcdir}/fpcbuild"
  pushd fpcsrc/compiler
  fpcmake -Tall
  popd
  make ${MAKEFLAGS} build NOGDB=1 # OPT=" -CX -Xs -XX -dRelease"
}

package_fpc-svn() {
  pkgdesc="The Free Pascal Compiler is a Turbo Pascal 7.0 and Delphi compatible 32bit Pascal Compiler. It comes with fully TP 7.0 compatible run-time library."
  backup=("etc/fpc.cfg")
  options=(zipman staticlibs)
  conflicts=(fpc)
  provides=(fpc)

  cd "${srcdir}/fpcbuild"

  export HOME="$srcdir"

  make -j1 PREFIX=${pkgdir}/usr install NOGDB=1 # OPT=" -Xs -XX -CX -dRelease"

  export PATH="$pkgdir/usr/bin:$PATH"

  install -Dm0644 fpcsrc/rtl/COPYING.FPC "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.FPC"

  [ "$CARCH" = "i686" ] && ln -s /usr/lib/fpc/${_pkgver}/ppc386 "${pkgdir}/usr/bin/"
  [ "$CARCH" = "x86_64" ] && ln -s /usr/lib/fpc/${_pkgver}/ppcx64 "${pkgdir}/usr/bin/"

  mkdir -p "${pkgdir}/etc"
  "${pkgdir}/usr/lib/fpc/${_pkgver}/samplecfg" "$pkgdir/usr/lib/fpc/${_pkgver}" "${pkgdir}/etc"

  # use -fPIC by default
  echo -e "#ifdef cpux86_64\n# for x86_64 use -fPIC by default\n-Cg\n#endif" >> "$pkgdir/etc/fpc.cfg"

  mv "$pkgdir/usr/man" "$pkgdir/usr/share/"

  find "$pkgdir/etc/" -type f -exec sed -i "s|$pkgdir||g" {} \;
}

package_fpc-src-svn() {
  pkgdesc="Sources for the FreePascal compiler (required by the Lazarus IDE)"
  options=(!strip)
  conflicts=(fpc-src)
  provides=(fpc-src)

  mkdir -p $pkgdir/usr/lib/fpc
  cp -r $srcdir/../fpcbuild/fpcsrc $pkgdir/usr/lib/fpc/src
}
