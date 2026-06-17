# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tencentcloud-cli-intl-en'
pkgver=3.1.114.1
pkgrel=1
pkgdesc='Tencent Cloud API 3.0 Command Line Interface'
url='https://github.com/TencentCloud/tencentcloud-cli-intl-en'

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
conflicts=('tencentcloud-cli')
source=(
  "${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('4ceb2163e0a1e562a24a7527530a09a671cdd9544a1d7b66b2a54a683daa47bc')

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
