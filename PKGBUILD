# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

set -u
pkgname='bashdb'
#_ver='4.4-0.94'
#_ver='4.4-1.0.1'
_ver='5.0-1.1.2'
pkgver="${_ver//-/_}"
pkgrel='1'
pkgdesc='A debugger for Bash scripts loosely modeled on the gdb command syntax'
arch=('any')
url='http://bashdb.sourceforge.net/'
license=('GPL')
depends=("bash>=${_ver%%-*}" 'python-pygments' 'pygmentize')
_srcdir="${pkgname}-${_ver}"
_verwatch=("https://sourceforge.net/projects/${pkgname}/rss" "\s*<title>.*/${pkgname}-\([_0-9\.]\+\)\.tar\.gz\].*" 'f'); _getlinks() { sed -e '/^\s\+<title>/ s:\([0-9]\)-:\1_:g'; }
source=("https://phoenixnap.dl.sourceforge.net/project/${pkgname}/${pkgname}/${_ver}/${pkgname}-${_ver}.tar.bz2")
md5sums=('33eceddaffd52f42c74795178e7744ee')
sha256sums=('30176d2ad28c5b00b2e2d21c5ea1aef8fbaf40a8f9d9f723c67c60531f3b7330')
sha512sums=('32ff6d315e8cf9d59485802d5284fde53fa2d9f40ec238428a479f8a1ed1359e9bea2946b192b78534e7ac835491d5d64d73f536c8dfa93583b4c6d55d4d4545')

prepare() {
  set -u
  cd "${_srcdir}"
  sed -e "/^\s\+'5.0' / s:): | '5.1'&:g" -i 'configure'
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
