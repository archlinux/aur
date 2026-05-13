# Maintainer: Tymofiy Saukh <tima3050505@gmail.com>
pkgname=mt7601u-ap-dkms-git
pkgver=r1.1d5dcaa
pkgrel=1
pkgdesc='DKMS mt7601u Wi-Fi kernel module patched to expose AP mode'
arch=('any')
url='https://github.com/torvalds/linux/tree/master/drivers/net/wireless/mediatek/mt7601u'
license=('GPL-2.0-only')

depends=('dkms')
makedepends=('git' 'patch')
optdepends=(
  'linux-headers: build the module for the default Arch kernel'
  'linux-lts-headers: build the module for the Arch LTS kernel'
  'linux-zen-headers: build the module for the Arch Zen kernel'
  'linux-hardened-headers: build the module for the Arch hardened kernel'
)
provides=('mt7601u-ap')
conflicts=('mt7601u-ap')
replaces=('mt7601u-ap-git')
source=(
  'access-point.patch'
  'Makefile'
  'dkms.conf'
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

_giturl='https://github.com/torvalds/linux.git'
_modpath='drivers/net/wireless/mediatek/mt7601u'
_dkmsname='mt7601u-ap'

prepare() {
  cd "$srcdir"

  rm -rf linux

  git clone --depth 1 --filter=blob:none --sparse "$_giturl" linux

  cd linux
  git sparse-checkout set "$_modpath"

  patch -Np1 -i "$srcdir/access-point.patch"

  cp "$srcdir/Makefile" "$_modpath/Makefile"
}

pkgver() {
  cd "$srcdir/linux"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/linux/$_modpath"

  local dkmsdir="$pkgdir/usr/src/${_dkmsname}-${pkgver}"

  install -d "$dkmsdir"
  cp -a . "$dkmsdir"
  sed "s/@PKGVER@/${pkgver}/" "$srcdir/dkms.conf" > "$dkmsdir/dkms.conf"
}
