# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fluxbox-wm
_pkgname=fluxbox
_commit='88a74ff1cde22be3e894498ffd88934dc92dfef0'
pkgver=1.3.7
pkgrel=2
pkgdesc='A lightweight and highly-configurable window manager build without toolbar, systray and slit support'
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
        'styles.patch'
        'c-plus-plus-17.patch'
        'fluxbox.desktop')
sha256sums=('SKIP'
            '9caa2179d17517034c19cc237f817dfb26da1a4cbdc6ed298a1b2bea14ccf0f7'
            'd09736de789b3926a0642e381c4a30499a03c7ac99ffb6c981921910c392de07'
            'a743324fb0c684be44fbcb3ff626f604057fce42fe1dda774515c1b24efbf418'
            '2148a90aca653b596e9632264dbdbd8c7e673d732e4b04eee66a8ac1e68b3c5d')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/Release-//;s/_/./g;s/-/+/g'
}

prepare() {
  cd "${_pkgname}"
  patch -Np1 < ../window-menu.patch
  patch -Np1 < ../styles.patch
  patch -Np1 < ../c-plus-plus-17.patch
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
    --disable-toolbar \
    --disable-systray
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -m0644 "${srcdir}/fluxbox.desktop" "${pkgdir}/usr/share/xsessions/fluxbox.desktop"
  install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
