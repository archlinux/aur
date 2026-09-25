# Maintainer: Trancado <maintainers@trancado.net>
# Contributor: Trancado <maintainers@trancado.net>
#
# NOTE TO MAINTAINERS / CI:
# - Bump `_pkgver` when a new release is tagged (e.g. tag v0.5.1 -> _pkgver=0.5.1).
#   The release pipeline in .gitlab-ci.yml publishes
#   `trancado_v${pkgver}_amd64.tar.gz` to downloads.trancado.net (R2 bucket
#   trancado-releases). Keep the URL in `source=` in sync with the CI upload
#   step (`trancado_v${VERSION}_amd64.tar.gz` where VERSION comes from
#   `git describe --tags --abbrev=0`, e.g. v0.5.1).
# - Keep `sha256sums` in sync with the published tarball: whenever the
#   tarball changes (a new release bumping `_pkgver`, or a content change such
#   as a LICENSE file being added), re-verify and update the hash with
#   `sha256sum trancado_${pkgver}_amd64.tar.gz`.
# - LICENSE install is CONDITIONAL: package() installs
#   usr/share/licenses/trancado-bin/LICENSE only if the release tarball
#   contains it. CI adds the LICENSE file to the tarball once the project
#   publishes one (BUG-001 pending user-provided LICENSE file — the repo has
#   no LICENSE today and the package must build without it).
#
# SECURITY: This file must NEVER contain real secrets. The Google OAuth client
# ID/secret are baked into the binary at CI build time via the
# GOOGLE_CLIENT_ID / GOOGLE_CLIENT_SECRET env vars (GitLab CI/CD variables),
# not committed anywhere.

pkgname=trancado-bin
_pkgver=0.7.9
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Trancado password manager — pre-built desktop application"
arch=('x86_64')
url="https://trancado.net"
license=('custom')
# librsvg: pulled in transitively by webkit2gtk-4.1; listed explicitly per -bin convention
depends=('webkit2gtk-4.1' 'gtk3' 'libsecret' 'libsoup3' 'librsvg')
source=("https://downloads.trancado.net/trancado_v${pkgver}_amd64.tar.gz")
# sha256sum of the published v0.7.9 tarball (verified against the file
# downloaded from downloads.trancado.net). IMPORTANT: update this whenever the
# tarball changes — a new release (bump `_pkgver` above) or a content change
# produces a new hash.
sha256sums=('7cd08b07d3a4f1a4b22971d0e027688000a860dfdfe76ec5003ae6227a521ece')

package() {
  # Tarball layout produced by the release pipeline (CI):
  #   usr/bin/trancado
  #   usr/share/applications/trancado.desktop
  #   usr/share/icons/hicolor/512x512/apps/trancado.png
  install -Dm755 "$srcdir/usr/bin/trancado" "$pkgdir/usr/bin/trancado"
  install -Dm644 "$srcdir/usr/share/applications/trancado.desktop" \
    "$pkgdir/usr/share/applications/trancado.desktop"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/512x512/apps/trancado.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/trancado.png"

  # Install license if present in the tarball (LICENSE ships in the release
  # tarball since BUG-001 was resolved; conditional install keeps the package
  # buildable either way)
  if [ -f "$srcdir/usr/share/licenses/trancado-bin/LICENSE" ]; then
    install -Dm644 "$srcdir/usr/share/licenses/trancado-bin/LICENSE" \
      "$pkgdir/usr/share/licenses/trancado-bin/LICENSE"
  fi
}
