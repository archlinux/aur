# Contributor: Sergio Tridente <tioduke at gmail dot com>

_pkgname=piimg
pkgname=piimg-git
pkgver=27.e7ce4ad
pkgrel=3
pkgdesc="A utility for working with disk images, which are designed to be flashed onto a Raspberry Pi."
arch=('i686' 'x86_64')
url="https://github.com/alexchamberlain/piimg"
license=('MIT')
depends=('parted')
makedepends=('git' 'make')
conflicts=('piimg')
provides=('piimg')
source=('git+https://github.com/alexchamberlain/piimg.git#branch=master'
        "correct_gcc_warnings.patch")
sha256sums=('SKIP'
            'ba7c72a845213c6f40ab228d67608be472229265d6d99274a8799ee09647cb95')


pkgver() {
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/${_pkgname}"
  patch -Np1 < ../correct_gcc_warnings.patch
}

build() {
  cd "$srcdir/${_pkgname}"
  make src
}

package() {
  mkdir -p "$pkgdir"/usr/{bin,share/{doc/${_pkgname},licenses/${_pkgname}}}
  install -gusers -oroot -m4750 "$srcdir/${_pkgname}"/src/piimg "$pkgdir"/usr/bin/
  install -m644 "$srcdir/${_pkgname}"/README.md "$pkgdir"/usr/share/doc/${_pkgname}/
  install -m644 "$srcdir/${_pkgname}"/LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/
}
