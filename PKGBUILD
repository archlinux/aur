# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=keepmenu
pkgver=1.4.0
pkgrel=1
pkgdesc="dmenu/rofi frontend for KeePass databases"
arch=('any')
url="https://github.com/firecat53/keepmenu"
license=('GPL3')
depends=('python' 'python-pykeepass' 'python-pynput')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
optdepends=('dmenu: dmenu backend'
            'rofi: rofi backend'
            'bemenu: bemenu backend'
            'wofi: wofi backend'
            'yofi: yofi backend'
            'xdotool: required for typing non-U.S. Unicode characters'
            'wtype: required for typing non-U.S. Unicode characters'
            'ydotool: required for typing non-U.S. Unicode characters'
            'pinentry: secure passphrase entry')

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('40daeac2dba6679be408dc52dbf1e4e0450a47374a6a0124a4ddc56ee5046f51')
install=${pkgname}.install

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i "s:\(\[tool.hatch.version\]\):\1\nfallback-version = \"${pkgver}\":" pyproject.toml
}

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 keepmenu.1 "${pkgdir}/usr/share/man/man1/keepmenu.1"
}
