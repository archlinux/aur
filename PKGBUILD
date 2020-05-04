# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-bin
pkgver=5.2.3
pkgrel=1
pkgdesc="Binary builds of the Swift programming language"
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('clang' 'icu63' 'libbsd' 'libutil-linux' 'libxml2' 'python3')
makedepends=('patchelf' 'rpmextract')
conflicts=('swift-language-git')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
_urlbase='https://download.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/s'
source=("$_urlbase/swift-lang-$pkgver-1.fc33.x86_64.rpm")
sha256sums=('5b960d79ed8bb755ccb5fa37a0cb82903a6fad656104952fbb0940c08a693020')

package() {
  find_elf_only() {
    find "${pkgdir}/usr/lib/swift" \
      -executable -type f \
      '(' -path '*/bin/*' -o -name '*.so*' ')' \
      -not -name '*.py' \
      "$@"
  }

  cp -Ppr "${srcdir}"/usr "${pkgdir}"

  # Merge libexec and lib
  mv "${pkgdir}/usr/"{libexec/*,lib}
  rmdir "${pkgdir}/usr/libexec"

  # Rewrite the symlinks and binaries to use lib instead of libexec
  find_elf_only -exec sed -i 's|/usr/libexec|/usr/lib/./.|g' {} \;
  for bin in "${pkgdir}/usr/bin/"*; do
    ln -sf /usr/lib/swift/bin/${bin##*/} $bin
  done

  # Create the needed aliases for libncurses
  patchelf=(patchelf)
  for lib in ncurses panel form; do
    patchelf+=(--replace-needed "lib${lib}.so.6" "lib${lib}w.so")
  done
  find_elf_only -exec "${patchelf[@]}" {} \;

  # Rename the LICENSE file directory
  mv "${pkgdir}/usr/share/licenses/swift-"{lang,bin}

  # Remove Fedora .build-id stuff
  rm -rf "${pkgdir}/usr/lib/.build-id"
}
