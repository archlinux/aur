# Maintainer: Sayantan Khan <bolt.khan at gmail dot com>

pkgname=lean2-git
#_pkgver=0.2.0
pkgver=0.2.2
pkgrel=1
pkgdesc='Lean Theorem Prover 2'
arch=('x86_64')
url="https://github.com/Bolt64/lean2"
license=('Apache')
depends=('gmp' 'mpfr' 'lua>=5.2')
makedepends=('git' 'cmake' 'python' 'gperftools')
optdepends=('emacs: emacs mode')
conflicts=('lean-bin')
source=("$pkgname::git+https://github.com/Bolt64/lean2")
md5sums=(SKIP)

#pkgver() {
  #cd "$srcdir/$pkgname"
  #printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git describe --always)"
#}

#prepare() {
  #git clone https://github.com/Bolt64/emacs-dependencies "$pkgname"/src/emacs/dependencies
  #cd "$pkgname"/src/emacs # The following lines are to disable Flycheck, which seems to have some issues.
  #sed -e '/Flycheck\ init/,+4d' lean-mode.el > lean-mode.el.new
  #mv lean-mode.el lean-mode.el.old
  #mv lean-mode.el.new lean-mode.el
#}

build() {
  cd "$pkgname"
  cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr src/ \
    -DTCMALLOC=OFF # temporary workaround for a tcmalloc bug
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  "$pkgdir"/usr/bin/linja
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set et ts=2 sw=2:
