# Maintainer: Olaf Wriggers <olaf@olwig.xyz>
# Maintainer: Eric Lee <well dot dragonfly dot aaww at mask dot me>

pkgname=grok-build-bin
pkgver=1.0.4
pkgrel=2
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

b2sums_x86_64=('79a1fa9bcace912194d15260e3cd391fc860826df2c2dc7b6abc8f3669192812f60856a2913ea5e3f5c898af7c5ec2e9bbc782e18737fe5a50f73c120710ff6e')
b2sums_aarch64=('65bf89e91d863723803c24b4a4d0292346dd7dc711d1819b413410e0f14c545ef4deb544d0515a9012273705908151d21f02ddd8e7abc1f2455333d531d6b70a')
b2sums=(
  'd71170807c24118616aa2c4a1c2927bd4408ed6a7694bb02ad007aa5fad8939d42f586d576c1fd3d4e505e0eeb715443cdadcf268750807c860eb28c23ba53fa'
  '4d37a050b4fa861b2ee076940908f4dfef7419e6297425bb3dfe6c26fcb9440b01befff1837451b9bed194ee45a3f52e30b040bd356b32a5bb178ede6aea694e'
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
