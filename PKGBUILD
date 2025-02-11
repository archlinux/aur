# Maintainer:
# Contributor: Michał Kopeć <michal@nozomi.space>

: ${_commit:=29ec3577e52a50f876440c81267f609575c5161e} # 0.3.r57

_pkgname="xone"
pkgname="xone-dkms"
pkgver=0.3
pkgrel=5
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

_source_main() {
  _pkgsrc="medusalix.xone"
  source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
  sha256sums=('SKIP')
}

_source_patch() {
  source+=("0001-PR53-fix-for-linux-6.12.patch"::"https://github.com/medusalix/xone/pull/53.diff")
  sha256sums+=('2f700ff6b187efc2cdd5dd47c373cabf5085c7551b6f0466bcc6b0dc68c65e11')
}

_source_main
_source_patch

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
