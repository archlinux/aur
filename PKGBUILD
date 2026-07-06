# Maintainer: rezky_nightky <with dot rezky at gmail dot com>
pkgname=zejtron-bin
pkgver=10.0.2
pkgrel=2
pkgdesc="Unified Linux introspection toolkit for paths, ports, processes, files, services, and diagnostics"
arch=('x86_64')
url="https://github.com/oxyzenQ/zejtron"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
provides=('zejtron')
conflicts=('zejtron')
options=('!strip')
source=()
sha512sums=()

prepare() {
  local tag="v${pkgver}"
  local asset="zejtron-${tag}-linux-amd64-gnu"

  local base_url="https://github.com/oxyzenQ/zejtron/releases/download/${tag}"
  curl -fL -o "${asset}.tar.gz" "${base_url}/${asset}.tar.gz"
  curl -fL -o "${asset}.tar.gz.sha512sum" "${base_url}/${asset}.tar.gz.sha512sum"

  # -- Verify integrity --
  # SHA-512 is always verified (mandatory — every Linux has sha512sum).
  # BLAKE2b-512 + SHAKE256 are optional quantum-resistant checksums.
  # They are verified only when the corresponding tool is available.
  msg2 "Verifying SHA512 checksum (required)..."
  sha512sum --check "${asset}.tar.gz.sha512sum"

  # Optional: BLAKE2b-512 (quantum-resistant, in GNU coreutils)
  if command -v b2sum >/dev/null 2>&1; then
    msg2 "Verifying BLAKE2b checksum (optional, quantum-resistant)..."
    curl -fL -o "${asset}.tar.gz.b2sum" "${base_url}/${asset}.tar.gz.b2sum"
    b2sum --check "${asset}.tar.gz.b2sum"
  else
    msg2 "b2sum not found — skipping BLAKE2b verification (optional)"
  fi

  # Optional: SHAKE256 (quantum-resistant, NIST PQ standard, via Python)
  if command -v python3 >/dev/null 2>&1; then
    msg2 "Verifying SHAKE256 checksum (optional, quantum-resistant)..."
    curl -fL -o "${asset}.tar.gz.shake256" "${base_url}/${asset}.tar.gz.shake256"
    COMPUTED=$(python3 -c "
import hashlib
data = open('${asset}.tar.gz', 'rb').read()
print(hashlib.shake_256(data).hexdigest(64))
")
    EXPECTED=$(awk '{print $1}' "${asset}.tar.gz.shake256")
    [ "${COMPUTED}" = "${EXPECTED}" ] || {
      error "SHAKE256 verification FAILED"
      return 1
    }
    msg2 "SHAKE256 verification OK"
  else
    msg2 "python3 not found — skipping SHAKE256 verification (optional)"
  fi

  mkdir -p "${srcdir}/archive"
  tar -xzf "${asset}.tar.gz" -C "${srcdir}/archive"
}

package() {
  install -Dm755 "${srcdir}/archive/zejtron" "${pkgdir}/usr/bin/zejtron"
  install -Dm644 "${srcdir}/archive/LICENSE" "${pkgdir}/usr/share/licenses/zejtron-bin/LICENSE"
  install -Dm644 "${srcdir}/archive/README.md" "${pkgdir}/usr/share/doc/zejtron-bin/README.md"
}
