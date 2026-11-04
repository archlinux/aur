# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Santiago Burgos <santiago.burgos1089@gmail.com>
pkgname=fingwit
pkgver=1.1.1
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
sha256sums=('f61e1f3c00c1e31f9c04f2432d2a3bab59147d5eb41779c3be4ce1d45fe75a02'
            'c93378f42af280a724960c895b2007dabaa028368d1aba70d0cde6044f475222'
            'e9474f36b50c7f7ab9c4322eac59109bc56a72f42d403db7598deb56e6823846')

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
