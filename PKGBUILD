# Contributor: Black_Codec <orso.f.regna@gmail.com>
# Original Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fluxbox-noslit
_pkgname=fluxbox
pkgver=1.3.7
pkgrel=2
pkgdesc="A lightweight and highly-configurable window manager"
arch=('x86_64')
url="http://www.fluxbox.org"
license=('MIT')
provides=('fluxbox')
conflicts=('fluxbox')
depends=('libxft' 'libxpm' 'libxinerama' 'libxrandr' 'imlib2' 'fribidi')
optdepends=('xorg-xmessage: for using the fbsetbg and fluxbox-generate_menu utilities')
options=('!makeflags')
source=("https://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"
        '0001-do-not-leave-stale-oplock-behind.patch'
        '0002-send-ConfigureNotify-using-root-coordinates.patch'
        'fluxbox.desktop')
sha256sums=('fc8c75fe94c54ed5a5dd3fd4a752109f8949d6df67a48e5b11a261403c382ec0'
            '9c486f454f46a51cb1b7cb65de812faa12e2a1cce13785c349b488f051a01470'
            '66f64c67e5c99b2c6bf139ba2f7a3ff9fcb613c5b49b0038c42cc55cc00153dc'
            '2148a90aca653b596e9632264dbdbd8c7e673d732e4b04eee66a8ac1e68b3c5d')

prepare() {
  cd ${_pkgname}-${pkgver}

  patch -Np1 < ../0001-do-not-leave-stale-oplock-behind.patch
  patch -Np1 < ../0002-send-ConfigureNotify-using-root-coordinates.patch
}

build() {
  cd ${_pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --enable-imlib2 \
    --enable-nls \
    --enable-xft \
    --enable-xinerama \
    --disable-slit
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/fluxbox.desktop" "${pkgdir}/usr/share/xsessions/fluxbox.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
