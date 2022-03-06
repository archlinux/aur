# Maintainer: soloturn@gmail.com
# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-bin-development
pkgver=5.6.DEVELOPMENT
vendorver=5.6-DEVELOPMENT-SNAPSHOT-2022-02-11-a
pkgrel=1
pkgdesc="Binary builds of the Swift programming language (dev snapshot)"
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('libutil-linux' 'libxml2')
optdepends=('python36: required for REPL')
makedepends=('patchelf')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=("https://swift.org/builds/swift-5.6-branch/centos8/swift-${vendorver}/swift-${vendorver}-centos8.tar.gz")
sha256sums=('SKIP')

package() {
  find_elf_only() {
    find "${pkgdir}/usr/lib/swift" \
      -executable -type f \
      '(' -path '*/bin/*' -o -name '*.so*' ')' \
      -not -name '*.py' \
      "$@"
  }

  mkdir -p "${pkgdir}/usr/lib/swift"
  cp -Ppr "${srcdir}/swift-$vendorver-centos8"/usr/* "${pkgdir}/usr/lib/swift"

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
