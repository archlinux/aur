# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

_version=4.2.1
pkgname=swift-bin
pkgver=${_version//-/.}
pkgrel=1
pkgdesc="Official binary builds of the Swift programming language."
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('clang' 'icu' 'libbsd' 'libutil-linux' 'libxml2' 'python2')
makedepends=('patchelf' 'rpmextract')
conflicts=('swift-language-git')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=(
  'https://kojipkgs.fedoraproject.org//packages/swift-lang/4.2.1/0.101.20181030git02a6ca9.fc30/x86_64/swift-lang-4.2.1-0.101.20181030git02a6ca9.fc30.x86_64.rpm'
  'https://kojipkgs.fedoraproject.org//packages/swift-lang/4.2.1/0.101.20181030git02a6ca9.fc30/x86_64/swift-lang-runtime-4.2.1-0.101.20181030git02a6ca9.fc30.x86_64.rpm'
)
sha256sums=('9df46cd5601b4318496cfd79056def9af44b706269776f74cc0778fd03842a49'
            '5ff7fa70ccd47b5cee8f22a2d26bcb2761cfaa392bd687a2a7a142bb7dd407a5')

package() {
  cp -Ppr "${srcdir}"/{etc,usr} "${pkgdir}"

  # Merge ld.so.conf.d files from the two packages
  cat "${pkgdir}/etc/ld.so.conf.d/swift-lang-runtime.conf" >> \
    "${pkgdir}/etc/ld.so.conf.d/swift-lang.conf"
  rm "${pkgdir}/etc/ld.so.conf.d/swift-lang-runtime.conf"

  # Create the needed aliases for libncurses and libicu
  for lib in libncurses libpanel libform; do
    ln -s ../../${lib}w.so "${pkgdir}/usr/lib/swift/linux/${lib}.so.6"
  done

  for lib in libicudata libicui18n libicuuc; do
    ln -s ../../${lib}.so "${pkgdir}/usr/lib/swift/linux/${lib}.so.62"
  done

  # Merge libexec and lib
  # XXX: can't drop yet, moving it from libexec completely kills the REPL for some reason
  # find "${pkgdir}" -executable -type f -exec sed -i 's|/usr/libexec|/////usr/lib|g' {} \;
  # mv "${pkgdir}/usr/"{libexec/swift-lldb/*,lib/swift-lldb}
  # rmdir "${pkgdir}/usr/libexec/swift-lldb"
  # rmdir "${pkgdir}/usr/libexec"

  # Make sure swift-lldb files pick up the symlinks from above
  find "${pkgdir}/usr/lib/swift-lldb" -executable -type f -exec \
    patchelf --set-rpath '/usr/lib/swift/linux' {} \;
  # XXX: remove once libexec is dropped
  find "${pkgdir}/usr/libexec/swift-lldb" -executable -type f -exec \
    patchelf --set-rpath '/usr/lib/swift/linux' {} \;
  patchelf --set-rpath '/usr/lib/swift/linux' "${pkgdir}/usr/bin/swift-build-tool"

  # Patch the libicu _62 symbols to _63
  for path in "${pkgdir}/usr/lib/swift/linux/"{libswiftCore,libFoundation}.so; do
    sed -i 's/\([Uu][A-Za-z0-9_]*\)_62/\1_63/g' "$path"
  done

  # Symlink sourcekit
  ln -s swift-lldb/libsourcekitdInProc.so "${pkgdir}/usr/lib/libsourcekitdInProc.so"

  # Rename the LICENSE file directory
  mv "${pkgdir}/usr/share/licenses/swift-"{lang,bin}

  # Remove Fedora .build-id stuff
  rm -rf "${pkgdir}/usr/lib/.build-id"
}
