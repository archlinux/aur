# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: kfgz <kfgz at interia pl>

set -u
pkgname='vche'
pkgver='1.7.2'
pkgrel='2'
pkgdesc='A hex editor which lets you view/edit hard drives, CDROMs, RAM, and everything that can be read.'
arch=('i686' 'x86_64')
url="http://www.grigna.com/diego/linux/${pkgname}/"
license=('GPL')
depends=('ncurses')
makedepends=('gcc')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
md5sums=('d2a21986a4d4a23820ff4862e96d061d')
sha256sums=('3142dd3ed8b7c75febfe1dab2fb3437e2a41948a4726da0657fb4057450ffd00')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}/src"
  sed -e '/^CCOPTS =/ s:$: -fcommon:g' -i 'Rules.make'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}/src"
  nice make -s
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}/src"

  # binaries
  install -Dpm755 vche* -t "${pkgdir}/usr/bin/"

  # manpages
  cd "${srcdir}/${pkgname}-${pkgver}/doc"
  install -Dm644 <(sed -e "s/@version@/${pkgver}/g" -e 's/@releasedate@/November 1999/g' -e 's%@libdir@%/etc%g' -e 's%@configfile@%vche.conf%g' 'vche.1.in') "${pkgdir}/usr/share/man/man1/vche.1"
  install -Dm644 <(sed -e "s/@version@/${pkgver}/g" -e 's/@releasedate@/November 1999/g' -e 's%@libdir@%/etc%g' -e 's%@configfile@%vche.conf%g' 'vche.conf.5.in') "${pkgdir}/usr/share/man/man5/vche.conf.5"

  # config
  install -Dpm644 'vche.conf' -t "${pkgdir}/etc/"
  set +u
}
set +u
