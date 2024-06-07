# Maintainer:

_pkgname="discimagecreator"
pkgname="$_pkgname-git"
pkgver=2024.06.01.r0.g5f84df1
pkgrel=1
pkgdesc="A disk image creation tool supporting CD, GD, DVD, BD, GC/Wii, Xbox, floppy, MO, USB, etc"
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache-2.0')
arch=('x86_64')

depends=(
  gcc-libs
  glibc
)
makedepends=('git')
optdepends=(
  'unscrambler: Unscramble GC/Wii optical disks'
)

provides=("$_pkgname=$(echo ${pkgver%%.r*} | sed -E 's@\.@@g')")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E \
      -e 's/^v//' \
      -e 's/([^-]*-g)/r\1/' \
      -e 's/^([0-9]{4})([0-9]{2})([0-9]{2})/\1.\2.\3/' \
      -e 's/-/./g'
}

build() {
  cd "$_pkgsrc"
  make -C DiscImageCreator/
}

package() {
  cd "$_pkgsrc"

  make -C DiscImageCreator/ DESTDIR="$pkgdir" PREFIX="/usr" install

  # license
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
