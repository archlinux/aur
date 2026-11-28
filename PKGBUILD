pkgname=elanfp-git
_name=elanfp
pkgver=r1.d6517ee
pkgrel=1
pkgdesc='Fingerprint login for the ELAN 04f3:0903 reader (ASUS ZenBook UM431/UX431), served through fprintd'
arch=('any')
url='https://gitlab.com/juxuanu/elanfp'
license=('GPL-3.0-or-later')
# fprintd provides what stays in use: pam_fprintd, the D-Bus and polkit
# policies, the service unit this package redirects.
depends=(
  'fprintd'
  'libusb'
  'python'
  'python-gobject'
  'python-numpy'
  'python-opencv'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=elanfp.install
source=("$_name::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

check() {
  cd "$_name"
  # The tests that replay recorded fingerprints skip themselves: the
  # recordings are not in the repository.
  python -W ignore -m unittest discover -s tests
}

package() {
  cd "$_name"
  # Outside site-packages on purpose: a Python upgrade must not break logins.
  install -d "$pkgdir/usr/lib/elanfp/elanfp"
  install -m0644 -t "$pkgdir/usr/lib/elanfp/elanfp/" elanfp/*.py
  python -m compileall -q -s "$pkgdir" "$pkgdir/usr/lib/elanfp/elanfp"
  install -Dm0755 -t "$pkgdir/usr/lib/elanfp/" dist/launch
  install -Dm0644 dist/fprintd-elanfp.conf "$pkgdir/usr/lib/systemd/system/fprintd.service.d/elanfp.conf"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
