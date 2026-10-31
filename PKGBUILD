# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: xiota
# Contributor: Michał Kopeć <michal (at) nozomi.space>
# Contributor: Tomasz Pakuła <tomasz.pakula.oficjalny (at) gmail.com>

## options
: "${_build_debug:=false}"

_pkgname="xone"
pkgname="xone-dkms-trigger-rumble-hack"
pkgver=0.5.8
pkgrel=1
pkgdesc='Modern Linux driver for Xbox One and Xbox Series X|S controllers (with trigger rumble hack)'
url="https://github.com/detiam/xone"
license=('GPL-2.0-or-later')
arch=('any')

depends=(
  'dkms'
  'xone-dongle-firmware'
)
makedepends=(
  'git'
)

provides=("$_pkgname-dkms")
conflicts=("$_pkgname-dkms")
_pkgsrc="dlundqvist.xone"
source=("$_pkgsrc::git+$url.git#commit=1d89d27e8d105d23fa7d051784d8972084945474")
sha256sums=('029248eefe1020d300b6b117bbdd48e1382f89b4a161607362a3f49c5a174366')

package() {
  # set module version
  find "$_pkgsrc" -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +

  if [[ "${_build_debug::1}" == "t" ]]; then
    echo 'ccflags-y += -DDEBUG' >> "$_pkgsrc/Kbuild"
  fi

  # copy module to /usr/src
  mkdir -pm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -a "$_pkgsrc"/* "$pkgdir/usr/src/$_pkgname-$pkgver/"

  # blacklist xpad module
  install -Dm644 "$_pkgsrc/install/modprobe.conf" "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"

  # enable trigger rumble hack default
  echo "options xone_gip_gamepad trigger_rumble_mode=3" >> "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}
