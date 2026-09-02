# Maintainer: Aaron Coach <aur@awc.id.au>
_pkgname=qui
pkgname="${_pkgname}-bin"
pkgver=1.28.0
pkgrel=1
pkgdesc="A modern alternative webUI for qBittorrent (Pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/autobrr/qui"
license=('GPL-2.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
  "${_pkgname}.service"
  "${_pkgname}.sysusers"
  "${_pkgname}.tmpfiles"
)

sha256sums=('d52299510cf4845f0514eefd492b01c33bc2cd2819c2be9dc157f50f67462bd2'
            'ac49b4d6ae748334f7fa360d8dd58c7cd09ba5e062249666ab380d451b7925dd'
            '3bacde8867fbb7b6d566666b635589579c1cc079cd23418284f43a7b37f0c41b')
sha256sums_x86_64=('e65a994b5ef6933cd2a5a6a88feb2fa941329688637d4e988fc29989e7a621a4')
sha256sums_aarch64=('5f2f940194392e67913d83b73a512a0d7fcaa0a7a9b174e838a7b58b7b5f6329')

source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz"
)

source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz"
)

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/qui/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/qui/README.md"

  # Generate and install shell completions.
  local _target_bin="${srcdir}/${_pkgname}"
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  "$_target_bin" completion bash >"${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  "$_target_bin" completion zsh >"${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
  "$_target_bin" completion fish >"${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
