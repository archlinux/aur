# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=steamguard-cli-bin
pkgver=0.18.1
pkgrel=2
pkgdesc="A linux utility for generating 2FA codes for Steam and managing Steam trade confirmations."
arch=('x86_64' 'aarch64')
url='https://github.com/dyc3/steamguard-cli'
license=('GPL-3.0-or-later')
options=('!debug')

optdepends=(
    'bash-completion: bash completion'
    'zsh: zsh completion'
    'fish: fish completion'
    'elvish: elvish completion'
    'powershell: powershell completion'
)
provides=('steamguard-cli')
conflicts=('steamguard-cli' 'steamguard-cli-git')

source_x86_64=("steamguard-${pkgver}-x86_64::https://github.com/dyc3/steamguard-cli/releases/download/v${pkgver}/steamguard-linux-x86_64")
sha256sums_x86_64=('ea675060e802b9df728be3291c4fd0e894fd22a0299f0a3ea775e48ddd2f4e98')
sha256sums_aarch64=('521bea40147cfb42d48bae7a5398c342066c93143b9a4282f40604ce61ea73ce')

source_aarch64=("steamguard-${pkgver}-aarch64::https://github.com/dyc3/steamguard-cli/releases/download/v${pkgver}/steamguard-linux-aarch64")

latestver() {
	gh api --paginate repos/dyc3/steamguard-cli/releases --jq \
		'.[] | select(.prerelease == false and .draft == false) | .tag_name' |
		sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
	install -Dm755 "${srcdir}/steamguard-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/steamguard"

    # Generate shell completions
    "${pkgdir}/usr/bin/steamguard" completion --shell bash | \
      install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/steamguard"
    "${pkgdir}/usr/bin/steamguard" completion --shell zsh | \
      install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_steamguard"
    "${pkgdir}/usr/bin/steamguard" completion --shell fish | \
      install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/steamguard.fish"
    "${pkgdir}/usr/bin/steamguard" completion --shell elvish | \
      install -Dm644 /dev/stdin "${pkgdir}/usr/share/elvish/lib/steamguard.elv"
    "${pkgdir}/usr/bin/steamguard" completion --shell powershell | \
      install -Dm644 /dev/stdin "${pkgdir}/usr/share/powershell/completions/steamguard.ps1"
}
