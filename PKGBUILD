# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dankcli-git
pkgver=0.5.8.r2.fbb8058
pkgrel=1
pkgdesc="CLI Image Captioning Tool or Meme Generator which automatically adds whitespace and text to top"
arch=('any')
provides=('dankcli')
url='https://github.com/sggts04/dankcli'
license=('MIT')
depends=('python-pillow')
makedepends=('python-setuptools')
source=("dankcli::git+${url}")
sha256sums=('SKIP')

pkgver() {
  _version=$(awk '/version/{print substr($1,10,5)}' ${srcdir}/dankcli/setup.py)
  printf "$_version.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/dankcli
  python setup.py build
  echo "#!/usr/bin/env bash
  python -m dankcli \$1 \$2" > dankcli.sh
}

package() {
  cd ${srcdir}/dankcli
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 dankcli.sh "${pkgdir}/usr/bin/dankcli"
}