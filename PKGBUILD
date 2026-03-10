# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=steamguard-cli-bin
pkgver=0.17.1
pkgrel=7
pkgdesc="A linux utility for generating 2FA codes for Steam and managing Steam trade confirmations."
arch=('x86_64')
url='https://github.com/dyc3/steamguard-cli'
license=('GPL3')
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
source=(
	"https://github.com/dyc3/steamguard-cli/releases/download/v${pkgver}/steamguard"
)
sha256sums=('dfde53c5f594815b69349e6b70cbb26fbf9ddb30938aa13352048967279ac501')

latestver() {
	curl -fsSI 'https://github.com/dyc3/steamguard-cli/releases/latest/download/steamguard' | tr -d '\r' |
	sed -nE 's#^location: .*/download/v?([^/]+)/.*$#\1#p'
}

package() {
	install -Dm755 "${srcdir}"/steamguard "${pkgdir}/usr/bin/steamguard"

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
