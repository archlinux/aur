# Maintainer: Sankalp Gambhir <sankalp.gambhir42@gmail.com>
pkgname=stainless-git
pkgver=v0.9.9.1.r2.29e2f052
pkgrel=1
pkgdesc="Verification framework and tool for higher-order Scala programs"
arch=(x86_64)
url="https://github.com/epfl-lara/stainless"
license=('Apache-2.0')
groups=()
depends=('java-runtime>=17')
makedepends=(git sbt)
optdepends=('z3: for using as a solver backend' 'cvc4: for using as a solver backend' 'cvc5: for using as a solver backend')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/epfl-lara/stainless')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-*}"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/${pkgname%-*}"
	sbt assembly # actually compile and assemble uber jar
	SCALA_VER="$(grep "val stainlessScalaVersion = " build.sbt | awk '{gsub(/"/, "", $4); print $4}')" # get scala version from build, remove quotes
	STAINLESS_VER="$(git describe --abbrev=7 | sed 's/^v//')" # trim and strip v from git versioning e.g. v0.9.1... -> 0.9.1...
	echo "--- Copying JAR"
	cp "./frontends/dotty/target/scala-$SCALA_VER/stainless-dotty-assembly-$STAINLESS_VER.jar" stainless.jar
	echo "--- Generating stainless script"
	touch stainless
	chmod +x stainless
	echo "#!/bin/env sh" > stainless
	echo "exec /usr/bin/java -jar './stainless.jar' \"\$@\"" >> stainless 
}

package() {
	echo "--- Generating final stainless script"
	cd "$srcdir/${pkgname%-*}"
	echo "#!/bin/env sh" > stainless
	echo "exec /usr/bin/java -jar '/usr/share/java/stainless/stainless.jar' \"\$@\"" >> stainless 

	echo "--- Copying files"

	# copy package jar
	install -Dm644 "stainless.jar" "$pkgdir/usr/share/java/stainless/stainless.jar"

	# copy shell script
	install -Dm755 "stainless" "$pkgdir/usr/bin/stainless"

	# copy license
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
