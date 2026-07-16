# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=steamguard-cli-bin
pkgver=0.18.4
pkgrel=1
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
sha256sums_x86_64=('323d81bbe5809b56dd7023223b9d553d1fda58dc1ec2173c1e07cdfe1af89687')
sha256sums_aarch64=('693e03e971b4edae562c37273a55f0d0a1d6c848845c801edfa91bf4cc849049')

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
