# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=jupiter
pkgver=3.1
pkgrel=1
pkgdesc="RISC-V RV32 Assembler and Runtime Simulator"
url="https://github.com/andrescv/Jupiter"
arch=('i686' 'x86_64')
provides=('jupiter')
depends=('gvfs')
makedepends=('zip' 'coreutils')
source=("https://github.com/andrescv/Jupiter/releases/download/v$pkgver/Jupiter-$pkgver-linux.zip")
sha256sums=('0016ecdf5568151c1b099a5ca0ce1b2578a73bdd60bf290010f1752b3875093f')

build() {

cd "$srcdir"

EXECB64=$(base64 -w0 image/bin/java)
cat <<EOF > jupiter
#!/bin/sh

EXEC="$EXECB64"

mkdtemp() {
  old_mask=\$(umask)
  umask 077
  randval=\$(head -c10 /dev/urandom | base32)
  name="/tmp/tmp.\$randval"
  mkdir "\$name"
  retval=\$?
  umask \$old_mask
  echo "\$name"
  return \$retval
}

tmpdir=\$(mkdtemp) || {
  echo 'Failed to create temporary directory.'
  exit 1
}
base64 -d <<< "\$EXEC" > "\$tmpdir/java"
chmod +x "\$tmpdir/java"

export LD_LIBRARY_PATH=/usr/lib/jupiter/lib/jli:/usr/lib/jupiter/lib:\$LD_LIBRARY_PATH

"\$tmpdir/java" --add-exports javafx.controls/com.sun.javafx.scene.control=com.jfoenix --add-exports javafx.controls/com.sun.javafx.scene.control.behavior=com.jfoenix --add-exports javafx.graphics/com.sun.javafx.scene=com.jfoenix --add-exports javafx.base/com.sun.javafx.event=com.jfoenix -m jupiter/jupiter.Jupiter "\$@"
RET=\$?

rm -rf "\$tmpdir"
exit \$RET
EOF

}

package() {
  umask 022
  install -D -m755 "$srcdir/jupiter" "$pkgdir/usr/bin/jupiter"
  mkdir -p "$pkgdir/usr/lib/jupiter"
  cp -R "$srcdir/image/lib" "$pkgdir/usr/lib/jupiter/lib"
}
