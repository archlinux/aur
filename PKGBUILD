# Maintainer: Markus Maiwald <markus@maiwald.tk>
pkgname=prism-harness-suite
pkgver=1.0.0rc1
pkgrel=1
pkgdesc="PRISM Harness suite - small bundles sharing one Bun runtime (harness, loop, proxy, route, sober)"
arch=('x86_64')
url="https://git.sovereign-society.org/prism"
license=('custom:LSL-1.0')
depends=('bun')
makedepends=('git' 'bun')
provides=('prism-harness' 'prism-loop' 'prism-proxy' 'prism-route' 'prism-sober')
conflicts=('prism-harness' 'prism-loop' 'prism-proxy' 'prism-route' 'prism-sober')
source=("git+https://git.sovereign-society.org/prism/prism-harness.git#tag=v${pkgver//rc/.}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/prism-harness"

  # Build small bundles for all components (they share one Bun)
  # Note: other repos are cloned by the build or we build only harness here
  # For full suite, we clone the others too for their bundles
  for repo in prism-loop prism-sober prism-proxy prism-route; do
    if [ ! -d "../$repo" ]; then
      git clone --depth 1 "https://git.sovereign-society.org/prism/$repo.git" "../$repo"
    fi
  done

  # Build each
  for d in . ../prism-loop ../prism-sober ../prism-proxy ../prism-route; do
    if [ -f "$d/package.json" ]; then
      (cd "$d" && bun run --if-present build) || true
    fi
  done
}

package() {
  cd "$srcdir"

  # Install small bundles as the CLI entrypoints
  for bin in prism-harness prism-loop prism-sober prism-proxy prism-route; do
    for srcdir in prism-harness prism-loop prism-sober prism-proxy prism-route; do
      if [ -f "$srcdir/dist/$bin.js" ]; then
        install -Dm755 "$srcdir/$srcdir/dist/$bin.js" "$pkgdir/usr/bin/$bin"
        break
      fi
    done
  done

  # Install the suite install script for reference
  install -Dm755 "prism-harness/install.sh" "$pkgdir/usr/share/prism-harness/install.sh"

  # Docs
  install -Dm644 "prism-harness/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
