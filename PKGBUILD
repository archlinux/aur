# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-dhall
pkgver=0.1.5
pkgrel=2
pkgdesc="Python bindings for dhall, a functional configuration language"
arch=('x86_64' 'i686')
url="https://pypi.org/project/dhall"
license=('Apache' 'MIT')
depends=('python' 'openssl')
makedepends=('python-pip' 'cargo' 'maturin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/s-zeng/dhall-python/archive/v${pkgver}.tar.gz"
        dhall-update.patch)
sha256sums=('bfdf5a788fb2afe8828d541e4ed6926dea504451d2acb0cf542ea0e1c38dd1e5'
            'e1e8d97d84785a1a1e1547673af0d892a8d79b12d9c72495cc1598bbf84de8b5')
b2sums=('4a6a8bd9647428726273d0a7701ef3bd2b0b51bcf03be6e71eb2890b88bf7f76515c1f3715b8019c982a55247e863ca27596e9a106a0f4b6c41c71b5a87875c0'
        '32f826ddb772a1ec4278c220c53c873c6d61756aba8db1806111a305d1073c3dc8ea09f1c1531e4be6f6ce4fcd39019de2b65d8c6125fbd1e36d61f116906509')

prepare() {
  cd "dhall-python-${pkgver}"

  patch -Np1 -i "${srcdir}/dhall-update.patch"
}

build() {
  cd "dhall-python-${pkgver}"

  maturin build --release --manylinux off
}

package() {
  cd "dhall-python-${pkgver}"

  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated --root="${pkgdir}" --ignore-installed --no-deps \
    target/wheels/dhall-${pkgver}-*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-*
}
