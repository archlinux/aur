# Maintainer: gaou-piou <i.am.piou@gmail.com>

pkgname=chromium-extension-locals-git
_pkgname=locals
pkgver=r0.0000000
pkgrel=1
pkgdesc='Chromium (MV3) extension that serves popular JS libraries, styles and fonts from a local copy instead of CDNs; learns from usage. Loaded unpacked'
arch=('any')
url='https://github.com/gaou-piou/locals'
# MPL-2.0 for the extension; the bundled libraries are MIT, and the font packages
# carry CC-BY-4.0 / OFL-1.1 (the licence text of each ships in libs/<name>/<version>/LICENSE).
license=('MPL-2.0' 'MIT' 'CC-BY-4.0' 'OFL-1.1')
depends=('nodejs')
makedepends=('git' 'nodejs>=24' 'pnpm')
provides=("chromium-extension-$_pkgname")
conflicts=("chromium-extension-$_pkgname")
install=locals.install
# The libraries are downloaded from the npm registry while building and checked against the sha256
# recorded in libraries.json; build() therefore needs network access.
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

_buildenv() {
  export HOME="$srcdir/.home"
  export XDG_CACHE_HOME="$srcdir/.cache"
  export npm_config_cache="$srcdir/.cache/npm"
  export CI=1
}

prepare() {
  cd "$_pkgname"
  _buildenv
  pnpm install --frozen-lockfile
}

build() {
  cd "$_pkgname"
  _buildenv
  pnpm build:libs
  pnpm build
  pnpm size
}

check() {
  cd "$_pkgname"
  _buildenv
  pnpm test
}

package() {
  cd "$_pkgname"
  install -d "$pkgdir/usr/share/$_pkgname"
  cp -r dist/. "$pkgdir/usr/share/$_pkgname/"
  # Chromium writes _metadata/ into every unpacked extension it loads
  rm -rf "$pkgdir/usr/share/$_pkgname/_metadata"
  find "$pkgdir/usr/share/$_pkgname" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/$_pkgname" -type f -exec chmod 644 {} +
  install -Dm755 packaging/aur/locals-install "$pkgdir/usr/bin/locals-install"
  install -Dm755 packaging/aur/locals-learn.cjs "$pkgdir/usr/bin/locals-learn"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # licence texts of the bundled libraries, one file per library version
  local lic
  for lic in dist/libs/*/*/LICENSE; do
    install -Dm644 "$lic" "$pkgdir/usr/share/licenses/$pkgname/libs/$(basename "$(dirname "$(dirname "$lic")")")-$(basename "$(dirname "$lic")")-LICENSE"
  done
}
