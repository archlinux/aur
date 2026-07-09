# Maintainer: Markus Maiwald <markus@maiwald.tk>
pkgname=prism-harness-suite
pkgver=1.0.0_rc1
pkgrel=1
pkgdesc="PRISM Harness suite - small bundles sharing one Bun runtime (harness, loop, proxy, route, sober)"
arch=('x86_64')
url="https://git.sovereign-society.org/prism"
license=('custom:LSL-1.0')
depends=('bun')
makedepends=('git' 'bun')
provides=('prism-harness' 'prism-loop' 'prism-proxy' 'prism-route' 'prism-sober')
conflicts=('prism-harness' 'prism-loop' 'prism-proxy' 'prism-route' 'prism-sober')
source=("git+https://git.sovereign-society.org/prism/prism-harness.git#tag=v1.0.0-rc.1")
sha256sums=('SKIP')

build() {
  cd "$srcdir/prism-harness"

  # Clone other components for their small bundles (share one Bun)
  for r in prism-loop prism-sober prism-proxy prism-route; do
    git clone --depth=1 "https://git.sovereign-society.org/prism/$r.git" "../$r" || true
  done

  # Build small bundles in each
  for d in . ../prism-loop ../prism-sober ../prism-proxy ../prism-route; do
    if [[ -f "$d/package.json" ]]; then
      (cd "$d" && bun run --if-present build) || echo "build skipped for $d"
    fi
  done
}

package() {
  cd "$srcdir"

  # Install the small .js bundles (with shebang) as /usr/bin commands
  for bin in prism-harness prism-loop prism-sober prism-proxy prism-route; do
    found=false
    for d in prism-harness prism-loop prism-sober prism-proxy prism-route; do
      if [[ -f "$d/dist/$bin.js" ]]; then
        install -Dm755 "$d/dist/$bin.js" "$pkgdir/usr/bin/$bin"
        found=true
        break
      fi
    done
    $found || echo "warning: $bin bundle not found"
  done

  install -Dm755 "prism-harness/install.sh" "$pkgdir/usr/share/doc/$pkgname/install.sh"
  install -Dm644 "prism-harness/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
