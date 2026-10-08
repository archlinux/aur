# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
pkgname=testlib-git
pkgver=r457.1e4e8a2
pkgrel=1
pkgdesc='C++ implementation of the testlib used on many programming contests in Russia (Russian National Olympiad in Informatics, different stages of ACM-ICPC).'
arch=('any')
url='https://github.com/MikeMirzayanov/testlib'
license=('MIT')
makedepends=('git')
# Source-only package: without this, makepkg emits a useless testlib-git-debug.
options=('!debug')
source=("${pkgname%-git}::git+https://github.com/MikeMirzayanov/testlib.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"

  # Upstream tags are sparse and stale (latest 0.9.41, 2023), so track the
  # commit count instead: r<commits>.<short-sha>.
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm644 testlib.h "${pkgdir}/usr/include/testlib.h"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Checker / generator / interactor / validator examples.
  for component in checkers generators interactors validators; do
    install -Dm644 -t "${pkgdir}/usr/share/testlib/${component}" "${component}"/*.cpp
  done
}
