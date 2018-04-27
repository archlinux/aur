# Maintainer: L <alaviss 0 at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>
# Contributor: Jan Willemson <janwil@hot.ee>
# Contributor: Hugo Ideler <hugoideler@dse.nl>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Original PKGBUILD: Andre Naumann <anaumann@SPARCed.org>
# See http://bbs.archlinux.org/viewtopic.php?t=9318&highlight=fpc

# Build docs
_build_docs=0

pkgbase='fpc-svn'
pkgname=('fpc-svn' 'fpc-src-svn')
[[ $_build_docs -ne 0 ]] && pkgname+=('fpc-docs-svn')
pkgver=3.1.1.r38855
_pkgver=${pkgver%.r*}
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.freepascal.org/'
license=('GPL' 'LGPL' 'custom')
depends=('ncurses' 'zlib' 'expat')
# Trunk can only be built with stable version of FPC
makedepends=('fpc<9999' 'subversion')
[[ $_build_docs -ne 0 ]] && makedepends+=('texlive-core' 'texlive-htmlxml'
                                          'texlive-latexextra' 'ghostscript')
source=('fpcbuild::svn+http://svn.freepascal.org/svn/fpcbuild/trunk')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/fpcbuild/fpcsrc
  printf '%s.r%s' \
    $(grep -m 1 'version' Makefile.fpc | cut -d '=' -f 2) \
    $(svnversion | tr -d [A-z])
}

build() {
  cd "${srcdir}"/fpcbuild
  pushd fpcsrc/compiler
  fpcmake -Tall
  popd
  make NOGDB=1 OPT=' -dRelease' build

  if [[ $_build_docs -ne 0 ]]; then
    cd fpcdocs
    make -j1 FPCSRCDIR="${srcdir}"/fpcbuild/fpcsrc html
  fi
}

package_fpc-svn() {
  pkgdesc="The Free Pascal Compiler is a Turbo Pascal 7.0 and Delphi compatible \
    Pascal Compiler. It comes with fully TP 7.0 compatible run-time library."
  backup=('etc/fpc.cfg')
  options=('staticlibs')
  conflicts=('fpc')
  provides=('fpc=9999')

  cd "${srcdir}"/fpcbuild

  export HOME="${srcdir}"

  make -j1 PREFIX="${pkgdir}"/usr NOGDB=1 OPT=' -dRelease' install
  export PATH="${pkgdir}/usr/bin:${PATH}"

  install -Dm644 fpcsrc/rtl/COPYING.FPC \
    "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.FPC

  local _fpcarch=''
  case "$CARCH" in
    'i686')
      _fpcarch='386'
      ;;
    'x86_64')
      _fpcarch='x64'
      ;;
    *)
      error 'Unsupported $CARCH'
      return 1
      ;;
  esac
  ln -s /usr/lib/fpc/${_pkgver}/ppc${_fpcarch} "${pkgdir}"/usr/bin/
  unset _fpcarch

  install -dm755 "${pkgdir}"/etc
  "${pkgdir}"/usr/lib/fpc/${_pkgver}/samplecfg \
    "${pkgdir}"/usr/lib/fpc/${_pkgver} "${pkgdir}"/etc

  # use -fPIC by default
  echo -e '#ifdef cpux86_64\n# for x86_64 use -fPIC by default\n-Cg\n#endif' \
    >> "${pkgdir}"/etc/fpc.cfg

  mv "${pkgdir}"/usr/man "${pkgdir}"/usr/share/

  find "${pkgdir}"/etc -type f -exec sed -i "s|${pkgdir}||g" {} \;
}

package_fpc-src-svn() {
  pkgdesc='Sources for the Free Pascal Compiler (required by the Lazarus IDE)'
  options=('!strip')
  conflicts=('fpc-src')
  provides=('fpc-src')

  install -dm755 "${pkgdir}"/usr/lib/fpc

  svn export -r HEAD "${srcdir}"/fpcbuild/fpcsrc "${pkgdir}"/usr/lib/fpc/src
}

package_fpc-docs-svn() {
  pkgdesc='Documentation for the Free Pascal Compiler'
  options=('!strip')

  cd "${srcdir}"/fpcbuild/fpcdocs
  make PREFIX="${pkgdir}"/usr htmlinstall
}
