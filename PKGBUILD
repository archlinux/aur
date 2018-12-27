# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=boot_check-git
_pkgname=boot_check
pkgver=r35.c934079
pkgrel=1
pkgdesc="Python Script Written To Detect Evil Maid Attacks"
arch=('any')
url="https://github.com/JusticeRage/freedomfighting/blob/master/boot_check.py"
license=('GPLv3')
depends=('python')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=boot_check.install
source=("${_pkgname}::git+https://github.com/JusticeRage/freedomfighting.git")
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$srcdir/${_pkgname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$srcdir/${_pkgname}"

  # Edit Configurations reflecting systemwide install
  sed -i s:/root/boot_check.py:/usr/bin/boot_check.py:g boot_check.service
  sed -i s:"/root/.boot_check":"/var/lib/boot_check/values":g boot_check.py
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm644 boot_check.service "${pkgdir}/usr/lib/systemd/system/boot_check.service"
  install -Dm755 boot_check.py "${pkgdir}/usr/bin/boot_check.py"
  install -dm755 "${pkgdir}/var/lib/boot_check/"
  touch "${pkgdir}/var/lib/boot_check/empty.txt"
}
