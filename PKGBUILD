# Maintainer : Thomas Weißschuh <aur t-8ch.de>

pkgname=hsqldb2-java
pkgver=2.7.2
pkgrel=1
pkgdesc="HSQLDB Java libraries, Version 2"
arch=('any')
license=('custom')
depends=('java-environment')
makedepends=('unzip' 'apache-ant' 'jdk8-openjdk')
conflicts=('hsqldb-java')
source=("https://downloads.sourceforge.net/project/hsqldb/hsqldb/hsqldb_2_7/hsqldb-${pkgver}.zip")
url="http://hsqldb.org/"


build() {

  cd "${srcdir}/hsqldb-${pkgver}/hsqldb/build"

  mkdir -p ../doc-src/
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk/ ant hsqldb

}

package() {

  mkdir -p "${pkgdir}/usr/share/java"
  install -m644 \
          "${srcdir}/hsqldb-${pkgver}/hsqldb/lib/"{hsqldb,sqltool}.jar \
          "${pkgdir}/usr/share/java/"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 \
          "${srcdir}/hsqldb-${pkgver}/hsqldb/doc/hsqldb_lic.txt" \
          "${pkgdir}/usr/share/licenses/${pkgname}/"

  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/hsqldb-server" << EOF
#!/bin/sh
exec /usr/bin/java -cp /usr/share/java/hsqldb.jar org.hsqldb.server.Server "\$@"
EOF

  cat > "${pkgdir}/usr/bin/hsqldb-web-server" << EOF
#!/bin/sh
exec /usr/bin/java -cp /usr/share/java/hsqldb.jar org.hsqldb.server.WebServer "\$@"
EOF

  cat > "${pkgdir}/usr/bin/hsqldb-manager" << EOF
#!/bin/sh
exec /usr/bin/java -cp /usr/share/java/hsqldb.jar org.hsqldb.util.DatabaseManager "\$@"
EOF

  cat > "${pkgdir}/usr/bin/hsqldb-manager-swing" << EOF
#!/bin/sh
exec /usr/bin/java -cp /usr/share/java/hsqldb.jar org.hsqldb.util.DatabaseManagerSwing "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/"*
}

sha256sums=('ffb359cbe66ba3179317b6afdb62cd274765333bd30167ce332a4b2d85975812')
