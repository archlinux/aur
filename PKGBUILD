# Maintainer: Olaf Wriggers <olaf@olwig.xyz>
# Maintainer: Eric Lee <well dot dragonfly dot aaww at mask dot me>

pkgname=grok-build-bin
pkgver=1.0.89
pkgrel=1
pkgdesc="SpaceXAI's coding agent harness and TUI. Fullscreen, mouse interactive, extensible."
arch=(
  'x86_64' 
  'aarch64'
)
url="https://x.ai/build"
license=('Apache-2.0')
provides=('grok')
conflicts=('grok')
options=('!strip' '!debug' '!emptydirs')

backup=('etc/grok/requirements.toml')

source_x86_64=("grok-$pkgver-x86_64::https://x.ai/cli/grok-${pkgver}-linux-x86_64")
source_aarch64=("grok-$pkgver-aarch64::https://x.ai/cli/grok-${pkgver}-linux-aarch64")
source=(
  "LICENSE.grok::https://raw.githubusercontent.com/xai-org/grok-build/refs/heads/main/LICENSE"
  "requirements.toml"
)

b2sums_x86_64=('3fbcd851c9043d7b306e2454821f6048e7a03823403ebaa6a23e2d411bf38aaf3a9261b6a275c335f0856ee35d7cf41649e58840571338f3f6a801bed5d0df37')
b2sums_aarch64=('789250e1ae4c41b54d4954fcda48b88782e8d7e9b76dcaf863ed6149487a3a8db44836523e01114f20e2bb3483b3522bae63dc3d80146fb8caa6d902b0deb0ef')
b2sums=(
  'd71170807c24118616aa2c4a1c2927bd4408ed6a7694bb02ad007aa5fad8939d42f586d576c1fd3d4e505e0eeb715443cdadcf268750807c860eb28c23ba53fa'
  '37b586af90c67f7a8cfb778d3408d60c87f81cd5aff6c52ed8e091c741446543f5aaecf773160f4cf29005bded1c653f2e62868b851e9470914dded3e585c58e'
)

# TODO default "ultra" sandbox -> https://docs.x.ai/build/features/sandbox
# TODO restrict with explicit local grok user

package() {

  install -Dm755 "$srcdir/grok-$pkgver-$CARCH" "$pkgdir/usr/bin/grok"
  install -Dm644 "$srcdir/LICENSE.grok" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/requirements.toml" "$pkgdir/etc/grok/requirements.toml"

  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"

  "$pkgdir/usr/bin/grok" completions bash > "$pkgdir/usr/share/bash-completion/completions/grok" || true
  "$pkgdir/usr/bin/grok" completions zsh  > "$pkgdir/usr/share/zsh/site-functions/_grok" || true
  "$pkgdir/usr/bin/grok" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/grok.fish" || true
}
