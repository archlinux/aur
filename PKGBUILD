# Maintainer: Alex Indigo <ai@aegis.one>
pkgname=kosmozoo; pkgver=0.4.1; pkgrel=1
pkgdesc="Local review and curation app for ComfyUI image output"
arch=('x86_64')
url="https://github.com/alexindigo/kosmozoo"
license=('LGPL-3.0-only')
depends=('deno' 'sqlite' 'hicolor-icon-theme'); conflicts=('kosmozoo-bin' 'kosmozoo-git')
optdepends=('chromium: app window' 'google-chrome: app window' 'brave-bin: app window' 'firefox: app window')
install=kosmozoo.install
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "kosmozoo.sh")
sha256sums=('92a2f64946067a3e547ebfe1bc2aabdb39c52b62da0b9315247c4142eb5fc734'
            'd830038ed0bd18cd38b59e2d753a7389aaa926135818f48151d700976ba8d42e')
build() {
  cd "$pkgname-$pkgver"
  export DENO_DIR="$srcdir/deno-dir" DENO_NO_UPDATE_CHECK=1 DENO_SQLITE_PATH=/usr/lib/libsqlite3.so
  deno task deps
  deno run --frozen --cached-only --allow-all build.mjs
  deno task --frozen-lockfile setup
}
package() {
  cd "$pkgname-$pkgver"; local app="$pkgdir/usr/lib/kosmozoo"
  install -d "$app/plugins"
  cp -a src client client-solid-dist deno.json deno.lock VERSION LICENSE LICENSE.GPL "$app/"
  install -Dm644 docs/executable.md "$app/docs/executable.md"
  install -d "$app/packaging/linux"; cp -a packaging/linux/resources packaging/linux/PUBLICATION.md packaging/linux/LICENSING.md "$app/packaging/linux/"
  for p in hello difference detector critic; do install -Dm644 plugins/$p/*.mjs -t "$app/plugins/$p/"; done
  cp -a "$srcdir/deno-dir" "$app/deno-dir"
  local revision; revision=$(gzip -dc "$srcdir/$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)
  [[ $revision =~ ^[0-9a-f]{40}$ ]] || { echo "tarball has no commit id" >&2; return 1; }
  sed "s/@KOZMOZOO_REVISION@/$revision/" "$srcdir/kosmozoo.sh" > "$srcdir/kosmozoo-launcher"
  install -Dm755 "$srcdir/kosmozoo-launcher" "$pkgdir/usr/bin/kosmozoo"
  cd "$srcdir/$pkgname-$pkgver"
  DENO_DIR="$srcdir/deno-dir" DENO_NO_UPDATE_CHECK=1 DENO_SQLITE_PATH=/usr/lib/libsqlite3.so \
    deno run --frozen --cached-only --allow-read --allow-write --allow-env --config=deno.json \
    src/cli.mjs package-resources --prefix=/usr --destdir="$pkgdir"
}
