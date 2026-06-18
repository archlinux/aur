# Maintainer: Darren Ng <`base64 -d <<<aGMwbWV1QG5hdmVyLmNvbQo=`>

pkgver=r380.7f76539
pkgrel=2
arch=(any)

pkgname=apkeditor-git
url=https://github.com/REAndroid/APKEditor
pkgdesc="powerful android apk editor - aapt/aapt2 independent"
license=(Apache-2.0)
source=(git+https://github.com/REAndroid/{APKEditor,ARSCLib,JCommand,smali-lib})
sha256sums=(SKIP SKIP SKIP SKIP)
provides=(apkeditor)
conflicts=(apkeditor)

_J=8
_JV=VERSION_1_8
depends=(jre$_J-openjdk-headless)
makedepends=(jdk$_J-openjdk git)

pkgver() {
	cd APKEditor
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {

	# java 1.8
	[[ JavaVersion.$_JV = `find "$srcdir" -name build.gradle | xargs grep -h VERSION | tr -s " " | cut -d " " -f 3 | sort | uniq` ]]
	export JAVA_HOME=/usr/lib/jvm/java-$_J-openjdk

	# alias
	ln -sv "smali-lib" smali

	# remove prebuilt libs
	local _L="$srcdir"/APKEditor/libs
	rm -rf "$_L"
	mkdir "$_L"

	# build lib
	cd "$srcdir"/ARSCLib
	./gradlew jar
	# automatically calculate relative path with realpath
	#ln -s "$(realpath --relative-to="$_L" build/libs/ARSCLib-*.jar)" "$_L"/ARSCLib.jar
	ln -sr build/libs/ARSCLib-*.jar "$_L"/ARSCLib.jar

	# build lib
	cd "$srcdir"/JCommand
	./gradlew jar
	ln -sr build/libs/JCommand-*.jar "$_L"/JCommand.jar

	# build lib
	cd "$srcdir"/smali
	./gradlew jar
	./gradlew :smali:fatjar
	ln -sr smali/build/libs/smali-*-fat.jar "$_L"/smali.jar

	# build apkeditor
	cd "$srcdir"/APKEditor
	./gradlew fatJar

}

package() {

	# install
	local _S=usr/share/java/apkeditor
	mkdir -p "$pkgdir"/$_S
	cp APKEditor/build/libs/APKEditor-*.jar "$_"/APKEditor.jar

	# dump version
	ln -sfv "smali-lib" smali
	for i in $_P APKEditor ARSCLib JCommand smali; do
		cd "$srcdir"/$i
		printf "${i^^}=%s # r%s\n" "$(git rev-parse HEAD)" "$(git rev-list --count HEAD)"
	done >"$pkgdir"/$_S/VERSION

# runner
	mkdir -p "$pkgdir"/usr/bin
	cd "$_"
cat >apkeditor <<EOF
#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-$_J-openjdk
exec "\$JAVA_HOME"/jre/bin/java -jar /$_S/APKEditor.jar "\$@"
EOF
	chmod +x apkeditor

}

# vim: set noexpandtab:

