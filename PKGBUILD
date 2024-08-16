# Maintainer: weilinfox <caiweilin at iscas.ac.cn>

pkgname=ruyi
pkgver=0.16.0
pkgrel=3
pkgdesc="RuyiSDK Package Manager"
arch=(any)
url="https://github.com/ruyisdk/ruyi"
license=(Apache-2.0)
depends=('python>=3.11' 'python-arpy' 'python-certifi' 'python-frontmatter' 'python-jinja' 'python-packaging' 'python-pygit2' 'python-requests' 'python-rich' 'python-semver' 'python-tomlkit' 'python-xingque' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
optdepends=('android-tools' 'bzip2' 'curl' 'coreutils' 'gzip' 'sudo' 'tar' 'unzip' 'wget' 'xz' 'zstd')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ruyisdk/ruyi/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dc9e3d76f93953a58492dc4e8c95cece3cfac0e546e4f3eaf051f67951ef8bd1')
sha512sums=('136d9b7b6cf93cb1dd9b8385a28d87b9e993111025bb307d77c90cff993baf60af02af2bc98efa5680a4b9297b83b2a604da1d4ae114223cf7028a0bcde93f77')
provides=(python-ruyi)

build() {
  cd "$pkgname-$pkgver"

  python -m build -nw
}

check() {
  cd "$pkgname-$pkgver"

  pytest -v
}

package() {
  cd "$pkgname-$pkgver"

  pv=`python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}");'`

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/python${pv}/site-packages/ruyi/__main__.py" "${pkgdir}/usr/bin/ruyi"
}
