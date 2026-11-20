# Maintainer: Tomáš Karela Procházka <tomas.prochazka5d@gmail.com>

pkgname=tiny-engineer-git
_pkgname=tiny-engineer
_subdir=packages/tiny-engineer-cli
pkgver=0.4.1.r15.gb43d46d
pkgrel=1
pkgdesc='CLI for the Tiny Engineer desk robot: IDE hooks, animations and audio over HTTP or USB serial (git)'
arch=('x86_64' 'aarch64')
url='https://github.com/jamro/tiny-engineer'
license=('MIT')
# glibc, libgcc and libstdc++ are linked by serialport's native addon.
depends=('nodejs>=18' 'glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'jq' 'npm')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
options=(!strip !debug)

source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

# The repo is a monorepo (firmware, web, CAD, hardware). Count only commits
# touching what `npm pack` ships, so pushes elsewhere leave pkgver unchanged
# and AUR helpers do not offer an identical rebuild.
_paths=(bin src package.json)

pkgver() {
  cd "$_pkgname/$_subdir"
  # Upstream tags only firmware releases, and sporadically, so git describe
  # is useless; the npm version lives in package.json.
  printf '%s.r%s.g%s' \
    "$(jq -r .version package.json)" \
    "$(git rev-list --count HEAD -- "${_paths[@]}")" \
    "$(git log -1 --format=%h -- "${_paths[@]}")"
}

build() {
  cd "$_pkgname/$_subdir"
  rm -f "$srcdir/$_pkgname"-*.tgz
  # No prepack/prepare scripts upstream; this only tars the `files` whitelist.
  npm pack --pack-destination "$srcdir" --cache "$srcdir/npm-cache"
}

package() {
  local _tgz=("$srcdir/$_pkgname"-*.tgz)

  # See tiny-engineer: the only install script is node-gyp-build, which is
  # redundant with the shipped prebuild.
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    --ignore-scripts \
    --no-audit --no-fund \
    "${_tgz[0]}"

  # npm leaves group-writable directories behind.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Keep only the glibc serialport prebuild for this architecture.
  local _pb="$pkgdir/usr/lib/node_modules/$_pkgname/node_modules/@serialport/bindings-cpp/prebuilds"
  local _keep
  case $CARCH in
    x86_64) _keep=linux-x64 ;;
    aarch64) _keep=linux-arm64 ;;
  esac
  find "$_pb" -mindepth 1 -maxdepth 1 ! -name "$_keep" -exec rm -r {} +
  rm "$_pb/$_keep"/*musl*
  compgen -G "$_pb/$_keep/*glibc.node" >/dev/null

  install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
