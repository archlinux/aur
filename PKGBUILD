# Maintainer:

_pkgname="discimagecreator"
pkgname="$_pkgname-git"
pkgver=2023.09.09.r12.g6d3b62c
pkgrel=1
pkgdesc="This is the disc (CD, GD, DVD, HD-DVD, BD, GC/Wii, XBOX, XBOX 360) and disk (Floppy, MO, USB, etc) image creation tool"
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache')
arch=('x86_64')

makedepends=('git')

provides=("$_pkgname=$(echo ${pkgver%%.r*} | sed -E 's@\.@@g')")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _pkgver=$(
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
      | sed -E \
        -e 's/^v//' \
        -e 's/([^-]*-g)/r\1/' \
        -e 's/^([0-9]{4})([0-9]{2})([0-9]{2})/\1.\2.\3/' \
        -e 's/-/./g'
  )

  echo "${_pkgver:?}"
}

build() {
  cd "$_pkgsrc"
  make -C DiscImageCreator/
}

package() {
  cd "$_pkgsrc"

  # commands in makefile are wrong
  #make -C DiscImageCreator/ DESTDIR="$pkgdir" PREFIX="/usr" install

  install -Dm644 Release_ANSI/default.dat -t "${pkgdir}/usr/share/DiscImageCreator/"
  install -Dm644 Release_ANSI/driveOffset.txt -t "${pkgdir}/usr/share/DiscImageCreator/"
  install -Dm755 DiscImageCreator/DiscImageCreator -t "${pkgdir}/usr/bin/"
  ln -s "DiscImageCreator" "${pkgdir}/usr/bin/$_pkgname"

  # license
  install -Dm644 "LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}
