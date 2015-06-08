# Maintainer: Calimero <calimeroteknik@free.fr>

pkgname=fbpanel-svn
pkgver=515
pkgrel=5
pkgdesc='NetWM compliant desktop panel'
arch=('i686' 'x86_64')
url='http://fbpanel.sourceforge.net/'
depends=('gtk2')
makedepends=('subversion')
conflicts=('fbpanel')
provides=('fbpanel')
license=('GPL')
source=("$pkgname"::"svn+https://fbpanel.svn.sourceforge.net/svnroot/fbpanel/trunk#revision=$pkgver"
        'https://sourceforge.net/p/fbpanel/patches/_discuss/thread/b77d09e7/4927/attachment/fbpanel_sys_battery.patch')
md5sums=('SKIP'
         'd0e40eeb3b32e941e2e656bda1da2428')

pkgver() {
  cd "${srcdir}/${pkgname}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  # Why is the menu icon highlighted in red?
  # Fix this to a white highlight.
  sed -i 's/0x702020/0x282828/' plugins/menu/menu.c

  # Fix battery plugin
  patch -d plugins/battery -Np0 -i "${srcdir}/fbpanel_sys_battery.patch"
}

build() {
  cd "${srcdir}/${pkgname}"

  # Fix missing linker flags
  export LDFLAGS="${LDFLAGS} -lX11 -lm"

  # Python2 fix
  sed -i 's|/usr/bin/python$|/usr/bin/python2|' configure

  ./configure --prefix=/usr \
              --mandir=/usr/share/man/man1 \
              --libexecdir="/usr/lib$([[ "$pkgver" > 515 ]] && echo '/fbpanel')"

  # Additional python2 fix for the new build system introduced in r516
  [[ "$pkgver" > 515 ]] && sed -i 's|/usr/bin/python$|/usr/bin/python2|' repl.py

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  # Man page was forgotten before r516
  [[ "$pkgver" > 515 ]] || install -Dm 644 data/man/fbpanel.1 "${pkgdir}/usr/share/man/man1/fbpanel.1"
}
