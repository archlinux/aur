# Maintainer: Evert Vorster
_pkgname=openmemory-backend
pkgname=${_pkgname}-git
pkgver=1.3.0.r17.g5df446e
pkgrel=1
pkgdesc="OpenMemory backend server (HTTP API + MCP) from git"
arch=('x86_64')
url="https://github.com/CaviraOSS/OpenMemory"
license=('Apache-2.0')

depends=('nodejs')
makedepends=('git' 'npm')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

# Use the .install hook you already created
install=openmemory-backend.install

# Upstream is a monorepo; the backend implementation lives here
_backend_subdir="packages/openmemory-js"

source=(
  "OpenMemory::git+${url}.git"
  "openmemory-backend"          # our fixed wrapper
  "openmemory-backend.service"
  "openmemory-backend.install"
)

# For AUR convenience while iterating; you can later replace SKIP with fixed sums.
sha256sums=('SKIP'
            '9c5e30768facbc24c28b9f30ae3489e6c46f857e3847f3b4b52821f0ff99021b'
            'b3e41cca84a25b3ebb86d5a5795bb6a7eff38a21609af52bdc6d5e023299d95e'
            '9f99895d611103aaf92d1aff003f7746171aa052e21342733a3eb4af085f2607')

pkgver() {
  cd "${srcdir}/OpenMemory"
  git describe --long --tags --always 2>/dev/null \
    | sed 's/^v//; s/-/.r/; s/-/./' \
    || printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/OpenMemory/${_backend_subdir}"

  # Upstream lockfile may not be CI-clean on git HEAD; npm ci can fail.
  npm install

  # If upstream defines a build step, run it.
  if npm run | grep -qE '^\s+build\b'; then
    npm run build
  fi

  # Keep only production deps in the packaged payload.
  npm prune --omit=dev
}

package() {
  cd "${srcdir}/OpenMemory"

  # Install backend runtime payload
  install -d "${pkgdir}/usr/lib/openmemory-backend"
  cp -a "${_backend_subdir}" "${pkgdir}/usr/lib/openmemory-backend/"

  # Arch is glibc; remove musl prebuilds if present
  rm -rf \
    "${pkgdir}/usr/lib/openmemory-backend/openmemory-js/node_modules/@napi-rs/canvas-linux-x64-musl" \
    2>/dev/null || true

  # Remove empty esbuild dir noise (optional)
  rmdir --ignore-fail-on-non-empty \
    "${pkgdir}/usr/lib/openmemory-backend/openmemory-js/node_modules/@esbuild" \
    2>/dev/null || true

  # Install the corrected wrapper from the AUR repo (NOT generated inline)
  install -Dm755 "${srcdir}/openmemory-backend" \
    "${pkgdir}/usr/bin/openmemory-backend"

  # Ship a default env template under /etc (users can copy to ~/.config/openmemory/openmemory.env)
  install -d "${pkgdir}/etc/openmemory"
  if [[ -f .env.example ]]; then
    install -m644 .env.example "${pkgdir}/etc/openmemory/openmemory.env"
  else
    printf "# Upstream .env.example not found in this revision.\n" \
      > "${pkgdir}/etc/openmemory/openmemory.env"
  fi

  # systemd user service (from source=(), not generated inline)
  install -Dm644 "${srcdir}/openmemory-backend.service" \
    "${pkgdir}/usr/lib/systemd/user/openmemory-backend.service"

  # License
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
