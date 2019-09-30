# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=git-spindle
pkgver=3.4.4
pkgrel=1
pkgdesc="Git subcommands for integrating with central services like github, gitlab and bitbucket"
arch=('any')
url="http://github.com/seveas/git-spindle"
license=('GPL3')
depends=('git' 'python' 'python-github3.py' 'python-whelk' 'python-docopt')
makedepends=('make' 'python-sphinx' 'python-sphinx_rtd_theme')
optdepends=()
source=("https://github.com/seveas/git-spindle/archive/${pkgver}.tar.gz")
sha256sums=('b4458268535cba2e7597335ffe1882fcb5b2a5132c18e84ed8452a712b678835')

prepare() {
  cd "${srcdir}/git-spindle-${pkgver}"

  # NOTE: Since we only build the man page, we tweak docs configuration so that
  # it does not require a sphinx theme.
  sed -i '/csp/d' "docs/conf.py"
}

build() {
  cd "$srcdir/git-spindle-${pkgver}"
  python setup.py build

  LANG=en_US.UTF-8 make -C docs man
}

package() {
  cd "$srcdir/git-spindle-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"

  install -d "$pkgdir/usr/share/man/man1/"
  install -m644 docs/_build/man/*.1 "$pkgdir/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
