# Maintainer: Susurri <susurrus dot silent at gmail dot com>
# Contributor: Miten <git dot pub at icloud dot com>
# Contributor: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-bin
pkgver=5.10
pkgrel=1
pkgdesc="Binary builds of the Swift programming language"
arch=('x86_64' 'aarch64')
url="https://www.swift.org/"
license=('apache')
depends=('util-linux-libs' 'libxml2' 'ncurses')
makedepends=('patchelf')
optdepends=('python39: required for REPL')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source_x86_64=("https://download.swift.org/swift-$pkgver-release/ubi9/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-ubi9.tar.gz")
source_aarch64=("https://download.swift.org/swift-$pkgver-release/ubi9-aarch64/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-ubi9-aarch64.tar.gz")
sha256sums_x86_64=('0db8d9e499ec63a07ce970a2f41613310fb712c3936f1a797ccdacde7536384d')
sha256sums_aarch64=('784f859cdcacffa2df93fa0d433aa1a38c6ad0884f628bbdad039bc25d63b3c4')

package() {
  find_elf_only() {
    find "${pkgdir}/usr/lib/swift" \
      -executable -type f \
      '(' -path '*/bin/*' -o -name '*.so*' ')' \
      -not '(' -name '*.py' -o -name 'hwasan_symbolize' ')' \
      "$@"
  }

  _archsuffix=""
  if [[ $CARCH == "aarch64" ]]; then
    _archsuffix="-aarch64"
  fi
  mkdir -p "${pkgdir}/usr/lib/swift"
  cp -Ppr "${srcdir}/swift-$pkgver-RELEASE-ubi9${_archsuffix}"/usr/* "${pkgdir}/usr/lib/swift"

  # Symlink the desired binaries to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  for bin in sourcekit-lsp swift swiftc; do
    ln -s "/usr/lib/swift/bin/$bin" "${pkgdir}/usr/bin/$bin"
  done

  # Patch the binaries to use the changed ncurses names
  patchelf=(patchelf)
  for lib in ncurses panel form; do
    patchelf+=(--replace-needed "lib${lib}.so.6" "lib${lib}w.so")
  done
  find_elf_only -exec "${patchelf[@]}" {} \;

  install -dm755 "${pkgdir}/etc/ld.so.conf.d"
  echo '/usr/lib/swift/lib/swift/linux' >> "${pkgdir}/etc/ld.so.conf.d/swift.conf"
}
