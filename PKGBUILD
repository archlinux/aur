# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient
pkgver=1.18.4
pkgrel=5
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
depends=("python")
makedepends=("python-pip" "python-wheel" "python-poetry") 
source=("v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('41140c9bbebf4571c410af485c0c524157d4bf51c08bd6197666af9ff09cea91')

build() {
  cd "${srcdir}/hcclient-${pkgver}"
  sed -i "s/-git//g" src/hcclient/__main__.py \
                     src/hcclient/client.py \
                     src/hcclient/config.py \
                     src/hcclient/formatter.py \
                     src/hcclient/hook.py
  python -m venv iso-env
  python -m venv .venv
  poetry build -f wheel --no-ansi --no-interaction
  ./iso-env/bin/pip install --disable-pip-version-check --no-color "dist/hcclient-${pkgver}-py3-none-any.whl"
  ./iso-env/bin/pip uninstall setuptools pip -y --quiet
  rm iso-env/bin/{activate*,Activate*}
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}/scripts/arch_entry.py" "${pkgdir}/usr/bin/hcclient"
  mkdir "${pkgdir}/opt"
  cp -a "${srcdir}/hcclient-${pkgver}/iso-env" "${pkgdir}/opt/hcclient"
  install -Dm644 "${srcdir}/hcclient-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
