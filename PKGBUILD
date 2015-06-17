# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Kevin Piche <kevin@archlinux.org>

_gitname=hping
pkgname=hping-git
pkgver=r13.3547c76
pkgrel=1
pkgdesc='A command-line oriented TCP/IP packet assembler/analyzer.'
arch=('i686' 'x86_64')
url='http://www.hping.org'
license=('GPL2' 'BSD')
depends=('libpcap')
makedepends=('git')
source=("$_gitname"::'git+https://github.com/antirez/hping.git'
        'Makefile.patch'
		'tshzset.patch')
sha512sums=('SKIP'
            '120005e7ebc8c26bb199aed79cafd9333126ddaf284aa02823eecefc138e342f5f5437af88940598e4437972a4bb98386647ef82c7eef5c9b9b480b8fdbc0ad2'
			'f6f110ba3b3f6ffd7131a464b9f3092e0b9da3087d7502d2a2757cdceaa722ae55c82a8c6a858d1671c50befd181afd597732b6df5d658656df351ca4090a2c3')
provides=('hping')
conflicts=('hping')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$_gitname"

  patch -Np1 -i ../tshzset.patch

  MANPATH=/usr/share/man ./configure --no-tcl
  make
}

package() {
  cd "${srcdir}/$_gitname"

  patch -p1 < ../Makefile.patch

  make DESTDIR="${pkgdir}" install
  install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
