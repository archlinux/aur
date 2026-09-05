# Maintainer: Kévin Unger <kevin.unger@proton.me>
# Template — 0.36.0 and cad18d56f8e9f16589637b1a7cd3179f18c29638c5d96318d6443c845e661d71 are substituted by .github/workflows/aur.yml
# (or scripts/aur-publish.sh) before pushing to the AUR.
pkgname=blunderdb-bin
_appname=blunderdb
pkgver=0.36.0
pkgrel=1
pkgdesc="Backgammon blunder analysis tool (precompiled, webkit2gtk-4.1)"
# Two architectures since H.14 (#256): the arm64 build is native (the release
# workflow builds it on an arm64 runner — Wails needs cgo against the host's
# webkit2gtk, so it cannot be cross-compiled). makepkg picks the matching
# source_/sha256sums_ pair below.
arch=('x86_64' 'aarch64')
url="https://github.com/kevung/blunderDB"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('blunderdb')
conflicts=('blunderdb')
options=('!strip')
source_x86_64=("blunderdb-${pkgver}-x86_64.tar.gz::https://github.com/kevung/blunderDB/releases/download/${pkgver}/blunderDB-linux-webkit2gtk-4.1-${pkgver}.tar.gz")
sha256sums_x86_64=('cad18d56f8e9f16589637b1a7cd3179f18c29638c5d96318d6443c845e661d71')
source_aarch64=("blunderdb-${pkgver}-aarch64.tar.gz::https://github.com/kevung/blunderDB/releases/download/${pkgver}/blunderDB-linux-arm64-webkit2gtk-4.1-${pkgver}.tar.gz")
sha256sums_aarch64=('6e0f7008f1ca1baa6947a749271286483453d6f86df16b36179dd22991ddde10')

# The two tarballs unpack into directories named after the asset, so the
# directory to install from depends on the architecture being built.
if [ "$CARCH" = "aarch64" ]; then
  _srcdir="blunderDB-linux-arm64-webkit2gtk-4.1-${pkgver}"
else
  _srcdir="blunderDB-linux-webkit2gtk-4.1-${pkgver}"
fi

package() {
  install -Dm755 "${_srcdir}/blunderDB"        "${pkgdir}/usr/bin/blunderDB"
  # The CLI documentation calls the command `blunderdb` (as do Homebrew and
  # winget); ship the lowercase name too.
  ln -s blunderDB "${pkgdir}/usr/bin/blunderdb"

  # `blunderdb completion <shell>` prints the script (B.8, #176); generating
  # it here from the binary just extracted, rather than committing one, means
  # it can never drift from the subcommand table it reads (handlers()). The
  # CLI path never touches webkit2gtk, so this runs fine in a headless
  # makepkg chroot.
  install -d "${pkgdir}/usr/share/bash-completion/completions" \
             "${pkgdir}/usr/share/zsh/site-functions" \
             "${pkgdir}/usr/share/fish/vendor_completions.d"
  "${_srcdir}/blunderDB" completion bash > "${pkgdir}/usr/share/bash-completion/completions/blunderdb"
  "${_srcdir}/blunderDB" completion zsh  > "${pkgdir}/usr/share/zsh/site-functions/_blunderdb"
  "${_srcdir}/blunderDB" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/blunderdb.fish"

  install -Dm644 "${_srcdir}/blunderdb.desktop" "${pkgdir}/usr/share/applications/blunderdb.desktop"
  install -Dm644 "${_srcdir}/blunderdb-256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/blunderdb.png"
  install -Dm644 "${_srcdir}/io.github.kevung.blunderDB.metainfo.xml" \
                 "${pkgdir}/usr/share/metainfo/io.github.kevung.blunderDB.metainfo.xml"
  install -Dm644 "${_srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Third-party notices (Strehl network, GNUbg bearoff tables, Go/JS libraries,
  # fonts). Guarded so a tarball built before CI staged the file still packages.
  if [ -f "${_srcdir}/THIRD_PARTY.md" ]; then
    install -Dm644 "${_srcdir}/THIRD_PARTY.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY.md"
  fi
}
