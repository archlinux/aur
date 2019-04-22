# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Kazuo Teramoto <kaz.rag at gmail.com>

pkgname=afew-git
pkgver=1.3.0.r57.g3bb53db
pkgrel=1
epoch=1
pkgdesc='Initial tagging script for notmuch mail'
arch=(any)
url=https://github.com/afewmail/afew
license=('custom:BSD')
depends=('notmuch' 'python-chardet' 'python-dkim' 'python-setuptools')
makedepends=('git' 'python-setuptools-scm' 'python-sphinx')
provides=('afew')
conflicts=('afew')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd afew
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd afew
  python setup.py build egg_info
  export SETUPTOOLS_SCM_PRETEND_VERSION=1
  python setup.py build_sphinx -b man --version $pkgver
}

check() {
  cd afew
  python -m unittest discover afew/tests
}

package() {
  cd afew
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 build/sphinx/man/afew.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/afew LICENSE
}

# vim:set ts=2 sw=2 et:
