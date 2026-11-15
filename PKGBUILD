# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>
# Unofficial package of the GapCode CLI by GapGPT
# GapGPT all rights reserved ©

pkgname=gapgpt-bin
pkgver=0.164.3
pkgrel=1
pkgdesc="GapCode, the GapGPT AI coding agent for the terminal (unofficial package)"
arch=('x86_64' 'aarch64')
url="https://gapgpt.app"
# GapCode is proprietary. The archive also bundles Claude Code (proprietary),
# ripgrep (MIT or Unlicense), bubblewrap (LGPL-2.0-or-later) and zsh.
license=('LicenseRef-gapgpt' 'LicenseRef-claude-code' 'MIT' 'Unlicense'
         'LGPL-2.0-or-later' 'MIT-Modern-Variant')
# gapcode, bwrap, rg and zsh are static; only the bundled claude links glibc.
depends=('glibc')
optdepends=('git: work with repositories')
provides=("${pkgname%-bin}" 'gapcode')
conflicts=("${pkgname%-bin}" 'gapcode')
# Prebuilt static binaries: nothing to strip, no debug info.
options=('!strip' '!debug')
# Same archives the desktop app downloads. Upstream checksums:
#   curl -s https://gapgpt.ir/releases/app/gapcode/releases/v${pkgver}/SHA256SUMS
_base="https://gapgpt.ir/releases/app/gapcode/releases/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base}/gapcode-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base}/gapcode-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('1a6fbda9bddd7a9645d07bad0c75df72bcf0f2b202a834c8e2b388e812eed1d6')
sha256sums_aarch64=('cd5eb63971db34a8884feeac829d9e8f9815c8313f5a04c33e1c85eb3d387983')

package() {
  local _app=/opt/gapcode

  # Keep upstream's layout: the binary finds codex-package.json,
  # codex-resources/ and codex-path/ relative to itself.
  install -dm755 "$pkgdir$_app"
  cp -a bin codex-package.json codex-path codex-resources "$pkgdir$_app/"
  find "$pkgdir$_app" -type d -exec chmod 755 {} +

  install -dm755 "$pkgdir/usr/bin"
  ln -s "$_app/bin/codex" "$pkgdir/usr/bin/gapcode"
}
