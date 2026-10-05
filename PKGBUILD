# Maintainer: enihcam <enihcam@archlinux>

# Upstream ships no LICENSE file; the "Important Notice" in the README is the
# sole license grant. It explicitly disallows redistribution, modification, and
# reverse-engineering, which is unusual for AUR but the tarballs themselves are
# publicly downloadable. See PKGBUILD comments and package() before redistributing.

pkgname=airwallex-cli
pkgver=0.4.2
pkgrel=1
pkgdesc='CLI for the Airwallex platform (proprietary beta)'
arch=('x86_64' 'aarch64')
url='https://github.com/airwallex/airwallex-cli'
license=('LicenseRef-Airwallex-CLI-EULA')
depends=('glibc')
optdepends=('bash-completion: shell completions (provided by upstream)')
provides=('airwallex')
conflicts=('airwallex')

# Per-OS upstream checksum file is the same artifact the official install.sh
# downloads for integrity verification. We use it to pin both per-arch tarball
# digests so makepkg refuses to package a tampered asset, and then ship it
# under /usr/share so users can reproduce the check out-of-band.
source=(
  "airwallex-linux-checksums.txt::https://github.com/airwallex/airwallex-cli/releases/download/v${pkgver}/airwallex-linux-checksums.txt"
  "LICENSE::https://raw.githubusercontent.com/airwallex/airwallex-cli/master/README.md"
)

# amd64 / arm64 sha256 digests cross-checked against the upstream
# airwallex-linux-checksums.txt on 2026-10-05; do NOT edit these by hand.
sha256sums=(
  'dcea645280b9be33c49be171d2e04ce98fa554faf60e86be12a352e00098fe39'  # airwallex-linux-checksums.txt
  'SKIP'                                                              # README.md license notice
)

# CARCH -> asset filename fragment used by upstream release artifacts.
_asset_for_carch() {
  case "$CARCH" in
    x86_64) echo 'amd64' ;;
    aarch64) echo 'arm64' ;;
    *) return 1 ;;
  esac
}

prepare() {
  local asset="airwallex_${pkgver}_linux_$(_asset_for_carch).tar.gz"
  local url="https://github.com/airwallex/airwallex-cli/releases/download/v${pkgver}/${asset}"

  msg2 "Downloading ${asset}"
  if ! curl -fsSL -o "${srcdir}/${asset}" "${url}"; then
    error "Failed to download ${url}"
    return 1
  fi

  # Use the upstream-issued per-OS checksums file (the same one the official
  # install.sh consumes) to verify the downloaded archive before extraction.
  local expected
  expected=$(awk -v name="$asset" '$2 == name { print $1; exit }' \
    "$srcdir/airwallex-linux-checksums.txt")
  if [ -z "$expected" ]; then
    error "Asset ${asset} not listed in airwallex-linux-checksums.txt"
    return 1
  fi

  local actual
  actual=$(sha256sum "$srcdir/$asset" | awk '{print $1}')
  if [ "$expected" != "$actual" ]; then
    error "SHA256 mismatch for ${asset}: expected ${expected}, got ${actual}"
    return 1
  fi
  msg2 "Checksum OK (${actual})"
}

package() {
  local asset="airwallex_${pkgver}_linux_$(_asset_for_carch).tar.gz"

  install -d "$pkgdir/usr/bin"

  # Tarball layout: a single `airwallex` executable at the archive root.
  bsdtar --no-same-owner -xf "$srcdir/$asset" -C "$pkgdir/usr/bin" airwallex
  chmod 0755 "$pkgdir/usr/bin/airwallex"

  # Ship the upstream notice + integrity artifacts under /usr/share so users
  # can read the EULA terms and re-verify against the published checksums
  # without going back to GitHub.
  install -Dm0644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 "$srcdir/airwallex-linux-checksums.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/airwallex-linux-checksums.txt"
}
