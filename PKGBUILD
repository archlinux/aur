# Maintainer: Sherlock Holo <sherlock ya at gmail.com>
# Contributor Wimpy <vvinn.py[AT]@gmail.com>

pkgname=kimi-cli
pkgver=1.24.0
pkgrel=1
pkgdesc="Kimi Code CLI is your next CLI agent."
arch=('x86_64')
url="https://github.com/MoonshotAI/kimi-cli"
license=('Apache-2.0')

source=("https://github.com/MoonshotAI/kimi-cli/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('062827331e7a564c4dda678301d1a05f1610cbfd53b5b2b776338d2173ed2350')

makedepends=(
  uv
)

depends=(
  'python>=3.12'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Use uv to create an isolated virtual environment and install the current source code and all its dependencies
  uv venv "${srcdir}/venv" --clear
  VIRTUAL_ENV="${srcdir}/venv" uv pip install .

  # Ensure pykaos (which provides the kaos module) is installed in the virtual environment
  VIRTUAL_ENV="${srcdir}/venv" uv pip install pykaos
}

package() {
  local _target="/usr/lib/${pkgname}"

  mkdir -p "${pkgdir}${_target}"
  cp -a "${srcdir}/venv/." "${pkgdir}${_target}/"

  # Fix absolute paths in virtual environment scripts to point to the final installation location
  find "${pkgdir}${_target}/bin" -type f -executable -exec \
    sed -i "s|${srcdir}/venv|${_target}|g" {} +

  # Provide executable entry points
  install -d "${pkgdir}/usr/bin"
  ln -s "${_target}/bin/kimi" "${pkgdir}/usr/bin/kimi"
  ln -s "${_target}/bin/kimi-cli" "${pkgdir}/usr/bin/kimi-cli"

  # Install license
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

