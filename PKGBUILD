# Maintainer:
# Contributor: Michał Kopeć <michal@nozomi.space>

## options
: ${_build_debug:=false}

_pkgname="xone"
pkgname="xone-dkms"
pkgver=0.4.12
pkgrel=1
pkgdesc='Modern Linux driver for Xbox One and Xbox Series X|S controllers'
url="https://github.com/dlundqvist/xone"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'dkms'
  'xone-dongle-firmware'
)
makedepends=(
  'git'
)

_pkgsrc="dlundqvist.xone"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('f26a07d48cd4d800d8bd5d44dac631a5a7bc84cca886d587981d7533d0dad7d9')

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
  install -Dm644 "$_pkgsrc/install/modprobe.conf" "$pkgdir/usr/lib/modprobe.d/xone-blacklist.conf"
}
