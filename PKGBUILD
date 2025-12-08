# Maintainer: xiota
# Contributor: Michał Kopeć <michal (at) nozomi.space>
# Contributor: Tomasz Pakuła <tomasz.pakula.oficjalny (at) gmail.com>

## options
: ${_build_debug:=false}

_pkgname="xone"
pkgname="xone-dkms"
pkgver=0.5.0
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
sha256sums=('ace071b54e9573430df6accbb7dc92e209e875b9b8126fbba0cfcb39f03ac2ca')

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
