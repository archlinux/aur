# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=ktlint
pkgver=1.0.0
pkgrel=2
pkgdesc="An anti-bikeshedding Kotlin linter with built-in formatter"
arch=('any')
url="https://ktlint.github.io/"
license=('MIT')
depends=('java-runtime>=11')
makedepends=(git 'jdk-openjdk>=20')
validpgpkeys=(ADBC987D1A7B91DB6B0AAA81995EFBF4A3D20BEB)
source=("git+https://github.com/pinterest/ktlint.git#commit=a510eedc69f7431bcd3af2162db8e53a588f4435")
sha256sums=('SKIP')

_gradle_build() {
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  local cached_toolchain="$(find "$GRADLE_USER_HOME/jdks" -mindepth 1 -maxdepth 2 -type d | tail -n 1)"
  if [ -n "$cached_toolchain" ]
  then
    export JAVA_HOME="$cached_toolchain"
  fi
  ./gradlew --no-configuration-cache --no-scan --no-daemon --console plain -Pktlint.publication.signing.enable=false shadowJarExecutable
}

build() {
  cd "ktlint"
  _gradle_build || _gradle_build
}

package() {
  install -D -m755 "${srcdir}/ktlint/ktlint-cli/build/run/ktlint" "${pkgdir}/usr/bin/ktlint"
  install -D -m644 "${srcdir}/ktlint/LICENSE" "${pkgdir}/usr/share/licenses/ktlint/LICENSE"
}

