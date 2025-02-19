# Maintainer: Daniel Peukert <daniel@peukert.cc>
_reponame='OSTRAJava'
pkgname="${_reponame,,}"
pkgver='1.1'
_commit='1c9031fe7350e895b357c344f4f68658c319fc70'
pkgrel='2'
pkgdesc='Bo neni cas pyco'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/tkohout/$_reponame"
license=('unknown')
depends=('java-runtime<20')
makedepends=('java-environment<20' 'maven')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
	'fix-lib-paths.diff'
)
sha512sums=('edfc7210f99cd1d02ac5c12bb355ebc3b4c0d97381159c617f64d816ba0e4375e0d97bb78435af0bd9fcd4f019fbb79ba637534fbebe195487606a67dc75123f'
            '6b71abf24317df13e8ffb95e0199d20da27537ddeda5cc21c11d49e0217cf345ee4db1dcf53d81e66bb24b4b9db884e6a103cbaa15635616154be9651849c687')

_sourcedirectory="$_reponame-$_commit"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Patch lib paths
	patch --forward -p1 < "$srcdir/fix-lib-paths.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	mvn --batch-mode clean
	mvn --batch-mode install
}

check() {
	_checkoutput="$(java -jar "$srcdir/$_sourcedirectory/target/$_reponame-1.0-SNAPSHOT.jar" compile)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q '^kaj moznosti muzu byt: $'
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
