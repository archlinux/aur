pkgname=briar-headless
conflicts=('briar-headless-git')
pkgver=1.2.11
pkgrel=1
pkgdesc='Briar REST API'
arch=(any)
url="https://code.briarproject.org/briar/briar"
license=('GPL')
depends=('java-runtime=11' 'bash')
makedepends=('git' 'jdk11-openjdk')
source=("${pkgname}::git+https://code.briarproject.org/briar/briar.git#tag=release-${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  export PATH="/usr/lib/jvm/java-11-openjdk/jre/bin/:$PATH"
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
 ./gradlew --configure-on-demand briar-headless:jar
}

package() {
  cd "${pkgname}/${pkgname}"
  # depends+=("java-runtime")
  install -dm755 "$pkgdir/usr/bin/"
  cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/briar-headless.jar' "$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  install -m 644 -D "build/libs/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname.jar"
}
