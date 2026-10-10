# Maintainer: Kévin Unger <kevin.unger@proton.me>
# Template — 0.39.0 and f4f4617b1f2b1249af2d2de893fa3f755ef4e677563b207f707cf8fcfbb5a641 are substituted by .github/workflows/aur.yml
# (or scripts/aur-publish.sh) before pushing to the AUR.
pkgname=blunderdb-bin
_appname=blunderdb
pkgver=0.39.0
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
optdepends=('gst-plugins-good: lecture des vidéos de match (MP4, WebM)'
            'gst-libav: décodage H.264/HEVC')
provides=('blunderdb')
conflicts=('blunderdb')
options=('!strip')
source_x86_64=("blunderdb-${pkgver}-x86_64.tar.gz::https://github.com/kevung/blunderDB/releases/download/${pkgver}/blunderDB-linux-webkit2gtk-4.1-${pkgver}.tar.gz")
sha256sums_x86_64=('f4f4617b1f2b1249af2d2de893fa3f755ef4e677563b207f707cf8fcfbb5a641')
source_aarch64=("blunderdb-${pkgver}-aarch64.tar.gz::https://github.com/kevung/blunderDB/releases/download/${pkgver}/blunderDB-linux-arm64-webkit2gtk-4.1-${pkgver}.tar.gz")
sha256sums_aarch64=('e4f0db3a92f7da70e369b7b3543b6b9373289eebe2c826e9d36fc907f20550bb')

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
