# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org>

_name=at-home-modifier
pkgname=xf86-input-evdev-ahm
_pkgname_orig=xf86-input-evdev
pkgver=2.10.3
pkgrel=1
pkgdesc='X.org evdev input driver + at-home-modifier patch'
arch=(i686 x86_64)
url='https://gitlab.com/at-home-modifier/at-home-modifier-evdev/wikis/home'
_url_orig='http://xorg.freedesktop.org/'
license=('custom')
depends=('glibc' 'systemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto')
provides=('xf86-input-driver' 'xf86-input-evdev=2.10.3-1')
conflicts=('xorg-server<1.18.0' 'X-ABI-XINPUT_VERSION<22' 'X-ABI-XINPUT_VERSION>=23' 'xf86-input-evdev')
options=('!makeflags')
groups=('xorg-drivers' 'xorg')
source=(${_url_orig}/releases/individual/driver/${_pkgname_orig}-${pkgver}.tar.bz2{,.sig}
        https://gitlab.com/at-home-modifier/download/raw/master/patch/ahm-2.10.1.patch)
sha256sums=('5aa21ba4be8df927e5676a99c7f4f0343abc089f5451b7e73e39536f29b332a2'
            'SKIP'
            '75dd9ec06f02afa41b8e86e65e7f0ebc48c6169fc30a959eddd12a540b3f17ca')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd "${_pkgname_orig}-${pkgver}"
  # at-home-modifier patch
  patch -p1 -i "${srcdir}/ahm-2.10.1.patch"
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
