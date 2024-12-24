# Maintainer: Self Denial <selfdenial@pm.me>
pkgname='screenshot_llm-git'
_pkgname='Screenshot_LLM'
pkgdesc='AI-Powered Screenshot Analysis'
pkgver=1.0.1.r2.g0ccc623
_pkgver=${pkgver##*.}
pkgrel=3
arch=('x86_64')
url="https://github.com/ThanabordeeN/${_pkgname}"
license=('MIT')
conflicts=("${pkgname%-git}")
depends=('python' 'tk' 'python-dotenv' 'python-markdown')
makedepends=('git')
optdepends=('ollama: ollama support.')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
  cp -r "${srcdir}/${pkgname}/"* "${pkgdir}/usr/lib/${_pkgname}"

  # Add script symlink under /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/lib/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname,,}"

  # Install service
  install -D -m 644 "${srcdir}/${pkgname}/systemd/user/${_pkgname,,}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname,,}.service"
  install -D -m 644 "${srcdir}/${pkgname}/systemd/Screenshot_LLM_systemd.desktop" "${pkgdir}/usr/share/applications/Screenshot_LLM.desktop"

  echo "********************"
  echo "To enable and start the service:"
  echo "mkdir -p ~/.screenshot_llm"
  echo "systemctl --user enable --now ${_pkgname,,}.service"
  echo "********************"
}
