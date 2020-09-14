# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-bin
pkgver=5.2.5
pkgrel=1
pkgdesc="Binary builds of the Swift programming language"
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('libutil-linux' 'libxml2' 'python2')
makedepends=('patchelf' 'rpmextract')
conflicts=('swift-language-git')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=("https://swift.org/builds/swift-$pkgver-release/centos8/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-centos8.tar.gz")
sha256sums=('f232397ff96399d491c2f5a95d3df320c42dcf92fd60b4844af5511eee30aec9')

package() {
  find_elf_only() {
    find "${pkgdir}/usr/lib/swift" \
      -executable -type f \
      '(' -path '*/bin/*' -o -name '*.so*' ')' \
      -not -name '*.py' \
      "$@"
  }

  mkdir -p "${pkgdir}/usr/lib/swift"
  cp -Ppr "${srcdir}/swift-$pkgver-RELEASE-centos8"/usr/* "${pkgdir}/usr/lib/swift"

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
}
