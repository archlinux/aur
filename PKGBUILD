# Maintainer: Olaf Wriggers <olaf@olwig.xyz>
# Maintainer: Eric Lee <well dot dragonfly dot aaww at mask dot me>

pkgname=grok-build-bin
pkgver=1.0.24
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

b2sums_x86_64=('a57fd6f8ea279a61ebc183576820f02de0cbf419d8d126415a744e759f2f6d066ecdbfb8dfcc5aca696ce3635e3528d98e3cff3822212d9034c3bfd4ec601638')
b2sums_aarch64=('dae7edcce514a34f17c207220359125d6b38d14293a35e7aeaec3d378774ba9b251ecba9db667fe0bb86b544b7341d63807bf7fa41e3464263c957ff073fab48')
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
