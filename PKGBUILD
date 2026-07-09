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

  # Clone the other components (they are separate repos on Forgejo)
  for r in prism-loop prism-sober prism-proxy prism-route; do
    if [ ! -d "../$r" ]; then
      git clone --depth 1 "https://git.sovereign-society.org/prism/$r.git" "../$r"
    fi
  done

  # Build small bundles (each package has its "build" script from the suite setup)
  for d in . ../prism-loop ../prism-sober ../prism-proxy ../prism-route; do
    if [ -f "$d/package.json" ]; then
      (cd "$d" && bun install --frozen-lockfile 2>/dev/null || bun install; bun run --if-present build) || echo "note: build for $d"
    fi
  done
}

package() {
  cd "$srcdir"

  # Install each component's built tree to /usr/lib/prism/<name> and wrapper in /usr/bin
  # This keeps node_modules for native deps (e.g. sharp in proxy) next to the code
  # Small size, one Bun runtime

  install -d "$pkgdir/usr/lib/prism"
  install -d "$pkgdir/usr/bin"

  for comp in prism-harness prism-loop prism-sober prism-proxy prism-route; do
    srcdir_comp="$srcdir"
    if [ "$comp" != "prism-harness" ]; then
      srcdir_comp="$srcdir/../$comp"
    fi

    if [ -d "$srcdir_comp/dist" ]; then
      # Copy the full component (for deps) or at least dist + needed
      install -d "$pkgdir/usr/lib/prism/$comp"
      cp -r "$srcdir_comp/dist" "$pkgdir/usr/lib/prism/$comp/" 2>/dev/null || true

      # For components with node_modules (proxy etc), copy if present after build
      if [ -d "$srcdir_comp/node_modules" ]; then
        cp -r "$srcdir_comp/node_modules" "$pkgdir/usr/lib/prism/$comp/" 2>/dev/null || true
      fi

      # Copy package.json if needed for resolution
      if [ -f "$srcdir_comp/package.json" ]; then
        install -Dm644 "$srcdir_comp/package.json" "$pkgdir/usr/lib/prism/$comp/package.json"
      fi

      # The bundle .js
      bundle="$pkgdir/usr/lib/prism/$comp/dist/$comp.js"
      if [ -f "$bundle" ]; then
        # Wrapper script (ensures correct exec with bun and resolution)
        cat > "$pkgdir/usr/bin/$comp" << WRAP
#!/usr/bin/env sh
exec /usr/bin/bun "/usr/lib/prism/$comp/dist/$comp.js" "\$@"
WRAP
        chmod +x "$pkgdir/usr/bin/$comp"
      fi
    else
      echo "warning: no dist for $comp"
    fi
  done

  # Install helper
  if [ -f "prism-harness/install.sh" ]; then
    install -Dm755 "prism-harness/install.sh" "$pkgdir/usr/share/doc/$pkgname/install.sh"
  fi
}
