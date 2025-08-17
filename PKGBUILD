# Maintainer:

: ${_commit=}

_pkgname="rr1800a"
pkgname="$_pkgname-dkms-git"
pkgver=0.0.1.r1.g3dd4b3c
pkgrel=1
pkgdesc="Kernel module for Rotor Riot 1800A gamepad (3053:0709)"
url="https://github.com/ForkingField/rr1800a"
license=('GPL-2.0-only')
arch=('x86_64')

depends=(
  'dkms'
)
makedepends=(
  'git'
  'libdrm'
)

provides=("$_pkgname-dkms")
conflicts=("$_pkgname-dkms")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git${commit:+#commit=$_commit}")
sha256sums=('SKIP')

prepare() {
  sed -e 's&@VERSION@&'"${pkgver}&" -i "$_pkgsrc/dkms/dkms.conf"
}

pkgver() (
  set -o pipefail
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' 2> /dev/null \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
)

package() {
  # module for dkms
  mkdir -pm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -a "$_pkgsrc/dkms"/* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
