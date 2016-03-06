# Maintainer: Daniel Haß <aur@hass.onl>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Enlightenment Developers <enlightenment-devel@enlightenment.org>
_pkgname=efl
pkgname=$_pkgname-fresh
pkgver=1.17.0
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - updated stable version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'custom')
depends=('bullet' 'libjpeg-turbo' 'gst-plugins-base'
         'luajit' 'curl' 'fribidi' 'libpulse' 'libxcomposite'
         'libxinerama' 'libxrandr' 'libxss' 'libinput'
         'libxcursor' 'libxp' 'libwebp' 'shared-mime-info'
         'libxkbcommon' 'wayland' 'lz4' 'openjpeg' 'avahi')
makedepends=('make')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
replaces=('ecore' 'edje' 'eet' 'eeze' 'efreet' 'eina' 'eio' 'embryo'
          'emotion' 'ethumb' 'evas')
options=('!emptydirs')
source=(http://download.enlightenment.org/rel/libs/${_pkgname}/$_pkgname-$pkgver.tar.xz)
install=efl.install
sha256sums=('c13540bad764d014fea2c079fad8fcca62e5c229994d43aa4eb692d2c9b73afe')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./configure --prefix=/usr \
  --disable-static --disable-tslib --enable-fb \
  --enable-xinput22 --enable-multisense --enable-systemd \
  --enable-image-loader-webp --enable-harfbuzz --enable-wayland \
  --enable-liblz4 --enable-drm

  make
}

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -j1 DESTDIR=${pkgdir} install

  # install non-standard license files
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/licenses/COPYING.BSD" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.BSD"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/licenses/COPYING.SMALL" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.SMALL"
}

