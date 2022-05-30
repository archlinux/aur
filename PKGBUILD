# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-specification
pkgver=r393.dba688e
pkgrel=1
pkgdesc='Specification for the Hare programming language'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-specification'
license=('custom:CC-BY-ND')
makedepends=(
  'git'
  'texlive-core'
  'texlive-latexextra'
  'texlive-fontsextra'
)
_commit='dba688e94c603cc451e77b90f658650f41aa26a4'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  # generate license file
  sed \
    -n '/^\\section.*/,//p' \
    introduction.tex | \
  sed \
    -e 's/\\section{\(.*\)}/\1/' \
    -e 's/\\textcopyright //' \
    -e 's/\\informative{//' \
    -e 's/}//' \
  > LICENSE

}

build() {
  cd "$pkgname"

  make
  make # for the ToC
}

package() {
  cd "$pkgname"

  # spec
  install -vDm644 -t "$pkgdir/usr/share/doc/hare" specification.pdf

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
