# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >

# General package information
pkgname=shlide-git
pkgver=r45.2e825ef
pkgrel=1
pkgdesc="A slide deck presentation tool written in pure bash."
url="https://github.com/icyphox/shlide"
license=("MIT")
arch=("any")

# Dependencies
depends=()
makedepends=("git" "scdoc")

# Download information
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

# https://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines#Git
pkgver() {
  cd "${srcdir}/${pkgname}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"

  # Create man page
  scdoc < shlide.1.scd > shlide.1
}

package() {
  cd "${srcdir}/${pkgname}"

  # shlide "binary"
  make DESTDIR="${pkgdir}" install

  # man page
  install -D -m644 shlide.1 "${pkgdir}/usr/share/man/man1/shlide.1"
}
