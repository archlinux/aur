# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_reponame='OSTRAJava'
_pkgname="${_reponame,,}"
pkgname="$_pkgname-git"
pkgver='1.1.r16.g0637b60'
pkgrel='1'
pkgdesc='Bo neni cas pyco - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
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
sha256sums=('SKIP'
            '409f5b9d171d278aa50386e79f58b0f0a5370659999549b86c985fe1421bb026')

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
