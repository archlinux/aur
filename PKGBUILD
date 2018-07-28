# Contributor: Philipp Gesang <phg@phi-gamma.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=luatex-git
pkgrel=1
pkgdesc="The LuaTeX engine, current git master, standalone binary"
pkgver=20180501
arch=('i686' 'x86_64' 'armv7h')
url="http://www.luatex.org"
depends=('glibc')
makedepends=('git')
license=('GPL2')
conflicts=('context-minimals-git')
source=("git+https://github.com/TeX-Live/luatex.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

build() {
  cd ${pkgname%-git}
  ./build.sh --debug --parallel
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
  local reporoot="${srcdir}/${pkgname%-git}"
  local bin="build/texk/web2c/luatex"
  cd "${reporoot}"
  msg "Package executable ${bin}"
  install -dm755 "${pkgdir}/usr/bin/"
  install -Dm755 "${bin}" "${pkgdir}/usr/bin/"
  ln -s luatex "${pkgdir}/usr/bin/texlua"
  ln -s luatex "${pkgdir}/usr/bin/texluac"

  msg "Package luatex man page"
  install -Dm644 build/texk/web2c/man/luatex.1 "${pkgdir}/usr/share/man/man1/luatex.1"
  msg "Package miscellaneous files"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 manual/luatex.pdf "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 INSTALL README "${pkgdir}/usr/share/doc/${pkgname}/"
}

