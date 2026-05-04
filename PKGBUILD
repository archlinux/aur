# Maintainer: nsprd <nsprd@pm.me>

pkgname=gephi-git
pkgver=0.11.1.r9296.53c9936dd
pkgrel=1
pkgdesc="An open-source network visualization and analysis tool (git version)"
arch=('any')
url="https://gephi.org/"
license=('CDDL' 'GPL3')
depends=('java-runtime=17')
makedepends=('git' 'maven' 'jdk17-openjdk')
provides=('gephi')
conflicts=('gephi')
options=(!strip)
source=("${pkgname}::git+https://github.com/gephi/gephi.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" \
    "$(git describe --tags --abbrev=0 | sed 's/^v//')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"

  mkdir -p "$srcdir/m2"
  mvn -T 2C clean install -DskipTests -Dmaven.repo.local="$srcdir/m2"
}

package() {
  cd "$pkgname"

  install -dm755 "$pkgdir/usr/share/gephi"
  install -dm755 "$pkgdir/usr/bin"

  cd modules/application
  mvn nbm:cluster-app -DskipTests -Dmaven.repo.local="$srcdir/m2"

  cp -r target/gephi/* "$pkgdir/usr/share/gephi/"

  cat > "$pkgdir/usr/bin/gephi" << EOF
#!/bin/sh
export GEPHI_JDK=/usr/lib/jvm/java-17-openjdk
exec /usr/share/gephi/bin/gephi "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/gephi"
}
