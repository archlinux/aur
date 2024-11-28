# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-astc-encoder-py-git
pkgver=r53.a0d704a
pkgrel=1
pkgdesc="A Python binding of astc-encoder."
arch=('x86_64')
url="https://github.com/K0lb3/astc-encoder-py"
license=('MIT')
provides=('python-astc-encoder-py')
conflicts=('python-astc-encoder-py')
depends=(
  'python'
  'python-archspec'
)
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')

source=("git+https://github.com/K0lb3/astc-encoder-py.git"
        "git+https://github.com/ARM-software/astc-encoder.git")
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd astc-encoder-py
  git submodule init
  git config submodule.libs/libdep.url "$srcdir/lib-dependency"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd astc-encoder-py
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd astc-encoder-py
  pytest -v --cov || true
}

package() {
  cd astc-encoder-py
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
