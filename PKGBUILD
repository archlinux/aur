# Maintainer: nsprd <nsprd@pm.me>

pkgname=gephi-git
pkgver=0.11.2.r9507.93e138cfb
pkgrel=1
pkgdesc="An open-source network visualization and analysis tool (git version)"
arch=('any')
url="https://gephi.org/"
license=('CDDL-1.0 AND GPL-3.0-only')
_jdk=17
depends=("java-runtime=${_jdk}" "java-environment=${_jdk}" 'libxxf86vm' 'libnet' 'freetype2')
makedepends=('git' 'maven' 'gendesk' "jdk${_jdk}-openjdk")
provides=("gephi=${pkgver%%.r*}")
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

prepare() {
  gendesk -n --name "Gephi - The Open Graph Viz Platform" \
    --pkgname "gephi" \
    --pkgdesc "$pkgdesc" \
    --categories "Graphics;Education;Science;Network;DataVisualization" \
    --exec "gephi %F" \
    --genericname "Network Visualization"
}

build() {
  cd "$pkgname"
  export JAVA_HOME="/usr/lib/jvm/java-${_jdk}-openjdk"

  mkdir -p "$srcdir/m2"
  mvn -T 2C clean install -DskipTests --no-transfer-progress \
    -Dmaven.repo.local="$srcdir/m2"
}

package() {
  cd "$pkgname"

  install -dm755 "$pkgdir/usr/share/gephi"
  install -dm755 "$pkgdir/usr/bin"

  cd modules/application
  mvn nbm:cluster-app -DskipTests --no-transfer-progress \
    -Dmaven.repo.local="$srcdir/m2"

  cp -r target/gephi/* "$pkgdir/usr/share/gephi/"

  chmod 644 "$pkgdir/usr/share/gephi/etc/gephi.conf"

  find "$pkgdir" -type f \( -iname '*.dll' -o -iname '*.exe' \
    -o -name '.lastModified' \) -delete

  cat > "$pkgdir/usr/bin/gephi" << EOF
#!/bin/sh
export GEPHI_JDK=/usr/lib/jvm/java-${_jdk}-openjdk
exec /usr/share/gephi/bin/gephi "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/gephi"

  install -Dm644 "$srcdir/gephi.desktop" \
    "$pkgdir/usr/share/applications/gephi.desktop"

  install -Dm644 "$srcdir/$pkgname/flathub/gephi.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/gephi.png"
}
