# Maintainer: Elia Nitsche <nitscheelia at gmail dot com>
# Maintainer: A Farzat <a@farzat.xyz>

_java_version=21

pkgname=briar-headless
conflicts=('briar-headless-git')
pkgver=1.5.21
pkgrel=1
pkgdesc='Briar REST API'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://code.briarproject.org/briar/briar"
license=('GPL-3.0-or-later')
depends=("java-runtime=${_java_version}" 'bash')
makedepends=('git' "java-environment=${_java_version}")
source=("${pkgname}::git+https://code.briarproject.org/briar/briar.git#tag=release-${pkgver}")
sha256sums=('4eb52d11d82f912253ff623443f874bacdadc3d961ae525bf099b23ea532b841')

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

build() {
  cd "${pkgname}"
  export JAVA_HOME=/usr/lib/jvm/java-${_java_version}-openjdk
 ./gradlew --no-daemon --configure-on-demand briar-headless:${_gradle_arch}LinuxJar
}

package() {
  cd "${pkgname}/${pkgname}"
  install -dm755 "$pkgdir/usr/bin/"
  cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
exec /usr/lib/jvm/java-${_java_version}-openjdk/bin/java -jar '/usr/share/java/briar-headless.jar' "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  install -m 644 -D "build/libs/${pkgname}-linux-${CARCH}.jar" "$pkgdir/usr/share/java/${pkgname}.jar"
}
