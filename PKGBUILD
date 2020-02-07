# Maintainer: ondoho <ohnonot-github@posteo.de>
# Contributor: Jon Wilson <bugs@pandorica.net>
# Contributor: Spyros Stathopoulos <foucault.online[at]gmail[dot]com>
# Contributor: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky19
_pkgname=conky
pkgver=1.9.0
pkgrel=10
pkgdesc="An advanced system monitor for X based on torsmo - minimal configuration"
arch=('i686' 'x86_64')
url="https://github.com/brndnmtthws/conky/"
license=('GPL3')
provides=('conky')
depends=('libxml2' 'curl' 'cairo' 'libxft' 'glib2' 'libxdamage' 'imlib2')
makedepends=('pkgconfig' 'docbook2x' 'docbook-xml' 'docbook-xsl')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/brndnmtthws/${_pkgname}/archive/${pkgver}.tar.gz" "conky.h.patch")
md5sums=('b13f2c7d52e18d94bfbfcd5157406db7' '3a4ebcc2e18685302945944f7bc0c87b')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  sed -i '/#include <curl\/types.h>/d' ${srcdir}/${_pkgname}-${pkgver}/src/ccurl_thread.c
  # use "conky19" instead of "conky", so that this version can coexist with normal conky.
  grep -Irlm1 \${sysconfdir}/conky | while read file; do sed -i "s#\${sysconfdir}/conky#\${sysconfdir}/${pkgname}#g" "$file"; done
  grep -Irlm1 etc/conky.conf | while read file; do sed -i "s#etc/conky#etc/${pkgname}#g" "$file"; done
  cd src
  patch -i ../../conky.h.patch
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./autogen.sh
  CPPFLAGS="${CXXFLAGS}" LIBS="${LDFLAGS}" ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-wlan \
              --disable-rss \
              --disable-ibm \
              --enable-imlib2 \
              --disable-lua \
              --disable-lua-cairo \
              --disable-lua-imlib2 \
              --disable-nvidia \
              --disable-ncurses \
              --disable-hddtemp \
              --disable-apcupsd \
              --disable-math \
              --disable-mmpd \
              --disable-moc \
              --disable-argb \
              --disable-lua \
              --disable-alsa \
              --program-suffix=19
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/${pkgname}rc.vim
  install -D -m644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/${pkgname}rc.vim
}
