# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org>

_name=at-home-modifier
pkgname=xf86-input-evdev-ahm
_pkgname_orig=xf86-input-evdev
pkgver=2.10.0
pkgrel=4
pkgdesc='X.org evdev input driver + at-home-modifier patch'
arch=(i686 x86_64)
url='https://gitlab.com/at-home-modifier/at-home-modifier-evdev/wikis/home'
_url_orig='http://xorg.freedesktop.org/'
license=('custom')
depends=('glibc' 'systemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto')
provides=('xf86-input-driver' 'xf86-input-evdev=2.10.0-3')
conflicts=('xorg-server<1.18.0' 'X-ABI-XINPUT_VERSION<22' 'X-ABI-XINPUT_VERSION>=23' 'xf86-input-evdev')
options=('!makeflags')
groups=('xorg-drivers' 'xorg')
source=(${_url_orig}/releases/individual/driver/${_pkgname_orig}-${pkgver}.tar.bz2{,.sig}
        Logitech_G600.diff
        https://gitlab.com/at-home-modifier/download/raw/master/patch/ahm-2.10.0.patch)
sha256sums=('d097298eb07b7a9edf4493b5c3c058041458ca52c8c62dbd4f40b84c5086d117'
            'SKIP'
            '9d8aef7fde6e24a02f6344011c672b6a7fec8604012aea81ac00ba9c25166c41'
            '499aae4533fef8fbfb2cafc7ee495da549eee940ea701ecc13a5ed8d8c731775')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd "${_pkgname_orig}-${pkgver}"
  # FS#46994 - https://bugs.freedesktop.org/show_bug.cgi?id=92856
  patch -Np1 -i ${srcdir}/Logitech_G600.diff
  # at-home-modifier patch
  patch -p1 -i "${srcdir}/ahm-2.10.0.patch"
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
