# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=keepmenu
pkgver=1.4.4
pkgrel=1
pkgdesc="dmenu/rofi frontend for KeePass databases"
arch=('any')
url="https://github.com/firecat53/keepmenu"
license=('GPL3')
depends=('python' 'python-pykeepass' 'python-pynput')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
optdepends=('dmenu: dmenu backend'
            'bemenu: bemenu backend'
            'wmenu: wmenu backend'
            'rofi: rofi backend'
            'wofi: wofi backend'
            'yofi: yofi backend'
            'tofi: tofi backend'
            'xdotool: required for typing non-U.S. Unicode characters'
            'wtype: required for typing non-U.S. Unicode characters'
            'ydotool: required for typing non-U.S. Unicode characters'
            'pinentry: secure passphrase entry')

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('b7bb4976810fecfd8097a9a9a6af62fe14fce421fba2e672429e711ff614d5b9')
install=${pkgname}.install

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i "s:^\(fallback-version = \).*:\1\"${pkgver}\":" pyproject.toml
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
