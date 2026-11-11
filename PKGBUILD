# Maintainer: khvalera
pkgname=openwebstart
pkgver=1.14.0
pkgrel=1
_icedtea_ver=2.0.0-alpha36
pkgdesc='OpenWebStart JNLP launcher and JVM manager (built from source)'
arch=('any')
url='https://openwebstart.com/'
license=('GPL-2.0-only WITH Classpath-exception-2.0')
depends=('jre11-openjdk')
makedepends=('maven' 'jdk8-openjdk' 'unzip')
provides=('java-web-start')
conflicts=('icedtea-web' 'openwebstart-bin')
source=(
  "OpenWebStart-${pkgver}.tar.gz::https://github.com/karakun/OpenWebStart/archive/refs/tags/v${pkgver}.tar.gz"
  "IcedTea-Web-${_icedtea_ver}.tar.gz::https://github.com/AdoptOpenJDK/IcedTea-Web/archive/refs/tags/icedtea-web-${_icedtea_ver}.tar.gz"
  'javaws'
  'itw-settings'
  'javaws.desktop'
  'itw-settings.desktop'
  'jnlp.xml'
)
sha256sums=('d031698f1c1d33de9a19790ed6ce95e292a611802f8c1fcf53906863a3a3ab90'
            '19c900d3751a75b1585dacd875fb401fcb760dbbff2656266fb3d316c717a881'
            'e8d34103cf9ff538797a8ceaa0c6d5cc788f0ee58b6dd2e7cdc354c451b6f17f'
            '17411d3359e897d1639e8292e2582f722b822d28fc4949858e212b7dead0e06b'
            '3810d8376e7d0d67aeb2e333d5ad523e699595d2d8983f13606ae480157cdd84'
            'd1d9e204492355a82edb4d51ccc09fc53fadf4fa1ff2c8cf36991bc8ed1801f6'
            '2fb665088400c6891f30e58b6048d0fb2bf105a299817ee05bcb557ab30e6766')

build() {
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
  export PATH="$JAVA_HOME/bin:$PATH"
  export MAVEN_OPTS="-Duser.home=$srcdir -Xmx2g"
  local _mvnrepo="$srcdir/.m2/repository"

  # OpenWebStart 1.14.0 expects IcedTea-Web 2.0.0-alpha36,
  # NOT the older 1.8.8 branch.
  cd "$srcdir/IcedTea-Web-icedtea-web-${_icedtea_ver}"
  mvn -B -ntp -Dmaven.repo.local="$_mvnrepo" -DskipTests clean install

  cd "$srcdir/OpenWebStart-${pkgver}"
  mvn -B -ntp -Dmaven.repo.local="$_mvnrepo" -DskipTests clean package
}

check() {
  local _jar="$srcdir/OpenWebStart-${pkgver}/openwebstart/target/openwebstart-${pkgver}.jar"
  [[ -s "$_jar" ]] || { printf 'Missing OpenWebStart JAR: %s\n' "$_jar" >&2; return 1; }
  local _classes
  _classes="$(unzip -Z1 "$_jar")" || return 1
  grep -qx 'com/openwebstart/launcher/OpenWebStartLauncher.class' <<< "$_classes" || return 1
  grep -qx 'com/openwebstart/launcher/ControlPanelLauncher.class' <<< "$_classes" || return 1
  grep -qx 'net/sourceforge/jnlp/runtime/Boot.class' <<< "$_classes" || return 1
}

package() {
  install -Dm644 "$srcdir/OpenWebStart-${pkgver}/openwebstart/target/openwebstart-${pkgver}.jar" \
    "$pkgdir/usr/share/java/openwebstart/openwebstart.jar"

  install -Dm755 "$srcdir/javaws" "$pkgdir/usr/bin/javaws"
  install -Dm755 "$srcdir/itw-settings" "$pkgdir/usr/bin/itw-settings"
  ln -s javaws "$pkgdir/usr/bin/openwebstart-javaws"
  ln -s itw-settings "$pkgdir/usr/bin/openwebstart-settings"

  install -Dm644 "$srcdir/javaws.desktop" "$pkgdir/usr/share/applications/javaws.desktop"
  install -Dm644 "$srcdir/itw-settings.desktop" "$pkgdir/usr/share/applications/itw-settings.desktop"
  install -Dm644 "$srcdir/jnlp.xml" "$pkgdir/usr/share/mime/packages/jnlp.xml"

  local _icon="$srcdir/OpenWebStart-${pkgver}/openwebstart/src/main/resources/com/openwebstart/ui/app-256.png"
  [[ -s "$_icon" ]] || { printf 'Missing icon: %s\n' "$_icon" >&2; return 1; }
  install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/256x256/apps/openwebstart.png"
  ln -s openwebstart.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/itw-settings.png"

  install -Dm644 "$srcdir/OpenWebStart-${pkgver}/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
