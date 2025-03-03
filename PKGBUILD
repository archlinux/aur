# Maintainer: nsprd <nsprd@pm.me>

pkgname=gephi-git
pkgver=0.10.1.r7720.dbc674485
pkgrel=1
pkgdesc="An open-source network visualization and analysis tool (git version)"
arch=('any')
url="https://gephi.org/"
license=('CDDL' 'GPL3')
depends=('java-runtime=11')
makedepends=('git' 'maven' 'jdk11-openjdk')
provides=('gephi')
conflicts=('gephi')
options=(!strip)
source=("${pkgname}::git+https://github.com/gephi/gephi.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "0.10.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
  
  mkdir -p "$srcdir/m2"
  mvn -T 2C clean install -DskipTests -Dmaven.repo.local="$srcdir/m2"
}

package() {
  cd "$pkgname"
  
  # Create directories
  install -dm755 "$pkgdir/usr/share/gephi"
  install -dm755 "$pkgdir/usr/bin"
  
  # Build final application bundle
  cd modules/application
  mvn nbm:cluster-app -DskipTests -Dmaven.repo.local="$srcdir/m2"

  # Copy the built application
  cp -r target/gephi/* "$pkgdir/usr/share/gephi/"
  
  # Create launcher script
  cat > "$pkgdir/usr/bin/gephi" << EOF
#!/bin/sh
export GEPHI_JDK=/usr/lib/jvm/java-11-openjdk
exec /usr/share/gephi/bin/gephi "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/gephi"
  
}
