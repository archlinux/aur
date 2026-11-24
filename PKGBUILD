# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Santiago Burgos <santiago.burgos1089@gmail.com>
pkgname=fingwit
pkgver=1.1.3
pkgrel=1
pkgdesc="Fingerprint Configuration Tool"
url="https://github.com/xapp-project/fingwit"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
  'audit'
  'fprintd'
  'gtk3'
  'libfprint'
  'pam'
  'python'
  'python-gobject'
  'python-pam'
  'python-setproctitle'
  'xapp'
  'xapp-symbolic-icons'
)
makedepends=('meson')
checkdepends=('desktop-file-utils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'license.patch'
        'fingwit_pam.conf')
sha256sums=('1df9f9f82a95edc50934f6b06c17e1a66bc80f57f02f3ba0930e9a4a98ae7bf2'
            'c93378f42af280a724960c895b2007dabaa028368d1aba70d0cde6044f475222'
            'a5df2e143c32f1a92d4f56e26f630165340ef988fcedae73f380987d4dc3d0ab')

prepare() {
  cd "$pkgname-$pkgver"

  # Set license type in About dialog
  # https://github.com/linuxmint/hypnotix/pull/406
  patch -Np1 -i ../license.patch

  # Read /etc/pam.d/fingwit instead of /etc/pam.d/common-auth
  sed -i "s/common-auth/$pkgname/g" "$pkgname"
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  desktop-file-validate "build/data/$pkgname.desktop"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  # Based on what pam-auth-update on Linux Mint writes to /etc/pam.d/common-auth
  # using values from /usr/share/pam-configs/fingwit
  install -Dm644 "$srcdir/fingwit_pam.conf" "$pkgdir/etc/pam.d/$pkgname"
}
