# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-ubuntu-bin
pkgver=5.5
pkgrel=1
pkgdesc="Swift language toolchain based on Ubuntu release. CLion supported."
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('libutil-linux' 'libxml2' 'python36')
makedepends=('patchelf')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=("https://swift.org/builds/swift-$pkgver-release/ubuntu2004/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-ubuntu20.04.tar.gz")
sha256sums=('aaf7eaefdc3f90f77b21b8829546fc2648e02928af476437d6a58556cb858ec6')

package() {
  find_elf_only() {
    find "${pkgdir}/opt/swift" \
      -executable -type f \
      '(' -path '*/bin/*' -o -name '*.so*' ')' \
      -not -name '*.py' \
      "$@"
  }

  # Notice: We install swift to /opt/swift rather than /usr/lib/swift

  mkdir -p "${pkgdir}/opt/swift"
  cp -Ppr "${srcdir}/swift-$pkgver-RELEASE-ubuntu20.04"/* "${pkgdir}/opt/swift/"

  # Symlink the desired binaries to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  for bin in sourcekit-lsp swift swiftc; do
    ln -s "/opt/swift/usr/bin/$bin" "${pkgdir}/usr/bin/$bin"
  done


  # Patch the binaries to use the changed ncurses names
  patchelf=(patchelf)
  for lib in ncurses panel form; do
    patchelf+=(--replace-needed "lib${lib}.so.6" "lib${lib}w.so")
  done
  find_elf_only -exec "${patchelf[@]}" {} \;

  install -dm755 "${pkgdir}/etc/ld.so.conf.d"
  echo '/opt/swift/usr/lib/swift/linux' >> "${pkgdir}/etc/ld.so.conf.d/swift.conf"
}
