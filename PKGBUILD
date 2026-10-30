# Maintainer: dev-bhaskar8 <vaas.ygg@gmail.com>
pkgname=gitside-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='VS Code-inspired source control panel for the terminal'
arch=('x86_64' 'aarch64')
url='https://dev-bhaskar8.github.io/gitside/'
license=('MIT')
depends=('git' 'dbus')
provides=('gitside')
conflicts=('gitside')
source_x86_64=("gitside-${pkgver}-x86_64.tar.xz::https://github.com/dev-bhaskar8/gitside/releases/download/v${pkgver}/gitside-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("gitside-${pkgver}-aarch64.tar.xz::https://github.com/dev-bhaskar8/gitside/releases/download/v${pkgver}/gitside-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('b101146385c6353cbfc5fdc9d93451e2770e5979a5fc9fc5c0a6395683fca117')
sha256sums_aarch64=('a33562afd7a84ed63f279438ef37d839a3c9fc3b3146c6ecf6a549670f84bd5a')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local archive_root="$srcdir/gitside-$target"
  install -Dm755 "$archive_root/gitside" "$pkgdir/usr/bin/gitside"
  install -Dm644 "$archive_root/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  if [ -f "$archive_root/third-party-notices.md" ]; then
    install -Dm644 "$archive_root/third-party-notices.md" "$pkgdir/usr/share/licenses/$pkgname/third-party-notices.md"
  else
    case "$pkgver" in
      0.0.*|0.1.*) ;; # Older releases predate the adapted AI integrations.
      *) printf 'Missing third-party-notices.md in release archive\n' >&2; return 1 ;;
    esac
  fi
  install -Dm644 "$archive_root/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
