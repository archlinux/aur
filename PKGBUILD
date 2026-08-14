# Maintainer: Markus Maiwald <markus@maiwald.work>
pkgname=sober-bin
_upstream_version=0.9.0-beta
pkgver="${_upstream_version//-/_}"
pkgrel=1
pkgdesc='Prevent AI-Slop: The Sober Raccoon is your local CodeRabbit: A Local-first repository governance assistant and code reviewer with deterministic review readiness'
arch=('x86_64')
# Marketing / product site (read about Sober). Source + releases: git.sovereign-society.org/Sober/sober
url='https://sober-dev.app'
license=('LSL-1.0')
depends=('tree-sitter')
provides=('sober')
conflicts=('sober')

# Integrity model (why this is not "no verification"):
# 1) makepkg validates the binary against the pinned sha256sums[0] in this PKGBUILD
#    (the AUR git history is the trust anchor — standard Arch -bin practice).
# 2) prepare() re-checks the same binary against the release SHA256SUMS *line*
#    for this artifact only (cross-check vs the published release manifest).
# SHA256SUMS itself uses SKIP: that file is rewritten when OCI/Debian image
# assets are attached later; pinning its whole-file hash caused false AUR
# failures. The binary line inside it stays stable for a given release.
# Sources come from the sober-dist R2 layer (download-counter instrumented),
# not the forge release page, so installs are visible in the /stats counters.
source=(
  "https://pkg.sober-dev.app/ce/sober_v${_upstream_version}_linux_amd64"
  "https://pkg.sober-dev.app/ce/SHA256SUMS"
)
sha256sums=(
  '4cfb22834c24092b011c92435e8ebcbacc112b8d23c69592eb7f2fcde7fdf583'
  'SKIP'
)

prepare() {
  cd "${srcdir}"
  local bin="sober_v${_upstream_version}_linux_amd64"
  local line

  if [[ ! -f SHA256SUMS ]]; then
    echo "error: release SHA256SUMS missing from sources" >&2
    return 1
  fi
  if [[ ! -f "${bin}" ]]; then
    echo "error: binary ${bin} missing from sources" >&2
    return 1
  fi

  # Exact artifact line (hash + two spaces/tabs + filename).
  line="$(grep -E "^[0-9a-fA-F]{64}[[:space:]]+${bin}\$" SHA256SUMS || true)"
  if [[ -z "${line}" ]]; then
    echo "error: ${bin} is not listed in upstream SHA256SUMS" >&2
    echo "------- SHA256SUMS -------" >&2
    cat SHA256SUMS >&2 || true
    return 1
  fi

  # Cross-check binary bytes against the release manifest line.
  if ! printf '%s\n' "${line}" | sha256sum -c -; then
    echo "error: binary failed verification against release SHA256SUMS" >&2
    return 1
  fi

  # Defense in depth: manifest hash must equal the PKGBUILD pin (makepkg
  # already checked the file; this catches a stale pin vs updated release).
  local from_sums actual
  from_sums="$(printf '%s\n' "${line}" | awk '{print tolower($1)}')"
  actual="$(sha256sum "${bin}" | awk '{print tolower($1)}')"
  if [[ "${from_sums}" != "${actual}" ]]; then
    echo "error: SHA256SUMS hash (${from_sums}) != binary hash (${actual})" >&2
    return 1
  fi
  if [[ "${from_sums}" != "${sha256sums[0]}" ]]; then
    echo "error: PKGBUILD pin (${sha256sums[0]}) != release SHA256SUMS (${from_sums})" >&2
    echo "hint: maintainer must re-run scripts/publish-aur.sh after re-uploading the binary" >&2
    return 1
  fi

  echo "ok: ${bin} matches PKGBUILD pin and release SHA256SUMS"
}

package() {
  install -Dm755 "${srcdir}/sober_v${_upstream_version}_linux_amd64" \
    "${pkgdir}/usr/bin/sober"
  # Ship the release manifest so operators can re-verify offline.
  install -Dm644 "${srcdir}/SHA256SUMS" \
    "${pkgdir}/usr/share/doc/${pkgname}/SHA256SUMS"
}
