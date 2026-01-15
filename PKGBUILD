# Maintainer: Sasha Marie te Rehorst <sasha.marieterehorst@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=xorg-xinit
pkgname=xorg-xinit-git
pkgver=1.4.4.r2.ge039b40
pkgrel=1
pkgdesc="X.Org initialisation program"
arch=('x86_64')
license=('X11-distribute-modifications-variant' 'MIT-open-group')
url="https://xorg.freedesktop.org/"
depends=('libx11' 'xorg-xauth' 'xorg-xrdb' 'xorg-xmodmap' 'sh' 'glibc')
makedepends=('git' 'xorg-util-macros')
optdepends=('xorg-twm' 'xterm')
backup=('etc/X11/xinit/xserverrc'
        'etc/X11/xinit/xinitrc')
source=("${pkgname}::git+https://gitlab.freedesktop.org/xorg/app/xinit.git"
        '06_move_serverauthfile_into_tmp.diff'
        'xserverrc')
sha512sums=('SKIP'
            '54c8497d11e9f3b85704511f2dd9fceca4efeab10a6384f922e69a35850d4191511ce20fe020cf4301e0e9655831d86f5390e19f357e11a3a29a9e18ab69d92e'
            'f86d96d76bcb340021e7904925f0029f8662e4dfc32489198b3a8695dca069da496539e2287249c763fe9c4d8d5d591fd18fe49a0bee822cbbd0eb712efbb89b')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed -r 's/xinit-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "${srcdir}/06_move_serverauthfile_into_tmp.diff"

  if [ -f "xinitrc.cpp" ]; then
      sed -i -e 's/XSLASHGLOB.sh/XSLASHGLOB/' xinitrc.cpp
  elif [ -f "xinitrc.in" ]; then
      sed -i -e 's/XSLASHGLOB.sh/XSLASHGLOB/' xinitrc.in
  fi
  
  autoreconf -vfi
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr --with-xinitdir=/etc/X11/xinit
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -m644 "${srcdir}/xserverrc" "${pkgdir}/etc/X11/xinit/xserverrc"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
