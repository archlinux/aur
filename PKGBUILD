pkgname=briar-headless-git
_pkgname=briar-headless
conflicts=('briar-headless')
pkgver=1.2.9.r107.g4e5f2e31d
pkgrel=1
pkgdesc='Briar REST API'
arch=(any)
url="https://code.briarproject.org/briar/briar"
license=('GPL')
depends=('java-runtime=11')
makedepends=('git' 'jdk11-openjdk')
source=("${_pkgname}::git+https://code.briarproject.org/briar/briar.git")
sha256sums=('SKIP')

pkgver(){
  cd ${_pkgname}
  git describe --long --tags | sed -e 's/^release-//' -e 's/^beta-//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
  cd "${_pkgname}"
  export PATH="/usr/lib/jvm/java-11-openjdk/jre/bin/:$PATH"
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
 ./gradlew --configure-on-demand briar-headless:jar
}

package() {
  cd "${_pkgname}/${_pkgname}"
  # depends+=("java-runtime")
  install -dm755 "$pkgdir/usr/bin/"
  cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/briar-headless.jar' "$@"
EOF
  chmod +x "$pkgdir/usr/bin/$_pkgname"

  install -m 644 -D "build/libs/$_pkgname.jar" "$pkgdir/usr/share/java/$_pkgname.jar"
}
