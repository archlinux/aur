# Maintainer: Bitty Maintainers <maintainers@bitty-terminal.dev>
# AUR package `bitty-bin`: prebuilt release binary, no user-side compile.
# Keep `bitty` as the source package per Arch convention; this `-bin`
# variant downloads the release asset published by
# `.github/workflows/release.yml` ("Rename artifact" step) and installs it
# to `/usr/bin/bitty` together with the `.desktop` entry and icons from the
# release source tarball.
#
# Template note: the release workflow (`aur-bin` job) copies this file to the
# AUR `bitty-bin` repository as `PKGBUILD`, substitutes `pkgver` with the
# release tag version, and replaces `_bitty_bin_sha256` below with the real
# sha256 from the published `.sha256` asset. The binary checksum must never
# be `SKIP` in a published package.
#
# Asset-name dependency (CTX-0164, issue #264): the inner binary rename
# `bitty-app` -> `bitty` changes `target/<triple>/release/<name>` inside the
# build, but the published dist name `_bitty_asset` below is constructed by
# the release workflow (`dist/bitty-${TARGET}`) and stays stable across that
# rename (verified against the 0164 worktree). If the dist name ever changes,
# update `_bitty_asset` here and in `release.yml` together.
pkgname=bitty-bin
pkgver=0.0.20
pkgrel=1
pkgdesc="Bitty pre-alpha terminal workspace minimal correct terminal (prebuilt binary)"
arch=('x86_64')
url="https://github.com/bitty-terminal/bitty"
license=('MIT' 'Apache-2.0')
depends=('fontconfig' 'freetype2')
optdepends=('noto-fonts: fallback font')
provides=('bitty')
conflicts=('bitty' 'bitty-nightly' 'bitty-git')
_bitty_asset="bitty-x86_64-unknown-linux-gnu"
source_x86_64=(
  "${_bitty_asset}::https://github.com/bitty-terminal/bitty/releases/download/v${pkgver}/${_bitty_asset}"
  "bitty-${pkgver}.tar.gz::https://github.com/bitty-terminal/bitty/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums_x86_64=(
  'b6ae62983fbe55a89ddb8365cb5bd650001858a3091d957a5e8f30da45ecd270'
  'SKIP'
)

package() {
  install -Dm755 "${srcdir}/${_bitty_asset}" "${pkgdir}/usr/bin/bitty"
  cd "${srcdir}/bitty-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 packaging/bitty.desktop "${pkgdir}/usr/share/applications/bitty.desktop"
  for size in 16 32 64 128 256 512; do
    install -Dm644 "packaging/icons/hicolor/${size}x${size}/apps/bitty.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/bitty.png"
  done
  install -Dm644 packaging/icons/hicolor/scalable/apps/bitty.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bitty.svg"
  if [ -f terminfo/bitty.terminfo ]; then
    install -Dm644 terminfo/bitty.terminfo "${pkgdir}/usr/share/terminfo/b/bitty"
  fi
}
