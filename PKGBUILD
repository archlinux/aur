# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jozef Riha <jose1711@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=gkrellm
pkgver=2.3.10
pkgrel=3
pkgdesc="System monitor package for GTK2"
arch=('x86_64')
url="http://gkrellm.srcbox.net/"
license=('GPL3')
depends=('gtk2' 'libsm' 'lm_sensors')
makedepends=('gettext')
backup=('etc/gkrellmd.conf')
source=("${url}/releases/${pkgname}-${pkgver}.tar.bz2"
        "fix-critical-warning.patch"
        "gkrellm.service")
sha256sums=('8b9ec8baadcd5830c6aff04ba86dc9ed317a15c1c3787440bd1e680fb2fcd766'
            '05c02428065b8774637db3efe564fb597e3d9d3d9200e004077fbe9a04412e36'
            '2829931127632d0391f6749024809594b78c138fe4f03c98cd65fdbd47cea376')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Avoid calling g_strstr_len with NULL haystack (FS#51413)
  # https://git.srcbox.net/gkrellm/commit/?id=3db76c647a04a603bafae19cc699bd50436d66a2
  patch -Np1 -i ../fix-critical-warning.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make LOCALEDIR=/usr/share/locale
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "server/gkrellmd.conf" "$pkgdir/etc/gkrellmd.conf"
  install -Dm644 "../gkrellm.service" "$pkgdir/usr/lib/systemd/system/gkrellm.service"
}

# vim:set ts=2 sw=2 et:
