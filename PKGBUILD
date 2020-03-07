# Maintainer: Dario Pellegrini <pellegrini dot dario at gmail dot com>

pkgname=bfg-git
_gitname=bfg-repo-cleaner
pkgver=r465.aeee9e3
pkgrel=1
pkgdesc='Removes large blobs like git-filter-branch does, but faster. Git version, no politics.'
url='https://github.com/rtyley/bfg-repo-cleaner'
arch=('any')
license=('GPL3')
depends=('java-runtime>8' 'bash')
makedepends=('sbt')
conficts=('bfg')
source=("git+https://github.com/rtyley/bfg-repo-cleaner.git"
        "bfg.sh"
        "clean.patch")
sha256sums=('SKIP'
            'a41ad8ff48364c1118e69f5c1c6c5c070d56ad1d2f9cd09bca3c095385a6b530'
            '99088f640a8ae89521eb5c5bfbdd96be348b1ccd6ba5072e4727247a04462782')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  patch --forward --strip=2 --input="${srcdir}/clean.patch"
}

build() {
  cd "$_gitname"
  sbt "bfg/assembly"
}

package() {
  install -DT -m755 "${srcdir}/bfg.sh" "${pkgdir}/usr/bin/bfg"
  install -DT -m644 "$(find . -name 'bfg*.jar')" "${pkgdir}/usr/share/java/bfg/bfg.jar"
}
