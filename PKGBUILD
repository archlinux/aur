# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Builds technitium-console from git: a static admin console for Technitium
# DNS Server. The server serves these files as-is; this package only lays
# them down and tells you how to point the server at them.
pkgname=technitium-console-git
pkgver=1.4.0.r1.g27dd0bf
pkgrel=1
pkgdesc="Modern admin console for Technitium DNS Server (built from git)"
arch=('any')
url="https://github.com/byGarcia/technitium-console"
license=('GPL-3.0-or-later')
# install.sh ships as a doc/helper and the .install message runs under sh;
# bash (base) satisfies both, declared so namcap stays quiet.
depends=('bash')
provides=('technitium-console')
conflicts=('technitium-console' 'technitium-console-bin')
makedepends=('git' 'nodejs' 'npm')
install=technitium-console.install
source=("git+https://github.com/byGarcia/technitium-console.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/technitium-console"
  # Closest tag plus commit distance, Arch-style. Falls back to package.json.
  if ver="$(git describe --long --tags 2>/dev/null)"; then
    printf '%s' "$ver" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    node -p "require('./package.json').version + '.r' + require('child_process').execSync('git rev-list --count HEAD').toString().trim() + '.g' + require('child_process').execSync('git rev-parse --short HEAD').toString().trim()"
  fi
}

build() {
  cd "$srcdir/technitium-console"
  npm ci
  npm run build
}

check() {
  cd "$srcdir/technitium-console"
  npm run typecheck
  npm run lint
  npm test
}

package() {
  install -d "$pkgdir/usr/share/technitium-console"
  # The release tarball packs dist/ flat; the git build reproduces that here.
  cp -a "$srcdir/technitium-console/dist/." "$pkgdir/usr/share/technitium-console/"
  chmod -R a+rX "$pkgdir/usr/share/technitium-console"

  install -Dm644 "$srcdir/technitium-console/install.sh" "$pkgdir/usr/share/doc/technitium-console/install.sh"
  chmod 0644 "$pkgdir/usr/share/doc/technitium-console/install.sh"
  install -Dm644 "$srcdir/technitium-console/LICENSE" "$pkgdir/usr/share/licenses/technitium-console/LICENSE"
}
