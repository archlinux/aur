# Maintainer: ThePirate42 <aur at thepirate42 dot org>

_name=mersenne-twister-predictor

pkgname=python-${_name}-git
pkgver=r28.772b58f
pkgrel=1
pkgdesc="Predicts outputs of Mersenne Twister (MT19937), a pseudorandom number generator"
arch=('any')
url="https://github.com/kmyk/${_name}"
license=('MIT')
provides=(python-${_name})
conflicts=(python-${_name})
depends=(python)
makedepends=(python-build python-installer python-setuptools git)
source=(${_name}::git+${url}.git https://mit-license.org/license.txt)
sha512sums=('SKIP'
            'c4fd34ef41d44454ebcfe0e3f4bcf3a9c54d04c384d3aab9d866c9cd957c44f65e2ed29d8ad15ec6729b102c9dd6dab4af368bd1c68e4f4fc7ad59becd4078ad')

pkgver(){
  cd "${srcdir}/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare(){
  git -C "${srcdir}/${_name}" clean -dfx
}

build(){
  cd "${srcdir}/${_name}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${srcdir}/${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
