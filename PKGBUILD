# Contributor: Andreas Baumann <mail@andreasbauman.cc>
pkgname=adtpro-git
_pkgname=adtpro
pkgver=r1677.2e18f43
pkgrel=2
pkgdesc="Apple Disk Transfer ProDOS for transfering disk images between Apple II-era computers and the modern world."
arch=('x86_64')
url="https://adtpro.com/"
license=('GPL2')
depends=(java-runtime-common)
optdepends=(java-environment)
makedepends=('cc65')
source=("${_pkgname}::git+https://github.com/ADTPro/adtpro.git" "adtpro.sh")
sha256sums=('SKIP'
            '8a4bb344e3a387f5c2d2152662c37e35394ec120590bf233d3e725699746eee4')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cd build

  # assume cc65 has been installed via the AUR
  sed -i 's|${assemblerPath}/ca65|ca65|g' build.xml
  sed -i 's|${assemblerPath}/cl65|cl65|g' build.xml
  sed -i 's|${assemblerPath}/ld65|ld65|g' build.xml
}

build() {
  cd "$_pkgname"

  cd build
  ant all
}

package() {
  cd "$_pkgname"

  # we get the ADTPro-v.r.m directory which contains the same stuff as the
  # release tarball ADTPro-v.r.m.tar.gz
  cd build/ADTPro-v.r.m

  # manually install Linux stuff
  install -d -m0755 "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/adtpro.sh" "$pkgdir/usr/bin/adtpro"
  install -d -m0755 "$pkgdir/usr/share/java/$_pkgname"
  install -Dm644 lib/ADTPro-v.r.m.jar "$pkgdir/usr/share/java/$_pkgname"
  install -Dm644 lib/jssc/slf4j-nop-1.7.36.jar "$pkgdir/usr/share/java/$_pkgname"
  install -Dm644 lib/jssc/jssc-2.9.4.jar "$pkgdir/usr/share/java/$_pkgname"

  # we do not bundle then AppleCommander cli (this is a separate AUR package)
  install -Dm644 lib/AppleCommander/AppleCommander-ant-1.8.0-SNAPSHOT.jar "$pkgdir/usr/share/java/$_pkgname"

  install -d -m0755 "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 ADTPro.html "$pkgdir/usr/share/doc/$_pkgname/"

  install -d -m0755 "$pkgdir/usr/share/$_pkgname/"
  install -Dm644 disks/* "$pkgdir/usr/share/$_pkgname/"

  install -d -m0755 "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
