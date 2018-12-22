# Maintainer: DanManN <dnahimov@gmail.com>
_pkgname=better-apidoc
pkgname=python-$_pkgname-git
pkgver=0.2.0.r26.0aa3bb3
pkgrel=3
pkgdesc="A version of sphinx-apidoc with support for templating."
arch=('any')
url="https://github.com/goerz/better-apidoc"
license=('FreeBSD')
depends=('python' 'python-sphinx')
makedepends=('git' 'python-setuptools' 'python-sphinxcontrib-websupport')
provides=('python-better-apidoc')
conflicts=('python-better-apidoc')
source=("git+https://github.com/goerz/better-apidoc.git")
md5sums=('SKIP')

prepare() {
  cd better-apidoc
  git checkout $(curl https://api.github.com/repos/goerz/better-apidoc/releases | grep tag_name| cut -d '"' -f4 | head -n 1)
}

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(cat better_apidoc.py | grep -i version | grep -v '#' | cut -d "'" -f2 | head -n 1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  sed -i "s/sphinx\.quickstart/sphinx.cmd.quickstart/" better_apidoc.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
