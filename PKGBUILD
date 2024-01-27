# Maintainer: Daniel Peukert <daniel@peukert.cc>
_reponame='OSTRAJava'
pkgname="${_reponame,,}"
pkgver='1.1'
pkgrel='1'
pkgdesc='Bo neni cas pyco'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/tkohout/$_reponame"
license=('unknown')
depends=('java-runtime')
makedepends=('java-environment' 'maven')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"fix-lib-paths.diff"
)
sha512sums=('4acf1d9ec53f1af58022512b2d7e5427e9251f919709c4e010922bfdb934e1bc4eb37e9e33662eccca314f8971b594f0a603c308acf16070a284d963d13987b8'
            '6b71abf24317df13e8ffb95e0199d20da27537ddeda5cc21c11d49e0217cf345ee4db1dcf53d81e66bb24b4b9db884e6a103cbaa15635616154be9651849c687')

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
