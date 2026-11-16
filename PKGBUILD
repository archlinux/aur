# Maintainer: i am piou <i.am.piou@gmail.com>
#
# Upstream ships no tagged releases (the README advertises v1.0.0, but there
# is no tag and no GitHub release asset), so this is the VCS package.
# The theme directory relies on relative symlinks (the @2x trees point at
# their unscaled counterparts) and must be copied with links preserved.

pkgname=liquid-glass-icons-git
pkgver=r5.da884fb
pkgrel=1
pkgdesc='macOS Liquid Glass dark icon theme with Tahoe folders and dark status panel'
arch=('any')
url='https://github.com/Yhorx/Liquid-Glass-Icons'
license=('GPL-3.0-only')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
optdepends=('mactahoe-icon-theme-git: MacTahoe-dark fallback for icons this theme does not cover')
makedepends=('git')
source=("$pkgname::git+https://github.com/Yhorx/Liquid-Glass-Icons.git")
sha256sums=('SKIP')
options=(!strip !debug)

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  # -d keeps the ~11k relative symlinks intact; --no-preserve=mode normalises
  # upstream's permissions to 644/755.
  install -dm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=mode,ownership -- Liquid-Glass-Dark "$pkgdir/usr/share/icons/"

  # Upstream docs and the duplicated GPL copies are not needed at runtime;
  # the licence is installed to /usr/share/licenses/ below.
  rm -f "$pkgdir"/usr/share/icons/Liquid-Glass-Dark/{README.md,AUTHORS,COPYING,LICENSE}
  rm -f "$pkgdir"/usr/share/icons/Liquid-Glass-Dark/icon-theme.cache

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
