# Luatex SVN Trunk
# Maintainer: Philipp Gesang <phg@phi-gamma.net>
#

pkgname=luatex-svn
pkgrel=1
pkgdesc="The LuaTeX engine, current SVN trunk, standalone binary"
pkgver=r6121
arch=(i686 x86_64 armv7h)
url="http://www.luatex.org"
# Luatex, Poppler: GPL2
# Fontforge: GPL (?)
# Cairo, zziplib: LGPL
# Luasocket, Luafilesystem, Luazip, Pixman: MIT
# dotzlib: boost
# libpng: libpng
license=('GPL2' 'boost' 'MIT' 'libpng' 'LGPL2.1')
depends=()
makedepends=(subversion)
conflicts=(context-minimals-git)
source=()

_svnlocal="${pkgname}-trunk"
_svnurl="https://foundry.supelec.fr/svn/luatex/trunk"
_svncred=anonsvn

pkgver() {
  cd "${_svnlocal}"
  local version="$(svnversion)"
  msg "Repo reports revision ${version}"
  printf "r%d" "${version//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}"
  if [[ -d "${_svnlocal}/.svn" ]]; then
    msg "Reusing existing SVN repository at ${_svnlocal}"
    cd "${_svnlocal}"
    svn update --no-auth-cache --username "${_svncred}" --password "${_svncred}"
  else
    msg "No local Subversion repo found, creating new one at ${_svnlocal}"
    svn checkout --no-auth-cache --username "${_svncred}" --password "${_svncred}" \
      "${_svnurl}" "${_svnlocal}"
  fi
  msg "Repo up to date"
}

build() {
  local reporoot="${srcdir}/${_svnlocal}"
  msg "Initiating debug build at ${reporoot}"
  cd "${reporoot}"
  ./build.sh --debug --parallel
  cp source/texk/web2c/man/luatex.man build/doc/luatex.1
  gzip build/doc/luatex.1
}

check() {
  local reporoot="${srcdir}/${_svnlocal}"
  local bin="${reporoot}/build/texk/web2c/luatex"
  msg "Verify executable ${bin}"
  [ -x "${bin}" ] || exit -1
}

_install_legal ()
{
  # luatex includes numerous libraries, all linked in so we have to consider
  # the individual licenses part of the package
  local src="${1:-}"
  local dst="${2:-}"
  if [ -z "${src}" -o -z "${dst}" ]; then
    msg "_install_legal(): junk “${src}” → “${dst}”; ignoring"
    return
  fi
  local dstfull="${pkgdir}/usr/share/${pkgname}/legal/${dst}"
  install -m644 "${src}" "${dstfull}"
  gzip "${dstfull}" # empty repetitive jargon compresses very well
}

package() {
  local reporoot="${srcdir}/${_svnlocal}"
  local bin="build/texk/web2c/luatex"
  cd "${reporoot}"
  msg "Package executable ${bin}"
  install -dm755 "${pkgdir}/usr/bin/"
  install -Dm755 "${bin}" "${pkgdir}/usr/bin/"
  ln -s luatex "${pkgdir}/usr/bin/texlua"
  ln -s luatex "${pkgdir}/usr/bin/texluac"

  msg "Package luatex man page"
  install -dm755 "${pkgdir}/usr/share/man/man1"
  install -Dm644 build/doc/luatex.1.gz "${pkgdir}/usr/share/man/man1/"
  msg "Package miscellaneous files"
  install -dm755 "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 manual/luatex.pdf "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 INSTALL README "${pkgdir}/usr/share/${pkgname}/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}/legal"
  install -m644 COPYING "${pkgdir}/usr/share/${pkgname}/legal/COPYING.luatex"
  local srclib=./source/libs
  local luatexdir=./source/texk/web2c/luatexdir
  _install_legal "${srclib}/pixman/pixman-src/COPYING"                     COPYING.pixman
  _install_legal "${srclib}/cairo/cairo-src/COPYING"                       COPYING.cairo
  _install_legal "${srclib}/libpng/libpng-src/contrib/gregbook/COPYING"    COPYING.libpng
  _install_legal "${srclib}/poppler/poppler-src/COPYING"                   COPYING.poppler
  _install_legal "${srclib}/zziplib/zziplib-src/COPYING.LIB"               COPYING.zziplib
  _install_legal "${srclib}/zlib/zlib-src/contrib/dotzlib/LICENSE_1_0.txt" LICENSE.dotzlib
  _install_legal "${srclib}/libpng/libpng-src/LICENSE"                     LICENSE.libpng
  _install_legal "${luatexdir}/luafilesystem/doc/us/license.html"          LICENSE.luafilesystem.html
  _install_legal "${luatexdir}/luasocket/LICENSE"                          LICENSE.luasocket
  _install_legal "${luatexdir}/luafontloader/fontforge/LICENSE"            LICENSE.fontforge
  _install_legal "${luatexdir}/luazip/doc/us/license.html"                 LICENSE.luazip.html
}

# vim:ft=sh:et:sw=2

