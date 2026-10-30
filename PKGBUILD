# Maintainer: Susurri <susurrus dot silent at gmail dot com>
# Contributor: Miten <git dot pub at icloud dot com>
# Contributor: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-bin
pkgver=6.4.2
pkgrel=1
pkgdesc="Binary builds of the Swift programming language"
arch=('x86_64' 'aarch64')
url="https://www.swift.org/"
license=('apache')
depends=('util-linux-libs' 'libxml2-legacy' 'ncurses')
makedepends=('patchelf')
optdepends=('python312: required for REPL')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source_x86_64=("https://download.swift.org/swift-$pkgver-release/ubi10/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-ubi10.tar.gz")
source_aarch64=("https://download.swift.org/swift-$pkgver-release/ubi10-aarch64/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-ubi10-aarch64.tar.gz")
sha256sums_x86_64=('d2663c735fd2a5a6d2a004a5701f77df14ff93b9e5ea54815e8616832058bfbf')
sha256sums_aarch64=('236a49a0e848a6359937044ec125896f76a4f5284c99a954468e3bb93429c258')

package() {
  _swift_root="/usr/lib/swift/usr"
  find_elf_only() {
    find "${pkgdir}${_swift_root}" \
      -executable -type f \
      '(' -path '*/bin/*' -o -name '*.so*' ')' \
      -not '(' -name '*.py' -o -name 'hwasan_symbolize' ')' \
      "$@"
  }

  _archsuffix=""
  if [[ $CARCH == "aarch64" ]]; then
    _archsuffix="-aarch64"
  fi
  mkdir -p "${pkgdir}${_swift_root}"
  cp -Ppr "${srcdir}/swift-$pkgver-RELEASE-ubi10${_archsuffix}"/usr/* "${pkgdir}${_swift_root}"

  # Symlink the desired binaries to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  for bin in sourcekit-lsp swift swiftc; do
    ln -s "${_swift_root}/bin/$bin" "${pkgdir}/usr/bin/$bin"
  done

  # Patch the binaries to use the changed ncurses names
  patchelf=(patchelf)
  for lib in ncurses panel form; do
    patchelf+=(--replace-needed "lib${lib}.so.6" "lib${lib}w.so")
  done
  find_elf_only -exec "${patchelf[@]}" {} \;

  install -dm755 "${pkgdir}/etc/ld.so.conf.d"
  echo '${_swift_root}/lib/swift/linux' >> "${pkgdir}/etc/ld.so.conf.d/swift.conf"
}
