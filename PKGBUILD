# Maintainer: Jguer <pkgbuilds at jguer.space>
pkgname=yay-bin
pkgver=13.1.0
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Jguer/yay"
license=('GPL-3.0-or-later')
depends=(
  'pacman>6.1'
  'git'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
provides=('yay')
conflicts=('yay')

source_x86_64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_x86_64.tar.gz")
source_aarch64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_aarch64.tar.gz")
source_armv7h=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_armv7h.tar.gz")

sha256sums_x86_64=('18acab0ff3aa3927eba21cd774bac52cfd6dd366dc68b0d1a12b10120190cd3c')
sha256sums_aarch64=('be9bde82b0ae601365bf38515a4bfe60840a0b9945994cc8631a974c0492aa2c')
sha256sums_armv7h=('92b4efa177c5820ce849b7933d67cff297b1a671c3a55580a83eaf030763077d')

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${CARCH}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/yay.8" "${pkgdir}/usr/share/man/man8/yay.8"

  # Shell autocompletion script
  install -Dm644 "${_output}/bash" "${pkgdir}/usr/share/bash-completion/completions/yay"
  install -Dm644 "${_output}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_yay"
  install -Dm644 "${_output}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"

  for locale in "${_output}"/*.mo; do
    lang="${locale##*/}"
    install -Dm644 "${locale}" "${pkgdir}/usr/share/locale/${lang%.mo}/LC_MESSAGES/yay.mo"
  done
}
