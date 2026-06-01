# Maintainer: Olivier Magnier <tarpediem@gmail.com>
pkgname=zenvision-linux-git
_pkgname=zenvision-linux
pkgver=r0.g0000000
pkgrel=1
pkgdesc="Userspace driver + reverse-engineered protocol for the ASUS ZenVision lid OLED (git/main)"
arch=('any')
url="https://github.com/tarpediem/zenvision-linux"
license=('MIT')
depends=('python' 'python-pyusb' 'python-pillow')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"
  # the CLI script as /usr/bin/zenvision
  install -Dm755 zenvision.py "$pkgdir/usr/bin/zenvision"

  # udev rule, installed corrected (uaccess, 70- prefix) under a distinct name
  # so it never clashes with zenvision-studio's own rule
  install -dm755 "$pkgdir/usr/lib/udev/rules.d"
  printf '%s\n' \
    '# ASUS ZenVision lid OLED (Nuvoton M480) — grant the active local user access.' \
    '# 70- so TAG+="uaccess" is set before 73-seat-late.rules runs the uaccess builtin.' \
    'SUBSYSTEM=="usb", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="8835", TAG+="uaccess"' \
    > "$pkgdir/usr/lib/udev/rules.d/70-zenvision-linux.rules"

  install -Dm644 PROTOCOL.md "$pkgdir/usr/share/doc/$_pkgname/PROTOCOL.md"
  install -Dm644 README.md   "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
