# Maintainer:
# Contributor: Michał Kopeć <michal@nozomi.space>

: ${_commit:=29ec3577e52a50f876440c81267f609575c5161e} # 0.3.r57

_pkgname="xone"
pkgname="xone-dkms"
pkgver=0.3
pkgrel=6
pkgdesc='Modern Linux driver for Xbox One and Xbox Series X|S controllers'
url='https://github.com/medusalix/xone'
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

_pkgsrc="medusalix.xone"
source=(
  "$_pkgsrc"::"git+$url.git#commit=$_commit"
  '0001-pr53-fix-for-linux-6.12.patch'
)
sha256sums=(
  '25a9eedf07088160b325794ee996dc6ccf1d5b9066e577920313097777182ab3'
  '6b3a637879e9ae63d6b812088891f466308dd342338fc72b73159006c0818c0d'
)

prepare() {
  cd "$_pkgsrc"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
      echo
    fi
  done
}

package() {
  # set module version
  find "$_pkgsrc" -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +

  # enable debug
  #echo 'ccflags-y += -DDEBUG' >> "Kbuild"

  # copy module to /usr/src
  install -dm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp --reflink=auto -a "$_pkgsrc"/* "$pkgdir/usr/src/$_pkgname-$pkgver/"

  # blacklist xpad module
  install -D -m 644 "$_pkgsrc/install/modprobe.conf" "$pkgdir/usr/lib/modprobe.d/xone-blacklist.conf"
}
