# Maintainer: Leonid Shutov <leonid.shutov@hey.com>
#
# This is the template CI bumps the pkgver/sha256sums of and pushes to aur.archlinux.org/tuigram
# .git on every release; that AUR repo is the actual source of truth, so this copy can lag behind
# between releases -- see .github/workflows/publish.yml's bump-aur job.
pkgname=tuigram
pkgver=1.4.1
pkgrel=1
pkgdesc="Terminal UI client for Telegram"
arch=('x86_64' 'aarch64')
url="https://github.com/leonid-shutov/tuigram"
license=('MIT')
depends=('nodejs>=26.4.0')
makedepends=('npm')
source=("https://registry.npmjs.org/tuigram/-/tuigram-$pkgver.tgz")
sha256sums=('fe47c67636fa52e00a7d9edffdf68f647fb82933e0dcbd6f434ac74bf354bf33')
noextract=("tuigram-$pkgver.tgz")

package() {
  # better-sqlite3 (@mtcute/node's session storage) unpacks a native addon from its install
  # script, so scripts have to run, and npm's allow-list has to name it -- same reasoning as the
  # Homebrew formula's (leonid-shutov/homebrew-tap) `--allow-scripts=better-sqlite3`. Without it, a
  # strict npm config (strict-allow-scripts) skips the script instead of just warning, there is no
  # better_sqlite3.node, and the client dies on first login.
  npm install --global --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" \
    --allow-scripts=better-sqlite3 --no-fund --no-audit \
    "$srcdir/tuigram-$pkgver.tgz"

  # `--global` installing a tarball (rather than the unpacked source) leaves nothing under
  # $pkgdir referencing the build path -- verified against a real build; there is no
  # package-lock.json or npm cache to strip out afterwards the way some Node PKGBUILDs need to.

  # npm's own bin symlink already lands in $pkgdir/usr/bin/tuigram -- pointed at
  # $pkgdir/usr/lib/node_modules/tuigram/bin/tuigram.js, so no separate `bin.install_symlink`
  # step is needed the way the Homebrew formula needs one.

  install -Dm644 "$pkgdir/usr/lib/node_modules/tuigram/LICENSE" "$pkgdir/usr/share/licenses/tuigram/LICENSE"
}
