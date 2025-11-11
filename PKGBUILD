# Maintainer:
# Contributor: Michał Kopeć <michal@nozomi.space>

## options
: ${_build_debug:=false}

_pkgname="xone"
pkgname="xone-dkms"
pkgver=0.4.11
pkgrel=1
pkgdesc='Modern Linux driver for Xbox One and Xbox Series X|S controllers'
url="https://github.com/dlundqvist/xone"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'dkms'
)
makedepends=(
  'git'
)
optdepends=(
  'xone-dongle-firmware: for wireless controllers'
)

_pkgsrc="dlundqvist.xone"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('3d89e9ef780c4f2381c1c24ee1df0ed92c52898f53ec98dc2e6a2b768b3934be')

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
