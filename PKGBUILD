# Maintainer: he3als (me at he3als dot xyz)
# Contributor: Susurri <susurrus dot silent at gmail dot com>
# Contributor: Miten <git dot pub at icloud dot com>
# Contributor: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-bin-6.1
pkgver=6.1.2
pkgrel=1
pkgdesc="Binary builds of the Swift programming language (6.1.x series)"
arch=('x86_64' 'aarch64')
url="https://www.swift.org/"
license=('apache')
depends=('util-linux-libs' 'libxml2-legacy' 'ncurses')
makedepends=('patchelf')
optdepends=('python39: required for REPL')
options=('!strip')
source_x86_64=("https://download.swift.org/swift-$pkgver-release/ubi9/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-ubi9.tar.gz")
source_aarch64=("https://download.swift.org/swift-$pkgver-release/ubi9-aarch64/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-ubi9-aarch64.tar.gz")
sha256sums_x86_64=('04d1170099a4754d6606317b16c17e1b25f38a996a53c0dc742f16a1bf2d6784')
sha256sums_aarch64=('f78b220528cb1486e7f1a7b5194974d9fb2f5d6e67ec858805ef0f93e9be2689')

package() {
  find_elf_only() {
    find "${pkgdir}/usr/lib/swift-6.1" \
      -executable -type f \
      '(' -path '*/bin/*' -o -name '*.so*' ')' \
      -not '(' -name '*.py' -o -name 'hwasan_symbolize' ')' \
      "$@"
  }

  _archsuffix=""
  if [[ $CARCH == "aarch64" ]]; then
    _archsuffix="-aarch64"
  fi
  mkdir -p "${pkgdir}/usr/lib/swift-6.1"
  cp -Ppr "${srcdir}/swift-$pkgver-RELEASE-ubi9${_archsuffix}"/usr/* "${pkgdir}/usr/lib/swift-6.1"

  # Patch the binaries to use the changed ncurses names
  patchelf=(patchelf)
  for lib in ncurses panel form; do
    patchelf+=(--replace-needed "lib${lib}.so.6" "lib${lib}w.so")
  done
  find_elf_only -exec "${patchelf[@]}" {} \;

  install -dm755 "${pkgdir}/etc/ld.so.conf.d"
  echo '/usr/lib/swift-6.1/lib/swift/linux' >> "${pkgdir}/etc/ld.so.conf.d/swift-6.1.conf"
}
