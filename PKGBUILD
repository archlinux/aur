# Maintainer: Daniel Moch <daniel@danielmoch.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xorg-xinit-posix
pkgver=1.4.1
pkgrel=1
pkgdesc="X.Org initialisation program with patches to support POSIX userspaces (e.g. sbase)"
arch=('x86_64')
license=('custom')
url="https://xorg.freedesktop.org/"
depends=('libx11' 'xorg-xauth' 'xorg-xrdb' 'xorg-xmodmap' 'inetutils')
makedepends=('xorg-util-macros')
optdepends=('xorg-twm' 'xterm')
provides=('xorg-xinit')
conflicts=('xorg-xinit')
backup=('etc/X11/xinit/xserverrc'
        'etc/X11/xinit/xinitrc')
source=(${url}/releases/individual/app/xinit-${pkgver}.tar.bz2{,.sig}
        06_move_serverauthfile_into_tmp.diff
        fs25361.patch
        fs46369.patch
        xserverrc
	startx-posix.patch)
options=(!emptydirs)
validpgpkeys=('7C2608F8E5F9E78D7A3F26FF177544B49AF313FB') #  "Hans de Goede <jwrdegoede@fedoraproject.org>"
validpgpkeys+=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"
sha256sums=('de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa54abb9'
            'SKIP'
            '224a8e2de310548101b14c2ab2fc45fecc20e714212932cd797962565164527d'
            '929ed22ab034ee483390857d56f45058aec8002f862987aecd7e1d271102aa22'
            '6e2c44b997e604db167f00168e8b6c68257be50447d7a80856b4aa910f52351e'
            '86835010b5350c41035495b7b845db0eecf1e4b7eeaf152b12a881fa502e5387'
            '567a78a903af4404fc6e7f9781150de3f56df804dd230de4bcc7bf994fdc36e5')

prepare() {
  cd xinit-${pkgver}
  patch -Np1 -i ../06_move_serverauthfile_into_tmp.diff
  patch -Np1 -i ../fs25361.patch
  patch -Np1 -i ../fs46369.patch
  patch -Np1 -i ../startx-posix.patch
  sed -i -e 's/XSLASHGLOB.sh/XSLASHGLOB/' xinitrc.cpp
}

build() {
  cd xinit-${pkgver}
  autoreconf -fi
  ./configure --prefix=/usr --with-xinitdir=/etc/X11/xinit
  make
}

package() {
  cd xinit-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m644 "${srcdir}/xserverrc" "${pkgdir}/etc/X11/xinit/xserverrc"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
