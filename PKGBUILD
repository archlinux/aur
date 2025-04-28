pkgname="californium-tools-git"
pkgver=3.13.0
pkgrel=1
pkgdesc="Californium tools, including cf-client, cf-server and cf-browser."
url="https://eclipse.dev/californium/"
arch=("x86_64")
license=("Eclipse Distribution License 1.0 or Eclipse Public License 2.0")
makedepends=()
optdepends=()
depends=('maven' 'liberica-jdk-11-full-bin' 'coreutils')
source=("git+https://github.com/eclipse-californium/californium.tools.git#commit=$pkgver")
sha256sums=("SKIP")

build() {
	cd "$srcdir/californium.tools"
	export JAVA_HOME="/usr/lib/jvm/liberica-jdk-11-full"
	mvn -T $(nproc) clean install
# -Daether.dependencyCollector.impl=bf

	rm -fr jars bin applications 
	mkdir jars bin applications

	add_bin() {
		identifier="$1"
		jar_local_dir="$2"
		
		jar_file=$(find $jar_local_dir | grep "$identifier" | grep '\.jar$' | head -n 1)
		cp "$jar_file" "jars/$identifier.jar"

		echo "#!/bin/sh
export JAVA_HOME='/usr/lib/jvm/liberica-jdk-11-full'
/usr/lib/jvm/liberica-jdk-11-full/bin/java -jar /usr/share/californium-tools/jars/$identifier.jar "'$@'"
" > "bin/$identifier"
		chmod a+x "bin/$identifier"

	}
	add_app() {
		name="$1"
		identifier="$2"

		echo "[Desktop Entry]
Name=$name
Comment=Part of the Californium tools.
Exec=/usr/share/californium-tools/bin/$identifier
Terminal=false
Type=Application
MimeType=
" > "applications/$identifier.desktop"
	}

	add_bin "cf-browser"       "cf-browser/target"
	add_bin "cf-client"        "cf-client/target"
	add_bin "cf-jmeter-plugin" "cf-jmeter-plugin/target"
	add_bin "cf-rd"            "cf-rd/target"
	add_bin "cf-coapbench"     "cf-coapbench/target"
	add_bin "cf-polyfill"      "cf-polyfill/target"
	add_bin "cf-server"        "cf-server/target"
	
	add_app "Californium Browser" "cf-browser"
}

package() {
	cd "$srcdir/californium.tools"

	mkdir -p "$pkgdir/usr/share/californium-tools/"
	cp -r jars bin applications "$pkgdir/usr/share/californium-tools/"
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"

	for binary in $(cd bin && ls)
	do ln -s "/usr/share/californium-tools/bin/$binary" "$pkgdir/usr/bin/$binary"
	done

	for application in $(cd applications && ls)
	do ln -s "/usr/share/californium-tools/applications/$application" "$pkgdir/usr/share/applications/$application"
	done
}
