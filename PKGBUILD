pkgbase=elanfp-git
pkgname=('elanfp-git' 'elanfp-pam-git')
_name=elanfp
pkgver=r3.469df61
pkgrel=1
pkgdesc='Fingerprint login for the ELAN 04f3:0903 reader (ASUS ZenBook UM431/UX431), served through fprintd'
arch=('any')
url='https://gitlab.com/juxuanu/elanfp'
license=('GPL-3.0-or-later')
makedepends=('git')
# For the tests.
checkdepends=('python-gobject' 'python-numpy' 'python-opencv')
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

package_elanfp-git() {
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
  optdepends=('elanfp-pam-git: fingerprint for sudo and graphical password prompts')
  provides=('elanfp')
  conflicts=('elanfp')
  install=elanfp.install

  cd "$_name"
  # Outside site-packages on purpose: a Python upgrade must not break logins.
  install -d "$pkgdir/usr/lib/elanfp/elanfp"
  install -m0644 -t "$pkgdir/usr/lib/elanfp/elanfp/" elanfp/*.py
  python -m compileall -q -s "$pkgdir" "$pkgdir/usr/lib/elanfp/elanfp"
  install -Dm0755 -t "$pkgdir/usr/lib/elanfp/" dist/launch
  install -Dm0644 dist/fprintd-elanfp.conf "$pkgdir/usr/lib/systemd/system/fprintd.service.d/elanfp.conf"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_elanfp-pam-git() {
  pkgdesc='Fingerprint before password for sudo and graphical password prompts (PAM configuration for fprintd)'
  depends=('fprintd' 'polkit' 'sudo')
  provides=('elanfp-pam')
  conflicts=('elanfp-pam')
  backup=('etc/pam.d/sudo-elanfp' 'etc/pam.d/polkit-1' 'etc/sudoers.d/50-elanfp')

  cd "$_name"
  # Nothing here replaces a file of sudo or polkit: sudo is given another
  # PAM service name, and /etc/pam.d/polkit-1 takes precedence over polkit's
  # own file in /usr/lib/pam.d.
  install -Dm0644 -t "$pkgdir/etc/pam.d/" dist/pam/sudo-elanfp dist/pam/polkit-1
  install -dm0750 "$pkgdir/etc/sudoers.d"
  install -m0440 dist/pam/sudoers-elanfp "$pkgdir/etc/sudoers.d/50-elanfp"
}
