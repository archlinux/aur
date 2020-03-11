# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_reponame='OSTRAJava'
pkgname="${_reponame,,}"
pkgver='1.1'
pkgrel='1'
pkgdesc='Bo neni cas pyco'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/tkohout/$_reponame"
license=('unknown')
depends=('java-runtime')
makedepends=('java-environment' 'maven')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"fix-lib-paths.diff"
)
sha256sums=('62fa69d5c0c9f1f9b4a742316b190e20dff72f4b87b36dff95c7e3260679f2e7'
            '409f5b9d171d278aa50386e79f58b0f0a5370659999549b86c985fe1421bb026')

_sourcedirectory="$_reponame-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/fix-lib-paths.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	mvn --batch-mode clean
	mvn --batch-mode install
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm644 "target/$_reponame-1.0-SNAPSHOT.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

	install -dm755 "$pkgdir/usr/share/$pkgname/"
	for _libfolder in 'out' 'src'; do
		cp -r --no-preserve=ownership --preserve=mode "${pkgname}_lib/$_libfolder/" "$pkgdir/usr/share/$pkgname/$_libfolder/"
	done

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
java -jar '/usr/share/java/$pkgname/$pkgname.jar' run "\$@"
EOF
	cat << EOF > "$pkgdir/usr/bin/${pkgname}c"
#!/bin/sh
java -jar '/usr/share/java/$pkgname/$pkgname.jar' compile "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$pkgname"{,c}
}
