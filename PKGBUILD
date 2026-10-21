# Maintainer: Bitty Maintainers <maintainers@bitty-terminal.dev>
# AUR package `bitty-bin`: prebuilt release binary, no user-side compile.
# Keep `bitty` as the source package per Arch convention; this `-bin`
# variant downloads the release asset mirrored to the R2-backed CDN by
# `.github/workflows/release.yml` ("Rename artifact" plus `r2-mirror` steps)
# and installs it to `/usr/bin/bitty` together with the `.desktop` entry and
# icons from the release source tarball.
#
# Template note: the release workflow (`aur-bin` job) copies this file to the
# AUR `bitty-bin` repository as `PKGBUILD`, substitutes `pkgver` with the
# release tag version, and replaces `b0b2efd40a663838701fa36fe2a994f18fcf447c7ff8ee035f6db780c4d795ed` below with
# the real sha256 from the published `.sha256` asset. The binary checksum must
# never be `SKIP` in a published package.
#
# Asset-name dependency (CTX-0164, issue #264): the inner binary rename
# `bitty-terminal` -> `bitty` changes `target/<triple>/release/<name>` inside the
# build, but the published dist name `_bitty_asset` below is constructed by
# the release workflow (`dist/bitty-${TARGET}`) and stays stable across that
# rename (verified against the 0164 worktree). If the dist name ever changes,
# update `_bitty_asset` here and in `release.yml` together.
#
# Download source (CTX-1413, #1847): the release binary comes from the
# R2-backed CDN, which is the preferred source for every package-manager
# channel. Every mirrored asset is byte-identical to GitHub Releases, which
# stays the documented fallback:
#   https://github.com/bitty-terminal/bitty/releases/download/v${pkgver}/${_bitty_asset}
# The metadata tarball below is not mirrored (only dist/* is), so it keeps the
# GitHub archive URL. The binary sha256 is always verified by makepkg.
pkgname=bitty-bin
pkgver=0.0.25
pkgrel=1
pkgdesc="Bitty pre-alpha terminal workspace minimal correct terminal (prebuilt binary)"
arch=('x86_64')
url="https://github.com/bitty-terminal/bitty"
license=('MIT' 'Apache-2.0')
depends=('fontconfig' 'freetype2')
makedepends=('ncurses')
optdepends=('noto-fonts: fallback font')
provides=('bitty')
conflicts=('bitty' 'bitty-nightly' 'bitty-git')
_bitty_asset="bitty-x86_64-unknown-linux-gnu"
# Version the local cached filename so package managers cannot reuse a
# previous release's download when the published asset name is stable.
_bitty_src="bitty-${pkgver}-x86_64-unknown-linux-gnu"
source_x86_64=(
  "${_bitty_src}::https://cdn.bitty.run/releases/v${pkgver}/${_bitty_asset}"
  "bitty-${pkgver}.tar.gz::https://github.com/bitty-terminal/bitty/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums_x86_64=(
  'b0b2efd40a663838701fa36fe2a994f18fcf447c7ff8ee035f6db780c4d795ed'
  'SKIP'
)

package() {
  install -Dm755 "${srcdir}/${_bitty_src}" "${pkgdir}/usr/bin/bitty"
  cd "${srcdir}/bitty-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 packaging/run.bitty.Bitty.desktop "${pkgdir}/usr/share/applications/run.bitty.Bitty.desktop"
  install -Dm644 packaging/run.bitty.Bitty.metainfo.xml "${pkgdir}/usr/share/metainfo/run.bitty.Bitty.metainfo.xml"
  for size in 16 32 64 128 256 512; do
    install -Dm644 "packaging/icons/hicolor/${size}x${size}/apps/bitty.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/bitty.png"
  done
  install -Dm644 packaging/icons/hicolor/scalable/apps/bitty.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bitty.svg"
  # Terminfo (CTX-1121 #1764): compile canonical source; never install raw .ti.
  tic -x -o "$pkgdir/usr/share/terminfo" terminfo/bitty.ti
}
