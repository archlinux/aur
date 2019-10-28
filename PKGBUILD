# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

_version=5.1.1
pkgname=swift-bin
pkgver=${_version//-/.}
pkgrel=3
pkgdesc="Official binary builds of the Swift programming language."
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('clang' 'icu63' 'libbsd' 'libutil-linux' 'libxml2' 'python3')
makedepends=('patchelf' 'rpmextract')
conflicts=('swift-language-git')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=(
  'https://download.fedoraproject.org/pub/fedora/linux/updates/31/Everything/x86_64/Packages/s/swift-lang-5.1.1-0.2.20191004git4242edd.fc31.x86_64.rpm'
  'https://download.fedoraproject.org/pub/fedora/linux/updates/31/Everything/x86_64/Packages/s/swift-lang-runtime-5.1.1-0.2.20191004git4242edd.fc31.x86_64.rpm'
)
sha256sums=('95ac1ea38c20d68497b9c1af352400a9f39bcc7a631aff2be1ec2e917abdc4a3'
            'd5b24102df9c551d5719a1aad17685179f838c4f8fb0409ede42871978a8b497')

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
