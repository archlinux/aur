pkgname=resolve-aacfix-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Transactional AAC decode support and automatic reapply for DaVinci Resolve Studio on Linux'
arch=('x86_64')
url='https://github.com/Irfrit/resolve-aacfix'
license=('MIT')
depends=('python' 'polkit' 'util-linux')
optdepends=('davinci-resolve-studio: DaVinci Resolve Studio installation to patch')
conflicts=('davinci-resolve-studio-aacfix')
source=("https://github.com/Irfrit/resolve-aacfix/releases/download/v${pkgver}/resolve-aacfix-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('450b197e9da3e89ca92efbc463cc5d14f23013c7d4b239aad9b88425bd963c7d')
options=('!strip')

package() {
  local archive="$srcdir/resolve-aacfix-v${pkgver}-linux-x86_64.tar.gz"
  local payload="$srcdir/resolve-aacfix-v${pkgver}-linux-x86_64"

  tar -xzf "$archive" -C "$srcdir"
  install -d "$pkgdir/usr/lib/resolve-aacfix"
  cp -a "$payload/aacpatch" "$pkgdir/usr/lib/resolve-aacfix/"
  cp -a "$payload/vendor" "$pkgdir/usr/lib/resolve-aacfix/"
  cp -a "$payload/prebuilt" "$pkgdir/usr/lib/resolve-aacfix/"
  install -Dm755 "$payload/aac-fix" "$pkgdir/usr/lib/resolve-aacfix/aac-fix"
  install -Dm755 "$payload/aac-patch-tree" "$pkgdir/usr/lib/resolve-aacfix/aac-patch-tree"
  install -Dm755 "$payload/aac-fix-reapply" "$pkgdir/usr/lib/resolve-aacfix/aac-fix-reapply"
  install -Dm644 "$payload/SHA256SUMS" "$pkgdir/usr/lib/resolve-aacfix/SHA256SUMS"
  install -Dm644 "$payload/systemd/resolve-aacfix-reapply.service" "$pkgdir/usr/lib/systemd/system/resolve-aacfix-reapply.service"
  install -Dm644 "$payload/systemd/resolve-aacfix-reapply.path" "$pkgdir/usr/lib/systemd/system/resolve-aacfix-reapply.path"
  install -Dm644 "$payload/tmpfiles.d/resolve-aacfix.conf" "$pkgdir/usr/lib/tmpfiles.d/resolve-aacfix.conf"
  install -Dm644 "$payload/polkit/50-resolve-aacfix.policy" "$pkgdir/usr/share/polkit-1/actions/50-resolve-aacfix.policy"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/resolve-aacfix/aac-fix "$pkgdir/usr/bin/aac-fix"
}
