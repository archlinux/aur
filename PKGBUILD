# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>
# Maintainer: ferreum <code.danielk at gmail com>

_pkgname=elinks
pkgname=${_pkgname}-git
pkgver=0.13.1481.rf86be659
pkgrel=2
pkgdesc="An advanced and well-established feature-rich text mode web browser. Git version."
arch=("i686" "x86_64")
url="http://elinks.or.cz"
provides=(${_pkgname})
license=('GPL')
conflicts=(${_pkgname})
depends=('bzip2' 'expat>=2.0' 'gpm>=1.20.4' 'openssl' 'lua51' 'libidn' 'gc' 'tre')
source=("git+http://elinks.cz/elinks.git"
        "lua_strlen_fix.patch")
md5sums=('SKIP'
         'b0ea32b03eb8775d122c723a29e0db1e')

# 0.13 does not have a tag.
_relcommit="976f06ddf8d014fdfeee33a261e4f42eb4601e3b"
_relname="0.13"

pkgver() {
  cd "${_pkgname}"
  echo "${_relname}.$(git rev-list --count "${_relcommit}..HEAD").r$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  for f in lua_strlen_fix.patch; do
    msg2 "applying $f..."
    patch -p1 <"${srcdir}/$f"
  done

  msg2 "starting build..."

  [ -x configure ] || sh autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man \
              --sysconfdir=/etc \
              --with-zlib \
              --without-lzma \
              --without-bzlib \
              --without-x \
              --without-spidermonkey \
              --enable-cgi \
              --enable-leds \
              --disable-smb \
              --disable-sm-scripting \
              --enable-256-colors \
              --enable-html-highlight \
              --enable-exmode
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/locale/locale.alias"
}

# vim:set sw=2 sts=0 et:
