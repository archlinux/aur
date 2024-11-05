# Maintainer: Self Denial <selfdenial@pm.me>
pkgname='screenshot_llm'
_pkgname='Screenshot_LLM'
pkgdesc='AI-Powered Screenshot Analysis'
pkgver='1.0.1'
pkgrel='2'
arch=('x86_64')
url="https://github.com/ThanabordeeN/${_pkgname}"
license=('MIT')
conflicts=("${pkgname}-git")
depends=('python' 'tk' 'python-dotenv' 'python-markdown')
optdepends=('ollama: ollama support.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz" "${url}/pull/6.patch" "https://github.com/lainedfles/Screenshot_LLM/pull/1.patch")
b2sums=('3ec6546fbedcd101af3b17f3649a05534568400491707fa918c542d73325f2c867a511fffddd9c99221aa94e3128f198754167388150e0e4b6327b5f82f8db6e'
        '6c5b10db8bce8d1ba14a07b547c70f0c86e2902cdf7373e9c67c6d491143c0bf084dcbec92ef70bc7ae0810125f28b40d70de0720e9a0b1f514c52678004fac4'
        '047aa5fb3e5a5e5263b9c802b9b779a070a8d3192030e747ceaa39ae48b5552f2f62f35e5affc8c9e5b9907f2eb7e54e8b0f2498890f5d193e12e9e5e4b54d1c')

prepare() {
  patch --directory="${_pkgname}-${pkgver}" --forward --strip=1 --input="${srcdir}/6.patch"
  patch --directory="${_pkgname}-${pkgver}" --forward --strip=1 --input="${srcdir}/1.patch"
}

package() {
  mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/usr/lib/${_pkgname}"

  # Add script symlink under /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/lib/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname,,}"

  # Install service
  install -D -m 644 "${srcdir}/${_pkgname}-${pkgver}/systemd/user/${_pkgname,,}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname,,}.service"
  install -D -m 644 "${srcdir}/${_pkgname}-${pkgver}/systemd/Screenshot_LLM_systemd.desktop" "${pkgdir}/usr/share/applications/Screenshot_LLM.desktop"

  echo "********************"
  echo "To enable and start the service:"
  echo "systemctl --user enable --now ${_pkgname,,}.service"
  echo "********************"
}
