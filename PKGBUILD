pkgname=briar-headless-git
_pkgname=briar-headless
conflicts=('briar-headless')
pkgver=1.3.8.r0.g807677532
pkgrel=1
pkgdesc='Briar REST API'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.briarproject.org/briar/briar"
license=('GPL')
depends=('java-runtime=11' 'bash')
makedepends=('git' 'jdk11-openjdk')
source=("${_pkgname}::git+https://code.briarproject.org/briar/briar.git")
sha256sums=('SKIP')

case "$CARCH" in
  armv7h)
    _gradle_arch='armhf'
  ;;
  aarch64)
    _gradle_arch='aarch64'
  ;;
  *)
    _gradle_arch='x86'
  ;;
esac

pkgver(){
  cd ${_pkgname}
  git describe --long --tags | sed -e 's/^release-//' -e 's/^beta-//' -e 's/^alpha-//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
  cd "${_pkgname}"
  export PATH="/usr/lib/jvm/java-11-openjdk/jre/bin/:$PATH"
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
 ./gradlew --configure-on-demand briar-headless:${_gradle_arch}LinuxJar
}

package() {
  cd "${_pkgname}/${_pkgname}"
  install -dm755 "$pkgdir/usr/bin/"
  cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/briar-headless.jar' "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$_pkgname"

  install -m 644 -D "build/libs/${_pkgname}-linux-${CARCH}.jar" "$pkgdir/usr/share/java/$_pkgname.jar"
}
