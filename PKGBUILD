# Maintainer:  Humble Penguin <humblepenguinn@gmail.com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="envio"
pkgname="${_pkgname}-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc="A Modern And Secure CLI Tool For Managing Environment Variables"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://envio-cli.github.io/home"
_url="https://github.com/envio-cli/${_pkgname}"
license=(
  'Apache-2.0 OR MIT'
)
depends=(
  'dbus'
  'glibc'
  'gpgme'
  'libgcc'
  'libgpg-error'
)
makedepends=(
  'patchelf'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
source_i686=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-i686-unknown-linux-gnu.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=('e2a0c6d7ef28072da8a51cb9705fd0ee7b0714fe851708e724e09b000178b192')
sha256sums_i686=('db01aa6decbf75a8b57ac7705671b045a3a896117eba9a3b3d80bdce226ba2e7')
sha256sums_x86_64=('51a2d7fe3706a6434ae87e26fdf6aa881b5c60391a90ccef581ba561e6a810da')

prepare() {
  cd "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu"
  patchelf --replace-needed libgpgme.so.11 libgpgme.so "${_pkgname}"
}

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
  install -vDm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgname}.1"  "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  cd "autocomplete"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "_${_pkgname}.ps1" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "_${_pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
