# Maintainer: Michael <michael@localhost>

pkgname=weasis-git
_pkgname=weasis
pkgver=r3948.32fef3339
pkgrel=1
pkgdesc='Weasis DICOM medical viewer (built from git master)'
arch=('x86_64' 'aarch64')
url='https://github.com/nroduit/Weasis'
license=('EPL-2.0' 'Apache-2.0')
makedepends=('git' 'maven' 'java-environment-openjdk=27' 'unzip' 'dpkg' 'fakeroot' 'rpm-tools')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
options=('!strip' )
source=("$pkgname::git+https://github.com/nroduit/Weasis.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/java-27-openjdk}"

  mvn -B -DskipTests -Dmaven.repo.local="$srcdir/m2" clean install
  mvn -B -DskipTests -Dmaven.repo.local="$srcdir/m2" \
    -P compressXZ -f weasis-distributions/pom.xml clean package

  local native_dist="weasis-distributions/target/native-dist"
  local native_zip
  native_zip=$(find "$native_dist" -type f -name 'weasis-native.zip' -print -quit)
  [[ -n "$native_zip" ]] || {
    echo "Could not find generated weasis-native.zip" >&2
    return 1
  }

  unzip -q -o "$native_zip" -d native-dist
  
  # Fake that we have installed coreutils so jpackage thinks we are on debian
  export DPKG_ADMINDIR="./dpkg-admin/"
  mkdir -p dpkg-admin/{info,updates,triggers}
  touch dpkg-admin/available dpkg-admin/diversions dpkg-admin/statoverride dpkg-admin/triggers/Unincorp
  cat > dpkg-admin/status <<'EOF'
Package: coreutils
Status: install ok installed
Priority: optional
Section: misc
Installed-Size: 100
Maintainer: Me <me@example.com>
Architecture: all
Version: 1.0-1
Description: Mock package
 Longer description line.

EOF

  ./native-dist/build/script/package-weasis.sh --output weasis-linux --jdk /usr/lib/jvm/java-27-openjdk
}

package() {
    dpkg-deb -x weasis-git/weasis-linux/weasis_*.deb "${pkgdir}"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/weasis/bin/Weasis" "$pkgdir/usr/bin/weasis"
    ln -s "/opt/weasis/bin/Dicomizer" "$pkgdir/usr/bin/dicomizer"


    install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Weasis.desktop ${pkgdir}/usr/share/applications/Weasis.desktop
    install -Dm 644 ${pkgdir}/opt/weasis/lib/weasis-Dicomizer.desktop ${pkgdir}/usr/share/applications/Dicomizer.desktop
}