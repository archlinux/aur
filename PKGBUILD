# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=gemini-cli-proxy-git
_pkgname=gemini-cli-proxy
pkgver=r15.3e99ede
pkgrel=6
pkgdesc="OpenAI-compatible API wrapper for Gemini CLI."
arch=('any')
url="https://github.com/nettee/gemini-cli-proxy"
license=('MIT')
depends=('python-fastapi' 'uvicorn' 'python-click' 'python-pydantic' 'python-slowapi' 'python-limits' 'python-uvloop' 'python-httptools')
optdepends=('gemini-cli')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'git')
provides=('gemini-cli-proxy')
conflicts=('gemini-cli-proxy')
install=${_pkgname}.install
source=("git+https://github.com/nettee/${_pkgname}.git"
        "${_pkgname}.service")
sha256sums=('SKIP'
            'e8c99a1de22f9c9ce5fedfce7ea2746cc64710ddc99cf566bd8800ac68dd4e68')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -m644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
