# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='comtrol-lcom'
pkgver='1.06'
pkgrel='1'
pkgdesc='open multiple serial ports or TCP/IP connections and exercise them in different ways'
arch=('i686' 'x86_64')
url='http://downloads.comtrol.com/html/DM_PRO_RTS_SERIALHUB_drivers.htm'
license=('custom')
depends=('ncurses')
_verwatch=('http://downloads.comtrol.com/html/DM_PRO_RTS_SERIALHUB_drivers.htm' '../utilities/linux/lcom/lcom-\([0-9\.]\+\)\.tar\.gz' 'l')
_srcdir="${pkgname##*-}-${pkgver}"
source=("http://downloads.comtrol.com/utilities/linux/lcom/lcom-${pkgver}.tar.gz")
sha256sums=('ace5a3ca00addfc10b94c065faacf73a2bb5f6ab916e05fc7035186d9cf79e1e')

prepare() {
  set -u
  cd "${_srcdir}"
  find -type 'f' -exec chmod 644 '{}' '+'
  sed -e 's:\r$::g' -i 'README'

  # Make install package compatible
  sed -e 's:/usr/local/bin:/usr/bin:g' \
      -e 's:/usr/local/man:/usr/share/man:g' \
      -e '/^install:/,/^$/ s: /usr: "$(DESTDIR)"/usr:g' \
    -i 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j1 # too small for parallel make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man/man1"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}

set +u
