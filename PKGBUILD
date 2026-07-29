# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>
# Contributor: redtide <redtid3 -at- gmail -dot- com>

_name=ConvertWithMoss
pkgname=${_name,,}
pkgver=19.1.0
pkgrel=1
pkgdesc='A tool for converting multi-samples from one format to another'
url='https://mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html'
arch=(aarch64 x86_64)
license=(LGPL-3.0-only)
depends=('java-runtime>=16' sh)
makedepends=(maven jdk-openjdk)
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-moss/ConvertWithMoss/archive/refs/tags/$pkgver.tar.gz"
        'convertwithmoss.sh'
        'settings.xml.in')
sha256sums=('6c278243c3928f0b214ff3a01817dda892c44d3702d51736a62972f7dcbc10e2'
            '119c190f92a96c3556b770d504ada91fc89d522e837bf490dd3c6b4577d7ca3d'
            '21dd62b95d6d9801c7dcb86522ba5b3c7bbe4bc5855a14353d99e6977513b0cb')

prepare() {
  # Workraround for ~/.m2 not being writable in CI
  mkdir -p "$srcdir"/maven/repo
  sed -e 's|@@REPO_DIR@@|'$srcdir'/maven/repo|' "$srcdir/settings.xml.in" > "$srcdir"/settings.xml
}

build() {
  cd $_name-$pkgver
  mvn -s "$srcdir"/settings.xml -Dproject.build.outputTimestamp=$SOURCE_DATE_EPOCH clean install
}

package() {
  install -vDm 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  cd $_name-$pkgver
  install -vDm 644 target/lib/*.jar -t "$pkgdir"/usr/share/java/$pkgname
  ln -sf $pkgname-$pkgver.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
  install -vDm 644 linux/de.mossgrabers.$_name.desktop \
    -t "$pkgdir"/usr/share/applications
  install -vDm 644 linux/de.mossgrabers.$_name.appdata.xml \
    -t "$pkgdir"/usr/share/metainfo
  install -vDm 644 icons/$pkgname.png -t "$pkgdir"/usr/share/pixmaps
  install -vDm 644 documentation/*.{md,ods} -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 documentation/design/*.md -t "$pkgdir"/usr/share/doc/$pkgname/design
}
