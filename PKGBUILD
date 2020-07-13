# Maintainer: mocihan <ly50247@126.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=just-git
_realname="${pkgname%-git}"
pkgver=0.6.1.r1.cea4a16
pkgrel=1
pkgdesc="A handy way to save and run project-specific commands"
arch=("i686" "x86_64")
url="https://github.com/casey/${_realname}"
license=("custom:CC0")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("${_realname}")
conflicts=("${_realname}")
source=("${_realname}::git+https://github.com/casey/${_realname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_realname}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  cd "${srcdir}/${_realname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_realname}"
  install -Dm755 "target/release/${_realname}" "${pkgdir}/usr/bin/${_realname}"
  install -Dm644 "man/${_realname}.1" "${pkgdir}/usr/share/man/man1/${_realname}.1"
  install -Dm644 README.adoc "${pkgdir}/usr/share/doc/${_realname}/README.adoc"
  install -Dm644 GRAMMAR.md "${pkgdir}/usr/share/doc/${_realname}/GRAMMAR.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
}
