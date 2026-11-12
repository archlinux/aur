# Maintainer: Ritwick Verma <verma1997@gmail.com>
#
# The computer side of SudoStamp: `sudo sudostamp setup` pairs with the phone app and adds
# pam_rssh to sudo's PAM stack. Updated per release by scripts/update-aur.sh.
pkgname=sudostamp
pkgver=1.4.0
pkgrel=1
pkgdesc="Approve sudo with your Android phone's fingerprint (computer side: pairing and PAM setup)"
arch=('any')
url="https://gitlab.com/ritwick7/sudostamp"
license=('MIT')
depends=('bash' 'python' 'openssh' 'pam_rssh')
optdepends=("fprintd: try this computer's own fingerprint reader first when at the desk")
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('cc81c01389a29c0f7a5e1e9dabaa15e7484b74995657a8903e7dbabe4edda1d8')

package() {
  # GitLab names the archive's top directory <project>-<tag>-<commit>.
  cd "$srcdir"/"$pkgname"-v"$pkgver"*/
  local f
  for f in install.sh pair.py pam_check.py sudostamp-is-local.sh sudostamp-probe.sh; do
    install -Dm755 "tools/$f" "$pkgdir/usr/lib/$pkgname/$f"
  done
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'SH'
#!/bin/sh
SUDOSTAMP_PROG=sudostamp exec /usr/lib/sudostamp/install.sh "$@"
SH
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
