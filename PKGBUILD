# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=ghidra-extension-emotionengine-git
_pkgname=ghidra-emotionengine
pkgver=1.6.0.r21.gc996291
pkgrel=1
pkgdesc="Ghidra processor for the Sony Playstation 2's Emotion Engine MIPS-based CPU"
arch=("any")
url="https://github.com/beardypig/$_pkgname"
license=("Apache 2.0")
provides=()
conflicts=()
depends=("ghidra")
makedepends=("git" "unzip" "gradle")
optdepends=()
source=("$_pkgname::git+${url}#branch=master")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/$_pkgname"
  rm -rf dist
  /opt/ghidra/support/sleigh -a data/languages
  chmod 0644 data/languages/*.sla
  gradle -PGHIDRA_INSTALL_DIR=/opt/ghidra buildExtension
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/opt/ghidra/Ghidra/Extensions"
  unzip -u dist/*.zip -d "$pkgdir/opt/ghidra/Ghidra/Extensions/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
