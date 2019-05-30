# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-rpihddevice
pkgver=1.0.4
_gitver=4744541fde542aa2193ffe6bdaa7c7762e7d1944
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Output device for Raspberry Pi"
url="http://projects.vdr-developer.org/projects/plg-rpihddevice"
arch=('armv6h' 'armv7h')
license=('GPL2')
depends=('ffmpeg' 'mesa' 'raspberrypi-firmware-tools' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-rpihddevice.git#commit=$_gitver"
        "ffmpeg-new.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '1c30192635271d0edc51cbd8eaa43881'
         '60564c9e26e39aedf8a932d8093f999a')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  _last_release=1.0.4
  _last_release_commit=4744541fde542aa2193ffe6bdaa7c7762e7d1944

  _count=$((`git rev-list --count HEAD` - `git rev-list --count $_last_release_commit`))
  if [ $_count -gt 0 ]; then
    printf "%s.r%s.g%s" $_last_release \
      $_count \
      `git rev-parse --short HEAD`
  else
    printf "%s" $_last_release
  fi
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
#  patch -p0 -i "$srcdir/gcc6-fixes01.patch"
  patch -p1 -i "$srcdir/ffmpeg-new.patch"
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
