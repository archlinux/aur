# Maintainer: Cametendo cameronmathis08@gmail.com
pkgname=cflash
pkgver=1.0.0
pkgrel=1
pkgdesc="Small and lightweight image and iso flasher build on dd."
arch=('any')
url="https://github.com/cametendo/cflash-git"
license=('MIT') 
depends=('java-runtime>=21')
makedepends=('java-environment>=21' 'maven')
source=("cflash::git+https://github.com/cametendo/cflash-git.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  # using 'package' because pom.xml triggers the assembly plugin during this phase
  mvn clean package
}

package() {
  cd "$srcdir/cflash"
  
  # for some reason MAKEPKD won't accept my version, using the wildcard for literally anything if may find
  install -Dm644 target/cflash-*-jar-with-dependencies.jar \
    "$pkgdir/usr/share/java/cflash/cflash.jar"

  # Create the executable
  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/cflash"
#!/bin/sh
exec /usr/bin/java -jar /usr/share/java/cflash/cflash.jar "\$@"
EOF
  # makes the program executable
  chmod +x "$pkgdir/usr/bin/cflash"
}