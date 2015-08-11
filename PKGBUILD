# Maintainer: Garrett <floft.net/contact>
pkgname=worldwind
pkgver=2.0.0
pkgrel=1
pkgdesc="an open source 3D interactive world viewer"
arch=('i686' 'x86_64')
url="http://worldwind.arc.nasa.gov/java/"
license=('custom')
optdepends=('libtxc_dxtn: radeon and nouveau support')
source=('http://builds.worldwind.arc.nasa.gov/worldwind-releases/2.0/builds/worldwind-2.0.0.zip')
md5sums=('7daff37e61ed378f12f1516aab692260')

if [[ $CARCH == i686 ]]; then
    depends=('jogl')
else
    source+=('http://worldwind.arc.nasa.gov/java/jogl/webstart/jogl-natives-linux-amd64.jar'
        'http://worldwind.arc.nasa.gov/java/jogl/webstart/gluegen-rt-natives-linux-amd64.jar')
    md5sums+=('6bd6dff3409fbba29738c56e3e36650d'
             'df40663205b7ee954434de97811ff93c')
fi

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/usr/bin/"
	cat > "$pkgdir/usr/bin/worldwind" <<EOF
#!/bin/bash
cd '/usr/share/worldwind/';
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/jogl"
java -Xmx512m -Djava.library.path=. -classpath ./src:./classes:./worldwind.jar:./worldwindx.jar:./jogl.jar:./gluegen-rt.jar:./gdal.jar gov.nasa.worldwindx.examples.ApplicationTemplate
EOF
	chmod +x "$pkgdir/usr/bin/worldwind"

	mkdir -p  "$pkgdir/usr/share/$pkgname"
	cp -r ./* "$pkgdir/usr/share/$pkgname/"
	
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "NASA_Open_Source_Agreement_1.3.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	if [[ $CARCH == i686 ]]; then
		rm "$pkgdir/usr/share/$pkgname/lib-external/gdal/libgdalalljni64.so"
    fi
}
