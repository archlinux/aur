# Maintainer: you
pkgname=mt7601u-ap-git
pkgver=r1.1bfaee9
pkgrel=1
pkgdesc='mt7601u Wi-Fi kernel module patched to expose AP mode'
arch=('x86_64')
url='https://github.com/torvalds/linux/tree/master/drivers/net/wireless/mediatek/mt7601u'
license=('GPL-2.0-only')

depends=()
makedepends=('git' 'patch')

install='mt7601u-ap.install'

source=(
  'access-point.patch'
  'Makefile'
)

sha256sums=(
  'SKIP'
  'SKIP'
)

_giturl='https://github.com/torvalds/linux.git'
_modpath='drivers/net/wireless/mediatek/mt7601u'

# Uses the currently running kernel by default.
# Override manually:
#   KERNVER='6.x.x-zen1-1-zen' makepkg -si
_kernver="${KERNVER:-$(uname -r)}"
_kbuild="/usr/lib/modules/${_kernver}/build"

prepare() {
  cd "$srcdir"

  if [[ ! -d "$_kbuild" ]]; then
    echo "ERROR: kernel build directory not found:"
    echo "  $_kbuild"
    echo
    echo "Install headers for your current kernel."
    echo "Examples:"
    echo "  sudo pacman -S linux-headers"
    echo "  sudo pacman -S linux-zen-headers"
    echo "  sudo pacman -S linux-lts-headers"
    echo "  sudo pacman -S linux-hardened-headers"
    exit 1
  fi

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

build() {
  cd "$srcdir/linux/$_modpath"

  make -C "$_kbuild" M="$PWD" modules
}

package() {
  cd "$srcdir/linux/$_modpath"

  install -Dm644 mt7601u.ko \
    "$pkgdir/usr/lib/modules/${_kernver}/updates/mt7601u.ko"

  find "$pkgdir/usr/lib/modules/${_kernver}" \
    -name '*.ko' \
    -exec strip --strip-debug {} +

  echo "$_kernver" > "$pkgdir/usr/lib/modules/${_kernver}/updates/mt7601u-ap.kernver"
}
