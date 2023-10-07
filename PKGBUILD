# Maintainer: fanjiang <prof.fan@foxmail.com>

pkgname=swift-bin-nightly
pkgver="2023_10_04_a"
pkgrel=1
pkgdesc="Nightly binary builds of the Swift programming language"
arch=('x86_64')
url="https://www.swift.org/"
license=('apache')
depends=('libutil-linux' 'libxml2' 'ncurses5-compat-libs')
optdepends=('python36: required for REPL')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=("https://download.swift.org/development/centos7/swift-DEVELOPMENT-SNAPSHOT-${pkgver//_/-}/swift-DEVELOPMENT-SNAPSHOT-${pkgver//_/-}-centos7.tar.gz")
sha256sums=('5c6f4fa52789d92db128800c57fe3e1a1f4f1fc38ab518badec04a68cfa406ee')

package() {
  mkdir -p "${pkgdir}/usr/lib/swift"
  cp -Ppr "${srcdir}/swift-DEVELOPMENT-SNAPSHOT-${pkgver//_/-}-centos7"/usr/* "${pkgdir}/usr/lib/swift"

  # Symlink the desired binaries to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  for bin in sourcekit-lsp swift swiftc; do
    ln -s "/usr/lib/swift/bin/$bin" "${pkgdir}/usr/bin/$bin"
  done

  install -dm755 "${pkgdir}/etc/ld.so.conf.d"
  echo '/usr/lib/swift/lib/swift/linux' >> "${pkgdir}/etc/ld.so.conf.d/swift.conf"
}
