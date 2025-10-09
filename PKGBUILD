# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

set -u
pkgname='bashdb'
#_ver='4.4-0.94'
#_ver='4.4-1.0.1'
_ver='5.2-1.2.0'
pkgver="${_ver//-/_}"
pkgrel='1'
pkgdesc='A debugger for Bash scripts loosely modeled on the gdb command syntax'
arch=('any')
url='http://bashdb.sourceforge.net/'
license=('GPL')
depends=("bash>=${_ver%%-*}" 'python-pygments' 'pygmentize')
makedepends=('texi2html')
_srcdir="${pkgname}-${_ver}"
_verwatch=("https://sourceforge.net/projects/${pkgname}/rss" "\s*<title>.*/${pkgname}-\([_0-9\.]\+\)\.tar\.gz\].*" 'f'); _getlinks() { sed -e '/^\s\+<title>/ s:\([0-9]\)-:\1_:g'; }
source=("https://phoenixnap.dl.sourceforge.net/project/${pkgname}/${pkgname}/${_ver}/${pkgname}-${_ver}.tar.bz2")
md5sums=('04f3b8c5175b2fa83dd1ac187f4f10a0')
sha256sums=('96fe0c8ffc12bc478c9dc41bb349ae85135da71b692069b8b7f62b27967ce534')
sha512sums=('4358e79c7919eed6ea62d52b2d4c222515fa822d1c1f1c85644c9812a0dfe9b9c3e6d98900d63869ca93508360c6771ecd53bddda34cd7852153aacefedc2269')

prepare() {
  set -u
  cd "${_srcdir}"
  local _seds=(
    -e '# Bypass the strict bash version check'
    -e "/^\s+'5.2' / s:\): | '5.3'&:g"
    -e '# Why does a bash specific utility use /bin/sh. sh is not bash even without dashbinsh'
    -e 's:/bin/sh:/usr/bin/bash:g'
  )
  sed -E "${_seds[@]}" -i 'configure'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr' --disable-static -C
  fi
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/info/dir"
  set +u
}
set +u
