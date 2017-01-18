# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org>

_name=at-home-modifier
pkgname=xf86-input-evdev-ahm
_pkgname_orig=xf86-input-evdev
pkgver=2.10.5
_ahmver=2.10.3
pkgrel=1
pkgdesc='X.org evdev input driver + at-home-modifier patch'
arch=(i686 x86_64)
url='https://gitlab.com/at-home-modifier/at-home-modifier-evdev/wikis/home'
_url_orig='https://xorg.freedesktop.org/'
license=('custom')
depends=('libsystemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=24.1' 'resourceproto' 'scrnsaverproto')
provides=('xf86-input-evdev=2.10.5-1')
conflicts=('xorg-server<1.19.0' 'X-ABI-XINPUT_VERSION<24.1' 'X-ABI-XINPUT_VERSION>=25' 'xf86-input-evdev')
options=('!makeflags')
groups=('xorg-drivers')
source=(${_url_orig}/releases/individual/driver/${_pkgname_orig}-${pkgver}.tar.bz2{,.sig}
        https://gitlab.com/at-home-modifier/download/raw/master/patch/ahm-${_ahmver}.patch)
sha256sums=('9edaa6205baf6d2922cc4db3d8e54a7e7773b5f733b0ae90f6be7725f983b70d'
            'SKIP'
            '2868a8f63b492a8486e3e9bb45c56811cbc4dbcdac1bfe459eb1cc8610bf7bed')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd "${_pkgname_orig}-${pkgver}"
  # at-home-modifier patch
  patch -p1 -i "${srcdir}/ahm-${_ahmver}.patch"
}

build() {
  cd "${_pkgname_orig}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname_orig}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
