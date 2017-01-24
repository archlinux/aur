# Maintainer: archlinux.info:tdy

pkgname=muttator-git
pkgver=r5195.1114a563
pkgrel=1
pkgdesc="Make Thunderbird look and behave like Vim"
arch=(any)
url=http://www.vimperator.org/muttator
license=(MIT)
depends=("thunderbird>=38.0")
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://github.com/vimperator/vimperator-labs.git)
sha256sums=(SKIP)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname/${pkgname%-git}
  make xpi
}

package() {
  cd $pkgname/${pkgname%-git}

  # install
  local _pkgver=$(<Makefile awk -F= '/^VERSION/ {printf "%.1f", $2}')
  bsdtar -xf ../downloads/${pkgname%-git}-$_pkgver.xpi -C "$pkgdir" \
    -s ":^:usr/lib/thunderbird/extensions/muttator@mozdev.org/:"

  # sanitize
  find "$pkgdir" -exec sh -c \
    "file '{}' | grep -qE 'ELF|executable|directory' && chmod 755 '{}' || chmod 644 '{}'" \;
  chown -R root:root "$pkgdir"

  # license
  install ../License.txt -m644 -Dt"$pkgdir"/usr/share/licenses/$pkgname/
}
