# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=git-spindle-git
pkgver=3.3.r16.g6b55b7f
pkgrel=2
pkgdesc="Git subcommands for integrating with central services like github, gitlab and bitbucket"
arch=('any')
url="http://github.com/seveas/git-spindle"
license=('GPL3')
depends=('git' 'python' 'python-github3.py' 'python-whelk' 'python-docopt')
makedepends=('make' 'python-sphinx')
optdepends=()
provides=('git-spindle')
conflicts=('git-spindle')
# NOTE: we need to use a patched version to adapt to github3.py
# source=("git+https://github.com/seveas/git-spindle.git")
source=("git+https://github.com/aroig/git-spindle.git")
md5sums=('SKIP')

pkgver() {
  git --git-dir="$srcdir/git-spindle/.git" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # NOTE: Since we only build the man page, we tweak docs configuration so that
  # it does not require a sphinx theme.
  sed -i '/csp/d' "$srcdir/git-spindle/docs/conf.py"
}

build() {
  cd "$srcdir/git-spindle"
  python setup.py build

  cd "$srcdir/git-spindle/docs"
  LANG=en_US.UTF-8 make man
}

package() {
  cd "$srcdir/git-spindle"
  python setup.py install --prefix=/usr --root="$pkgdir"

  cd "$srcdir/git-spindle/docs"
  install -d "$pkgdir/usr/share/man/man1/"
  install -m644 _build/man/*.1 "$pkgdir/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
