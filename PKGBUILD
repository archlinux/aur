# Maintainer: Ritwick Verma <verma1997@gmail.com>
#
# The computer side of SudoStamp: `sudo sudostamp setup` pairs with the phone app and adds
# pam_rssh to sudo's PAM stack. Updated per release by scripts/update-aur.sh.
pkgname=sudostamp
pkgver=1.5.0
pkgrel=1
pkgdesc="Approve sudo with your Android phone's fingerprint (computer side: pairing and PAM setup)"
arch=('any')
url="https://gitlab.com/ritwick7/sudostamp"
license=('MIT')
depends=('bash' 'python' 'openssh' 'pam_rssh')
optdepends=("fprintd: try this computer's own fingerprint reader first when at the desk")
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('45fc96af5e3b001062201a7ab2b5e298bd5b1a00290b020994d5f3f5a9b1529c')

package() {
  # GitLab names the archive's top directory <project>-<tag>-<commit>.
  cd "$srcdir"/"$pkgname"-v"$pkgver"*/
  local f
  for f in install.sh pair.py attest.py pam_check.py sudostamp-is-local.sh sudostamp-probe.sh; do
    install -Dm755 "tools/$f" "$pkgdir/usr/lib/$pkgname/$f"
  done
  # Where install.sh looks for it (patches/ beside itself): the pinned pam_rssh timeouts.
  install -Dm644 tools/patches/pam_rssh-timeouts.patch "$pkgdir/usr/lib/$pkgname/patches/pam_rssh-timeouts.patch"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'SH'
#!/bin/sh
SUDOSTAMP_PROG=sudostamp exec /usr/lib/sudostamp/install.sh "$@"
SH
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
