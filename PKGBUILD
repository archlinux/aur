# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tencentcloud-cli'
pkgver=3.0.1411.1
pkgrel=1
pkgdesc='Tencent Cloud API 3.0 Command Line Interface'
url='https://github.com/TencentCloud/tencentcloud-cli'

_execname='tccli'
license=('Apache-2.0')
arch=('any')
depends=(
  tencentcloud-sdk-python
  python
  python-six
  python-jmespath
)
optdepends=()
makedepends=(git python-build python-installer python-setuptools python-wheel python-hatchling)
conflicts=('tencentcloud-cli-intl-en')
source=(
  "${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('27acf6f69140335b83e975baf3d35894ea1581f8132033298335b1c59a60208b')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
      cat > completion.bash << 'EOF'
#!/bin/bash
complete -C 'tccli_completer' tccli
EOF
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/${_execname}"
}
