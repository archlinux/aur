pkgname=briar-desktop-git
_pkgname=briar-desktop
pkgver=r307.38723c4
pkgrel=1
_build_type=nightly
pkgdesc='Prototyping the next generation for Briar on desktop devices'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.briarproject.org/briar/briar-desktop"
license=('GPL')
depends=('java-runtime>=17' 'bash' 'briar-headless-git')
makedepends=('git' 'jdk-openjdk>=17')
conflicts=('briar-desktop')
source=("${_pkgname}::git+https://code.briarproject.org/briar/briar-desktop.git"
        "briar::git+https://code.briarproject.org/briar/briar")
sha256sums=('SKIP'
            'SKIP')

case "$CARCH" in
  armv7h)
    _gradle_arch='armhf'
  ;;
  aarch64)
    _gradle_arch='aarch64'
  ;;
  *)
    _gradle_arch='x64'
  ;;
esac

pkgver(){
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  git submodule init
  git config submodule.briar.url "$srcdir/briar"
  git submodule update --init --recursive
}

build() {
  cd "${_pkgname}"
  export PATH="/usr/lib/jvm/java-17-openjdk/jre/bin/:$PATH"
  # export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  ./gradlew -Dorg.gradle.java.home=/usr/lib/jvm/java-17-openjdk --no-daemon -PbuildType=${_build_type} packageUberJarForCurrentOS
}

package() {
  cd "${_pkgname}/"
  _bin_ver=$(grep 'versionCode =' build.gradle.kts | sed -e 's/^.*versionCode = "\(.*\)".*$/\1/')
  install -dm755 "$pkgdir/usr/bin/"
  cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/briar-desktop.jar' "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$_pkgname"

  install -m 644 -D "build/compose/jars/Briar-linux-${_gradle_arch}-${_bin_ver}-${_build_type}.jar" "$pkgdir/usr/share/java/$_pkgname.jar"
}
