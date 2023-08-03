# Maintainer: soloturn@gmail.com
# Maintainer: RandomHashTags <imrandomhashtags at gmail dot com>
# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-bin-development
pkgver=5.9.DEVELOPMENT
vendorver=5.9-DEVELOPMENT-SNAPSHOT-2023-07-29-a
pkgrel=1
epoch=4
pkgdesc="Binary builds of the Swift programming language (dev snapshot)"
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('libutil-linux' 'libxml2' 'ncurses5-compat-libs')
optdepends=('python36: required for REPL')
makedepends=('patchelf')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=("https://swift.org/builds/swift-5.9-branch/centos7/swift-${vendorver}/swift-${vendorver}-centos7.tar.gz")
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
  cp -Ppr "${srcdir}/swift-$vendorver-centos7"/usr/* "${pkgdir}/usr/lib/swift"

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

  # Patch "error while loading shared libraries" for Manjaro (tested on Ruah 21.3.1, Linux 5.18.6-1-MANJARO)
  LIBTINFO5=/usr/lib/libtinfo.so.5
  LIBTINFO6=/usr/lib/libtinfo.so.6
  LIBNCURSES5=/usr/lib/libncurses.so.5
  LIBNCURSES6=/usr/lib/libncursesw.so
  [ ! -h "$LIBTINFO5" ] && [ -h "$LIBTINFO6" ] && ln -s "$LIBTINFO6" "${pkgdir}/$LIBTINFO5"
  [ ! -h "$LIBNCURSES5" ] && [ -h "$LIBNCURSES6" ] && ln -s "$LIBNCURSES6" "${pkgdir}/$LIBNCURSES5"

  # Patch same error as above, for a different, untested Manjaro version
  LIBFORM=/usr/lib/libformw.so
  LIBFORM5=/usr/lib/libform.so.5
  LIBPANEL=/usr/lib/libpanelw.so
  LIBPANEL5=/usr/lib/libpanel.so.5
  [ ! -h "$LIBFORM5" ] && [ -h "$LIBFORM" ] && ln -s "$LIBFORM" "${pkdir}/$LIBFORM5"
  [ ! -h "$LIBPANEL5" ] && [ -h "$LIBPANEL" ] && ln -s "$LIBPANEL" "${pkdir}/$LIBPANEL5"

  install -dm755 "${pkgdir}/etc/ld.so.conf.d"
  echo '/usr/lib/swift/lib/swift/linux' >> "${pkgdir}/etc/ld.so.conf.d/swift.conf"
}
