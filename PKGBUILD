# Maintainer: nizne nizne@outlook.com
_pkgname=zeroclaw
pkgname=${_pkgname}-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Private AI Assistant that runs entirely on your machine (prebuilt binary)."
arch=('x86_64' 'aarch64')
url="https://github.com/zeroclaw-labs/zeroclaw"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("zeroclaw" "zeroclaw-git")
options=('!strip' '!debug')
source=("LICENSE-MIT::https://raw.githubusercontent.com/zeroclaw-labs/${_pkgname}/v${pkgver}/LICENSE-MIT"
        "LICENSE-APACHE::https://raw.githubusercontent.com/zeroclaw-labs/${_pkgname}/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/zeroclaw-labs/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/zeroclaw-labs/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('69ad6d0b3c96424e823dd77c3625682fefbf7cc2871a624fa38f5d762c4bcc94'
            '62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a')
sha256sums_x86_64=('efbf182650e0a1069b61aee28e79805e326e4bf805ae31da1b97f51a4b3c0ef8')
sha256sums_aarch64=('8ab323372ce004869f82e16ff7e651bfab03843da7c75c6dc2b168e68e5a281d')

package() {
  # ZeroClaw upstream manages services at runtime via `zeroclaw service install`
  # (user-level systemd/OpenRC), so this package only installs the CLI binary,
  # licenses, and shell completions.
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  "${srcdir}/${_pkgname}" completions bash > "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  "${srcdir}/${_pkgname}" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  "${srcdir}/${_pkgname}" completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
