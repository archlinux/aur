# Maintainer: Ritwick Verma <verma1997@gmail.com>
#
# The computer side of SudoStamp: `sudo sudostamp setup` pairs with the phone app and adds
# pam_rssh to sudo's PAM stack. Updated per release by scripts/update-aur.sh.
pkgname=sudostamp
pkgver=2.0.0
pkgrel=1
pkgdesc="Approve sudo with your Android phone's fingerprint (computer side: pairing and PAM setup)"
arch=('any')
url="https://gitlab.com/ritwick7/sudostamp"
license=('MIT')
# Not the AUR's pam_rssh: `sudostamp setup` builds its own from a pinned commit with the pinned
# timeouts patch (tools/install.sh, install_pam_rssh), and installs what that build needs itself.
depends=('bash' 'python' 'openssh')
optdepends=("fprintd: try this computer's own fingerprint reader first when at the desk"
            "python-cryptography: sudostamp input (secrets typed on the phone)")
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('7dcfec202f95d2b439dd371c9b96dfb467c48a04f22243896209e3135fd43518')

package() {
  # GitLab names the archive's top directory <project>-<tag>-<commit>.
  cd "$srcdir"/"$pkgname"-v"$pkgver"*/
  local f
  for f in install.sh pair.py attest.py pam_check.py sudostamp-is-local.sh sudostamp-probe.sh sudostamp-run.sh ask.py secret.py; do
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
