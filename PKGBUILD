# Maintainer: Daniel Peukert <daniel@peukert.cc>
_reponame='OSTRAJava'
_pkgname="${_reponame,,}"
pkgname="$_pkgname-git"
pkgver='1.1.r16.g0637b60'
pkgrel='1'
pkgdesc='Bo neni cas pyco - git version'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/tkohout/$_reponame"
license=('unknown')
depends=('java-runtime')
makedepends=('git' 'java-environment' 'maven')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+$url"
	"fix-lib-paths.diff"
)
sha512sums=('SKIP'
            '6b71abf24317df13e8ffb95e0199d20da27537ddeda5cc21c11d49e0217cf345ee4db1dcf53d81e66bb24b4b9db884e6a103cbaa15635616154be9651849c687')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/fix-lib-paths.diff"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	mvn --batch-mode clean
	mvn --batch-mode install
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm644 "target/$_reponame-1.0-SNAPSHOT.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"

	install -dm755 "$pkgdir/usr/share/$_pkgname/"
	for _libfolder in 'out' 'src'; do
		cp -r --no-preserve=ownership --preserve=mode "${_pkgname}_lib/$_libfolder/" "$pkgdir/usr/share/$_pkgname/$_libfolder/"
	done

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
java -jar '/usr/share/java/$_pkgname/$_pkgname.jar' run "\$@"
EOF
	cat << EOF > "$pkgdir/usr/bin/${_pkgname}c"
#!/bin/sh
java -jar '/usr/share/java/$_pkgname/$_pkgname.jar' compile "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$_pkgname"{,c}
}
