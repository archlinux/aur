# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-rpihddevice
pkgver=1.0.0.r27.g00af2c0
_gitver=00af2c0eb2b86249b5aa680fccd6d3239a05e8f8
_vdrapi=2.4.0
pkgrel=2
pkgdesc="Output device for Raspberry Pi"
url="http://projects.vdr-developer.org/projects/plg-rpihddevice"
arch=('armv6h' 'armv7h')
license=('GPL2')
depends=('ffmpeg' 'mesa' 'raspberrypi-firmware-tools' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-rpihddevice.git#commit=$_gitver"
        "gcc6-fixes01.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         'cee9569e8a827cca79188a5ce27dce1c'
         '60564c9e26e39aedf8a932d8093f999a')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  _last_release=1.0.0
  _last_release_commit=f4b9c55f3e4eb6e60aceba43d97f611020dc0361

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
  patch -p0 -i "$srcdir/gcc6-fixes01.patch"
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
