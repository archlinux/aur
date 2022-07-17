# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fluxbox-wm
_pkgname=fluxbox
_commit='1d19662c8975e881b4fa6465a8305be3ea5282ee'
pkgver=1.3.7+205+g1d19662c
pkgrel=2
pkgdesc='A lightweight and highly-configurable window manager build without toolbar and slit support'
arch=('x86_64')
url='http://www.fluxbox.org/'
license=('MIT')
provides=('fluxbox')
conflicts=('fluxbox')
depends=('fontconfig' 'libfontconfig.so' 'fribidi' 'libfribidi.so' 'imlib2'
         'libxft' 'libxinerama' 'libxpm' 'libxrandr')
makedepends=('git')
optdepends=('xorg-xmessage: for using the fbsetbg and fluxbox-generate_menu utilities')
options=('!makeflags')
source=("git+https://github.com/${_pkgname}/${_pkgname}.git#commit=${_commit}"
        'window-menu.patch'
        'fluxbox.desktop')
sha256sums=('SKIP'
            '9caa2179d17517034c19cc237f817dfb26da1a4cbdc6ed298a1b2bea14ccf0f7'
            '2148a90aca653b596e9632264dbdbd8c7e673d732e4b04eee66a8ac1e68b3c5d')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/Release-//;s/_/./g;s/-/+/g'
}

prepare() {
  cd "${_pkgname}"
  patch -Np1 < ../window-menu.patch
  autoreconf -fi
}

build() {
  cd "${_pkgname}"
  ./configure \
    --prefix=/usr \
    --enable-imlib2 \
    --enable-nls \
    --enable-xft \
    --enable-xinerama \
    --disable-slit \
    --disable-toolbar
  # no more disable-systray option
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -m0644 "${srcdir}/fluxbox.desktop" "${pkgdir}/usr/share/xsessions/fluxbox.desktop"
  install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
