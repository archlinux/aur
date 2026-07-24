# Maintainer: Nowaker <spam@nowaker.net>
# Contributor: Axel Navarro <navarroaxel gmail>

pkgname=meridian-git
pkgver=1.56.1.r3.gf0c885c
pkgrel=1
pkgdesc="Use your Claude Max subscription with OpenCode, OpenClaw, Pi, Droid, Aider, Crush, Cline."
arch=(any)
url="https://github.com/rynfar/meridian"
license=(MIT)
depends=(nodejs)
makedepends=(bun git)
provides=(meridian)
conflicts=(meridian)
install=meridian-git.install
source=(meridian::git+https://github.com/rynfar/meridian.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/meridian"

  git describe --long --tags --match 'meridian-v*' \
    | sed -E 's/^meridian-v//; s/-/.r/; s/-/./g'
}

build() {
  cd "$srcdir/meridian"

  bun install
  bun run build
  find dist -type f -name '*.js' -exec \
    sed -i "s#${srcdir}/meridian/node_modules/libsql#/usr/lib/meridian/node_modules/libsql#g" {} +
}

package() {
  cd "$srcdir/meridian"

  install -dm755 "${pkgdir}/usr/lib/meridian"
  cp -a dist plugin node_modules package.json "${pkgdir}/usr/lib/meridian/"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/meridian/dist/cli.js" "$pkgdir/usr/bin/meridian"
}
