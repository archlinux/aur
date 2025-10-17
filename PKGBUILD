# Maintainer: Darren Ng <`base64 -d <<<aGMwbWV1QG5hdmVyLmNvbQo=`>

_V=1.4.5
pkgver=r368.9aed33b
pkgrel=3
arch=(any)

pkgname=apkeditor-git
url=https://github.com/REAndroid/APKEditor
pkgdesc="powerful android apk editor - aapt/aapt2 independent"
license=(Apache-2.0)
source=(git+https://github.com/REAndroid/{APKEditor,ARSCLib,JCommand,smali-lib})
sha256sums=(SKIP SKIP SKIP SKIP)
provides=(apkeditor=$_V)
conflicts=(apkeditor)

_J=8
depends=(jre$_J-openjdk-headless)
makedepends=(jdk$_J-openjdk git)

pkgver() {
	cd APKEditor
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {

	# java 1.8
	[[ JavaVersion.VERSION_1_8 = `find "$srcdir" -name build.gradle | xargs grep -h VERSION | tr -s " " | cut -d " " -f 3 | sort | uniq` ]]
	export JAVA_HOME=/usr/lib/jvm/java-$_J-openjdk

	# smali aka smali-lib
	ln -sv "smali-lib" smali

	# remove prebuilt libs
	local _L="$srcdir"/APKEditor/libs
	rm -rf "$_L"
	mkdir "$_L"

	# build lib
	cd "$srcdir"/ARSCLib
	./gradlew jar
	mv -v build/libs/ARSCLib-1.3.8.jar "$_L"/ARSCLib.jar

	# build lib
	cd "$srcdir"/JCommand
	./gradlew jar
	mv -v build/libs/JCommand-1.0.0.jar "$_L"/JCommand.jar

	# build lib
	cd "$srcdir"/smali
	./gradlew jar
	./gradlew :smali:fatjar
	mv -v smali/build/libs/smali-2.5.2-fat.jar "$_L"/smali.jar

	# build apkeditor
	cd "$srcdir"/APKEditor
	./gradlew fatJar

}

package() {

	# install
	local _S=usr/share/java/apkeditor
	mkdir -p "$pkgdir"/$_S
	mv APKEditor/build/libs/APKEditor-$_V.jar "$_"/

	# dump version
	ln -sv "smali-lib" smali
	for i in $_P APKEditor ARSCLib JCommand smali; do
		cd "$srcdir"/$i
		printf "${i^^}=%s # r%s\n" "$(git rev-parse HEAD)" "$(git rev-list --count HEAD)"
	done >"$pkgdir"/$_S/VERSION

# runner
mkdir -p "$pkgdir"/usr/bin
cd "$_"
cat >apkeditor <<EOF
#!/bin/sh
exec /usr/lib/jvm/java-$_J-openjdk/jre/bin/java -jar /$_S/APKEditor-$_V.jar "\$@"
EOF
chmod +x apkeditor

}

# vim: set noexpandtab:

