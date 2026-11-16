_FORCE_ts=20261116152344
# Maintainer: Geequlim
#
# The LayaAir CLI runtime is published by Layabox as a versioned ZIP on their
# CDN. This package installs one system-wide runtime under /opt/layaair-cli and
# exposes the `layaair` entry point. Runtime version switching is intentionally
# left to pacman: `layaair install` / `layaair uninstall` are handled by the
# wrapper in package().

pkgname=layaair-cli
pkgver=3.4.3
pkgrel=3
_upstream_ver=3.4.3
_url=https://ldc-1251285021.file.myqcloud.com/layaair3/layaair-3.4/cli/layaair-cli-3.4.3-linux-x64.zip
pkgdesc='LayaAir command-line tool (official runtime)'
arch=('x86_64')
url='https://github.com/layabox/layaair-cli'
license=('custom')
depends=('nodejs>=22.12.0')
options=('!strip')
# Keep pkgver and pkgrel in the local filename: makepkg skips downloading
# whenever a file with this name already exists in the build dir, so the name
# must change whenever the upstream checksum can change.
source=("layaair-cli-${pkgver}-${pkgrel}.zip::${_url}")
sha256sums=('f2b83ca96e56512861b276bf96996c321f9ad9ee1c11e1b502c66922eb5d9358')

prepare() {
  cd "$srcdir"

  rm -rf runtime
  mkdir runtime
  bsdtar -xf "layaair-cli-${pkgver}-${pkgrel}.zip" -C runtime
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/layaair-cli"
  cp -a --no-preserve=ownership runtime/. "$pkgdir/opt/layaair-cli/"

  # The runtime resolves everything relative to Resources/, so keep the tree
  # intact and only normalize permissions. Prebuilt native tools are shipped
  # by upstream; do not strip them.
  printf '%s\n' "$_upstream_ver" > "$pkgdir/opt/layaair-cli/VERSION"
  find "$pkgdir/opt/layaair-cli" -type d -exec chmod 755 {} +
  find "$pkgdir/opt/layaair-cli" -type f -perm /111 -exec chmod 755 {} +
  find "$pkgdir/opt/layaair-cli" -type f ! -perm /111 -exec chmod 644 {} +

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/layaair" <<'EOF_WRAPPER'
#!/bin/sh
# System-package wrapper for the LayaAir CLI runtime.
#
# The upstream dispatcher supports multiple runtime versions. An Arch package
# provides exactly one runtime, so version switching is done with pacman and
# only the read-only version queries are implemented here.
set -eu

prefix="${LAYAAIR_CLI_PREFIX:-/opt/layaair-cli}"
version="$(cat "$prefix/VERSION" 2>/dev/null || printf 'unknown')"

case "${1:-}" in
  --version)
    printf '%s\n' "$version"
    exit 0
    ;;
  --version=*)
    requested="${1#--version=}"
    if [ "$requested" != "$version" ]; then
      printf 'layaair: version %s is not installed (this package provides %s)\n' "$requested" "$version" >&2
      exit 1
    fi
    shift
    ;;
  list)
    printf '%s (system package)\n' "$version"
    exit 0
    ;;
  install|uninstall)
    printf 'layaair: version management is handled by the package manager; update with your AUR helper (e.g. "yay -S layaair-cli").\n' >&2
    exit 1
    ;;
esac

exec node "$prefix/Resources/cli-main.js" "$@"
EOF_WRAPPER
}
