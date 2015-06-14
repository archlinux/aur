# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=autoleveller
pkgver=0.8.5
pkgrel=1
pkgdesc="Java based software for 'levelling' GCode file for use on a CNC machine"
arch=('any')
url="http://www.autoleveller.co.uk/"
license=('GPL2')
depends=('bash' 'java-environment')
makedepends=('maven')
source=("$pkgname::hg+https://daedelus1982@bitbucket.org/daedelus1982/autoleveller#tag=v$pkgver"
        'autoleveller.desktop'
        'autoleveller.sh')
install=$pkgname.install
md5sums=('SKIP'
         'c0c05b30eb02b27372c110cadcee6db0'
         '9e25681c62ab3ecb2cda5b62ded72563')

build() {
  cd "$srcdir/$pkgname"

  cat << EOF > "$srcdir/maven.xml"
<settings>
<localRepository>$srcdir/mvn-repo</localRepository>
</settings>
EOF

  mvn -s "$srcdir/maven.xml" compile
}

package() {
  cd "$srcdir/$pkgname"

  mvn -s "$srcdir/maven.xml" -Dtest=false -DfailIfNoTests=false install

  mkdir -p "$pkgdir/usr/share/java/autoleveller"
  cp "target/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/autoleveller/$pkgname.jar"

  install -Dm755 "$srcdir/autoleveller.sh" "$pkgdir/usr/bin/autoleveller"
  install -Dm644 "$srcdir/autoleveller.desktop" "$pkgdir/usr/share/applications/autoleveller.desktop"
  install -Dm644 "$srcdir/autoleveller/src/main/resources/alicon.png" "$pkgdir/usr/share/pixmaps/autoleveller.png"
}

# vim:set ts=2 sw=2 et:
