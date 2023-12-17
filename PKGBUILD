# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-latex
pkgver=1.18.4
pkgrel=3
pkgdesc="A terminal client for hack.chat, with LaTeX support"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
conflicts=("hcclient")
depends=("python")
makedepends=("python-pip" "python-wheel") 
source=("v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('41140c9bbebf4571c410af485c0c524157d4bf51c08bd6197666af9ff09cea91')

build() {
  cd "${srcdir}/hcclient-${pkgver}"
  RELEASE_VERSION=true NO_ANSI=true bash scripts/build.sh
  echo "==> Creating isolated environment"
  python -m venv venv
  echo "  -> Installing dependencies"
  ./venv/bin/pip install --disable-pip-version-check --no-color --quiet dist/hcclient-${pkgver}-py3-none-any.whl[latex]
  echo "  -> Removing unnecessary packages and files"
  ./venv/bin/pip uninstall setuptools pip -y --quiet
  rm venv/bin/{activate*,Activate*}
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}/scripts/arch_entry.py" "${pkgdir}/usr/bin/hcclient"
  mkdir "${pkgdir}/opt"
  cp -a "${srcdir}/hcclient-${pkgver}/venv" "${pkgdir}/opt/hcclient"
  install -Dm644 "${srcdir}/hcclient-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
