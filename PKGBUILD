# Maintainer: Gigadoc2 <gigadoc2+aur@revreso.de>
# Contributor: VirtualTam <virtualtam@flibidi.net>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Felipe Machado aka arch_audio <machado.felipe@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@gmail.com> package
# Contributor: G.R.E.A - Grupo Recifense de Estudos do Archlinux (recife's group of archlinux research)

_pkgname=sooperlooper
pkgname=${_pkgname}-git
pkgver=r6.206e74f
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording"
arch=('i686' 'x86_64')
url="http://essej.net/sooperlooper/"
license=('GPL')
depends=('jack' 'liblo' 'libsigc++' 'libxml2' 'rubberband' 'wxgtk')
optdepends=('libsamplerate: audio sample rate conversion')
provides=('sooperlooper')
conflicts=('sooperlooper')
source=("git+https://github.com/essej/sooperlooper.git"
        "0001-fix_wxwidgets_3.0.2.patch::https://github.com/essej/sooperlooper/commit/b84c257e912fb086e549d67a64ca4bc46e9c9a77.patch"
        "0002-fix-build-with-ncurses-6.patch::https://github.com/essej/sooperlooper/commit/50942f022d28c56167dc0094392b0d0485780617.patch"
        "0003-fix-pos-font-size.patch::https://github.com/essej/sooperlooper/commit/da1f90b6bb258309515977443cd0b4854dca07e7.patch"
        "${_pkgname}.desktop"
        "slgui.png")
sha256sums=('SKIP'
            'ee482c9c30489100d160dbbb3f88b1c61e648a03877950e259a6acc813d130df'
            '1c685ce06c5dec6574213a1ea31c86184496151e9256597550a4cf3f6790b0fd'
            '1ca02121423de66efc7a2388a11a5fa88a85bc7567e5c0501d97733d67a76aa3'
            'add385c13329e0d28b4d89d1a08953d09013a896c80bbda7fe450de4bd279507'
            '465dfb14154899eae5435afa7b2e04b2cbb8463fc3b60c465246628e496b3d85')
pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  patch -p1 < ../0001-fix_wxwidgets_3.0.2.patch
  patch -p1 < ../0002-fix-build-with-ncurses-6.patch
  patch -p1 < ../0003-fix-pos-font-size.patch
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  CPPFLAGS=-std=c++11 ./configure \
          --prefix=/usr \
          --with-wxconfig-path=/usr/bin/wx-config
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 ../slgui.png "${pkgdir}/usr/share/pixmaps/slgui.png"
}
