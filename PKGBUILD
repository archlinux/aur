# Maintainer: Self Denial <selfdenial@pm.me>
pkgname='Screenshot_LLM'
pkgdesc='AI-Powered Screenshot Analysis'
pkgver='eeb440e'
_pkgver='main'
pkgrel='1'
arch=('x86_64')
url="https://github.com/ThanabordeeN/${pkgname}"
license=('MIT')
depends=('python' 'tk' 'python-dotenv' 'python-markdown')
optdepends=('ollama: ollama support.')
source=("${pkgname}-${_pkgver}::git+${url}.git" "${url}/pull/3.patch")
b2sums=('SKIP' 'SKIP')

pkgver() {
  cd "${pkgname}-${_pkgver}"
  git rev-parse --short HEAD || echo 0.0.1
}

prepare() {
  patch --directory="${pkgname}-${_pkgver}" --forward --strip=1 --input="${srcdir}/3.patch"
}

package() {
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${_pkgver}/"* "${pkgdir}/usr/lib/${pkgname}"

  # Add script symlink under /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname,,}"

  # Install service
  install -D -m 644 "${srcdir}/${pkgname}-${_pkgver}/systemd/user/${pkgname,,}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname,,}.service"
  install -D -m 644 "${srcdir}/${pkgname}-${_pkgver}/systemd/Screenshot_LLM_systemd.desktop" "${pkgdir}/usr/share/applications/Screenshot_LLM.desktop"

  echo "********************"
  echo "To enable and start the service:"
  echo "systemctl --user enable --now ${pkgname,,}.service"
  echo "********************"
}
