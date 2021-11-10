# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org>

_name=at-home-modifier
pkgname=xf86-input-evdev-ahm
_pkgname_orig=xf86-input-evdev
pkgver=2.10.6
_ahmver=2.10.6
pkgrel=5
pkgdesc='X.org evdev input driver + at-home-modifier patch'
arch=(x86_64)
url='https://gitlab.com/at-home-modifier/at-home-modifier-evdev/wikis/home'
_url_orig='https://xorg.freedesktop.org/'
license=('custom')
depends=('libsystemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=24.4' 'xorgproto')
provides=('xf86-input-evdev=2.10.6-3')
conflicts=('xorg-server<21.1.1' 'X-ABI-XINPUT_VERSION<24' 'X-ABI-XINPUT_VERSION>=25' 'xf86-input-evdev')
backup=('etc/X11/xorg.conf.d/80-ahm.conf')
options=('!makeflags')
groups=('xorg-drivers')
source=(${_url_orig}/releases/individual/driver/${_pkgname_orig}-${pkgver}.tar.bz2{,.sig}
        https://gitlab.com/at-home-modifier/download/raw/master/patch/ahm-${_ahmver}.patch)
sha512sums=('560b0a6491d50a46913a5890a35c0367e59f550670993493bd9712d712a9747ddaa6fe5086daabf2fcafa24b0159383787eb273da4a2a60c089bfc0a77ad2ad1'
            'SKIP'
            'd484a5ad6d20269b6036016b3975e9e7e035d8191dea0c335ad791a9bf41cdab5804dce95be3980fdfc854705a55af50c9ac0d7b56e626b23ed76cd86039a288')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd "${_pkgname_orig}-${pkgver}"
  # at-home-modifier patch
  patch -p1 -i "${srcdir}/ahm-${_ahmver}.patch"
  # Update timestamps to prevent error https://stackoverflow.com/a/33279062
  touch aclocal.m4 Makefile.in
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
  # After the release of ahm-2.10.6, I renamed README to README.adoc. (It's better in GitLab, the hosting site.) Maybe you want to put a future reminder in PKGBUILD.
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README "${pkgdir}/usr/share/doc/${pkgname}/"
  # Not sure what this means: "you can modify the following line in Makefile.am: dist_xorgconf_DATA = 10-evdev.conf"
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"
  install -m644 80-ahm.conf "${pkgdir}/etc/X11/xorg.conf.d/"
}
