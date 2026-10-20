# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=kosmozoo-git
_release_ver=0.2.2.r0
pkgver=0.2.2.r0.g79ef2d4
pkgrel=2
pkgdesc="Local review and curation app for ComfyUI image output"
arch=('x86_64')
url="https://github.com/alexindigo/kosmozoo"
license=('LGPL-3.0-only')
depends=('deno' 'sqlite' 'hicolor-icon-theme')
optdepends=('chromium: app window' 'google-chrome: app window' 'brave-bin: app window' 'firefox: app window')
install=kosmozoo.install
makedepends=('git')
provides=('kosmozoo')
conflicts=('kosmozoo' 'kosmozoo-bin')
source=("$pkgname::git+$url.git" "kosmozoo.sh")
sha256sums=('SKIP' 'd830038ed0bd18cd38b59e2d753a7389aaa926135818f48151d700976ba8d42e')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # NOTE: capture describe output explicitly — `git describe ... | sed ...`
    # masks describe's exit code (sed exits 0 on empty input), so a pipeline
    # `|| echo fallback` never fires on tagless repos.
    local out
    out=$(git describe --long --tags 2>/dev/null) || out=""
    if [ -n "$out" ]; then
        printf "%s" "$out" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
    else
        echo "${_release_ver}.g$(git rev-parse --short HEAD)"
    fi
}

build() {
  cd "$pkgname"
  export DENO_DIR="$srcdir/deno-dir" DENO_NO_UPDATE_CHECK=1 DENO_SQLITE_PATH=/usr/lib/libsqlite3.so
  deno cache --frozen src/main.mjs src/cli.mjs build.mjs plugins/*/plugin.mjs
  deno run --frozen --allow-all build.mjs
  deno task --frozen-lockfile setup
}
package() {
  cd "$pkgname"; local app="$pkgdir/usr/lib/kosmozoo"
  install -d "$app/plugins"
  cp -a src client client-solid-dist deno.json deno.lock VERSION "$app/"
  install -d "$app/packaging/linux"; cp -a packaging/linux/resources "$app/packaging/linux/"
  for p in hello difference detector critic; do install -Dm644 plugins/$p/*.mjs -t "$app/plugins/$p/"; done
  cp -a "$srcdir/deno-dir" "$app/deno-dir"
  local revision; revision=$(git -C "$srcdir/$pkgname" rev-parse HEAD)
  [[ $revision =~ ^[0-9a-f]{40}$ ]] || { echo "checkout has no commit" >&2; return 1; }
  sed "s/@KOZMOZOO_REVISION@/$revision/" "$srcdir/kosmozoo.sh" > "$srcdir/kosmozoo-launcher"
  install -Dm755 "$srcdir/kosmozoo-launcher" "$pkgdir/usr/bin/kosmozoo"
  cd "$srcdir/$pkgname"
  DENO_DIR="$srcdir/deno-dir" DENO_NO_UPDATE_CHECK=1 DENO_SQLITE_PATH=/usr/lib/libsqlite3.so \
    deno run --frozen --cached-only --allow-read --allow-write --allow-env --config=deno.json \
    src/cli.mjs package-resources --prefix=/usr --destdir="$pkgdir"
}
