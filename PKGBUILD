# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-bin
pkgver=5.4.3
pkgrel=1
pkgdesc="Binary builds of the Swift programming language"
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('libutil-linux' 'libxml2' 'python36')
makedepends=('patchelf')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=("https://swift.org/builds/swift-$pkgver-release/centos8/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-centos8.tar.gz")
sha256sums=('1a86b6d964804f9d37dcbb9da24b902211b108deef1b73c4005837073b0244ee')

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

  install -dm755 "${pkgdir}/etc/ld.so.conf.d"
  echo '/usr/lib/swift/lib/swift/linux' >> "${pkgdir}/etc/ld.so.conf.d/swift.conf"
}
