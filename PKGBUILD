# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

_version=5.0
pkgname=swift-bin
pkgver=${_version//-/.}
pkgrel=1
pkgdesc="Official binary builds of the Swift programming language."
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('clang' 'icu62' 'libbsd' 'libutil-linux' 'libxml2' 'python2')
makedepends=('patchelf' 'rpmextract')
conflicts=('swift-language-git')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=(
  'https://kojipkgs.fedoraproject.org//packages/swift-lang/5.0/0.52.20190325gitba33f9e.fc29/x86_64/swift-lang-5.0-0.52.20190325gitba33f9e.fc29.x86_64.rpm'
  'https://kojipkgs.fedoraproject.org//packages/swift-lang/5.0/0.52.20190325gitba33f9e.fc29/x86_64/swift-lang-runtime-5.0-0.52.20190325gitba33f9e.fc29.x86_64.rpm'
)
sha256sums=('9b4610757147e547373d65c269d2ff627d3c0ef0164e8e130bed3d7a874cbc4b'
            '8884e3e42cc79bb44775ebf1514647c581478844be859bdb24bd4fe571d7a303')

package() {
  cp -Ppr "${srcdir}"/{etc,usr} "${pkgdir}"

  # Okay, so some hackery that you'll see soon needs to be explained a bit:
  # These Swift binaries want libncurses.so.6 and family, but Arch provides them under
  # libncursesw.so. An original copy of this package just symlinked the names, but then
  # ldconfig picked them up, which lead to the wrong paths being placed into the initramfs...
  # leaving an unbootable system.

  # Ideally we'd be able to use patchelf --replace-needed, but that's not possible due to a glibc
  # bug that cuases ldconfig to misread the SONAME and generate screwy symlinks:
  # https://sourceware.org/bugzilla/show_bug.cgi?id=24294

  # Therefore, instead we need to follow this process:
  # - Replace /usr/lib/swift/linux from ld.so.conf.d with /usr/lib/swift/linux/export.
  # - Symlink all the libraries in /usr/lib/swift/linux to /usr/lib/swift/linux/export.
  # - Create the .so.6 symlinks in /usr/lib/swift/linux.

  # Merge ld.so.conf.d files from the two packages
  cat "${pkgdir}/etc/ld.so.conf.d/swift-lang-runtime.conf" >> \
    "${pkgdir}/etc/ld.so.conf.d/swift-lang.conf"
  rm "${pkgdir}/etc/ld.so.conf.d/swift-lang-runtime.conf"
  sed -i 's|swift/linux|swift/linux/export|' "${pkgdir}/etc/ld.so.conf.d/swift-lang.conf"

  # Create the exported so symlinks
  mkdir -p "${pkgdir}/usr/lib/swift/linux/export"
  for path in "${pkgdir}/usr/lib/swift/linux/"*.so; do
    ln -s ../$(basename "$path") "${pkgdir}/usr/lib/swift/linux/export"
  done

  # Create the needed aliases for libncurses
  for lib in ncurses panel form; do
    ln -s ../../lib${lib}w.so "${pkgdir}/usr/lib/swift/linux/lib${lib}.so.6"
  done

  # Merge libexec and lib
  # XXX: can't do this yet, moving it from libexec completely kills the REPL for some reason
  # find "${pkgdir}" -executable -type f -exec sed -i 's|/usr/libexec|/////usr/lib|g' {} \;
  # mv "${pkgdir}/usr/"{libexec/swift-lldb/*,lib/swift-lldb}
  # rmdir "${pkgdir}/usr/libexec/swift-lldb"
  # rmdir "${pkgdir}/usr/libexec"

  # Make sure swift-lldb files pick up the symlinks from above
  # XXX: remove libexec once it is dropped
  find "${pkgdir}/usr/"{lib,libexec}/swift-lldb -executable -type f -exec \
    patchelf --set-rpath '/usr/lib/swift/linux' {} \;
  patchelf --set-rpath '/usr/lib/swift/linux' "${pkgdir}/usr/bin/swift-build-tool"

  # Rename the LICENSE file directory
  mv "${pkgdir}/usr/share/licenses/swift-"{lang,bin}

  # Remove Fedora .build-id stuff
  rm -rf "${pkgdir}/usr/lib/.build-id"
}
