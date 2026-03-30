# Maintainer: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=flathub-repro-checker
pkgver=v0.2.1.r3.g5319960
pkgrel=1
pkgdesc="A tool to rebuild Flatpak apps published on Flathub and compare reproducibility using diffoscope"
arch=("any")
url="https://github.com/flathub-infra/flathub-repro-checker"
license=("MIT")

depends=(
  "flatpak-builder"
  "diffoscope"
  "python-boto3"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-pytest"
)
optdepends=()

source=("${pkgname}::git+https://github.com/flathub-infra/flathub-repro-checker.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  python -m pytest
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
