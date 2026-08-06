# Maintainer: Aaron Coach <aur@awc.id.au>
_pkgname=qui
pkgname="${_pkgname}-bin"
pkgver=1.25.0
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
sha256sums_x86_64=('90812a241629f07aca28d158a6900c0496378c974b6ad30b926966bd30032de3')
sha256sums_aarch64=('38a7e8228f8679f1e8ac28ecb06ebad8a5f0a9ccaa0448779d5d7159fbda4484')

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
