# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: David Vilar <davvil@gmail.com>
pkgname=vassal
pkgver=3.5.8
pkgrel=1
pkgdesc="Game engine for building and playing online adaptations of board games and card games."
arch=('i686' 'x86_64')
url="http://www.vassalengine.org/"
license=('LGPL')
depends=('java-runtime>=11')
source=(https://github.com/vassalengine/vassal/releases/download/${pkgver}/VASSAL-${pkgver}-linux.tar.bz2
        VASSAL-256x256.png)
noextract=()
md5sums=('bfe7fa525c7a53f3ac041daeeb2727d0'
         '4a4ec11bdbd7dbbf56e6f1d533f69a7e')
build() {
  true
}

package() {
  cd "$srcdir/VASSAL-$pkgver"
  destdir=$pkgdir/usr/share/java/$pkgname

  mkdir -p $destdir
  
  cp -r doc lib $destdir

  mkdir -p $pkgdir/usr/bin
  cat << EOF > $pkgdir/usr/bin/vassal
#!/bin/bash

shopt -s nullglob

JAVA_BIN="\$(which java)"
JAVA_VER="\$("\${JAVA_BIN}" -version 2>&1 | awk -F '"' '/version/ {print \$2}')"

# Cut after first dot (if it's a 1.x version it's too old anyways)
JAVA_VER="\${JAVA_VER%%.*}"

# If the default java installation is not suitable
if [[ "\${JAVA_VER}" < "11" ]]; then
  JAVA_BINS=(/usr/lib/jvm/java-{11..15}-*/bin/java)
  JAVA_BIN="\${JAVA_BINS[0]}"
fi

cd /usr/share/java/$pkgname && "\${JAVA_BIN}" -classpath lib/Vengine.jar VASSAL.launch.ModuleManager "\$@"
EOF
  chmod a+x $pkgdir/usr/bin/vassal

  mkdir -p $destdir/images
  cp $srcdir/VASSAL-256x256.png $destdir/images

  mkdir -p $pkgdir/usr/share/applications
  cat << EOF > $pkgdir/usr/share/applications/vassal.desktop
[Desktop Entry]
Comment=${pkgdesc}
Terminal=false
Name=Vassal
Exec=/usr/bin/vassal
Type=Application
Icon=/usr/share/java/${pkgname}/images/VASSAL-256x256.png
EOF

}

# vim:set ts=2 sw=2 et:
