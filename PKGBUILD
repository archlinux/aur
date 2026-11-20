# Maintainer: Tomáš Karela Procházka <tomas.prochazka5d@gmail.com>

pkgname=tiny-engineer
pkgver=0.4.1
pkgrel=1
pkgdesc='CLI for the Tiny Engineer desk robot: IDE hooks, animations and audio over HTTP or USB serial'
arch=('x86_64' 'aarch64')
url='https://github.com/jamro/tiny-engineer'
license=('MIT')
# glibc, libgcc and libstdc++ are linked by serialport's native addon.
depends=('nodejs>=18' 'glibc' 'libgcc' 'libstdc++')
makedepends=('npm')
conflicts=("$pkgname-git")
options=(!strip !debug)

source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('42f5e041c7af0249f242d972a2d6ff6458a3bdd7577c934ec4c9edcb66bcb740')

package() {
  # The only install script in the tree is @serialport/bindings-cpp's
  # `node-gyp-build`, which merely checks for a matching prebuild and would
  # fall back to compiling. The prebuild is shipped, and node-gyp-build picks
  # it at runtime, so skipping scripts loses nothing.
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    --ignore-scripts \
    --no-audit --no-fund \
    "$srcdir/$pkgname-$pkgver.tgz"

  # npm leaves group-writable directories behind.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # serialport ships N-API prebuilds for darwin, win32, android, musl and
  # every ARM flavour. Keep only the glibc build for this architecture; the
  # rest are dead weight and foreign ELF/Mach-O/PE files.
  local _pb="$pkgdir/usr/lib/node_modules/$pkgname/node_modules/@serialport/bindings-cpp/prebuilds"
  local _keep
  case $CARCH in
    x86_64) _keep=linux-x64 ;;
    aarch64) _keep=linux-arm64 ;;
  esac
  find "$_pb" -mindepth 1 -maxdepth 1 ! -name "$_keep" -exec rm -r {} +
  rm "$_pb/$_keep"/*musl*
  compgen -G "$_pb/$_keep/*glibc.node" >/dev/null

  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
