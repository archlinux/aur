# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="nvidia_oc"
pkgname="${_pkgname}-bin"
pkgver=0.1.24
pkgrel=2
pkgdesc="A simple CLI tool to overclock Nvidia GPUs using the NVML library on both X11 and Wayland"
arch=(
  'x86_64'
)
url="https://github.com/Dreaming-Codes/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'gcc-libs'
  'glibc'
  'nvidia-utils'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
backup=(
  "etc/${_pkgname}.json"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/LICENSE"
  "${_pkgsrc}.json::${url}/raw/refs/tags/${pkgver}/example_config.json"
  "${_pkgname}.service"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}"
)
sha256sums=('6d9997a21a592c51dfe6ab5b1aac01057bb2ed0360b30c9c48ebed0d693fb809'
            '8cbfb03e85b70d711832f97ef78f078c6bc7a5353b198243fad29970b2b53a32'
            '487c6618028eac7b09864734385c4aa655aac9d3f52b8f9bddfd21519b5f4290'
            '52dc46fdef83eea69e3eb34d2a8fd54a5a5e0c0d62dae0e1864e4ee44d7d6b10')
sha256sums_x86_64=('7692c8b08531ea642926de5fdb058bab6f423616379e0216a15046f11870d16f')

prepare() {
  cd "${srcdir}"
  chmod +x ./"${_pkgsrc}-${CARCH}"
  mkdir -p "completions"
}

build() {
  cd "${srcdir}"
  for _sh in bash elvish fish powershell zsh; do
    ./"${_pkgsrc}-${CARCH}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.json"      "${pkgdir}/etc/${_pkgname}.json"

  install -vDm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  cd "completions"
  install -vDm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.elvish"     "${pkgdir}/usr/share/elvish/lib/${_pkgname}.elv"
  install -vDm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
