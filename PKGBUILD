# Maintainer: Luke Chen Shui <chenshuiluke@gmail.com>
pkgname=portmapper-git
pkgver=2.2.1
pkgrel=2
_pkgname=portmapper
epoch=
pkgdesc='A tool to easily manage port mappings and port forwarding through UPnP'
arch=('i686' 'x86_64')
url="https://github.com/kaklakariada/portmapper"
depends=('java-runtime>=11' 'coreutils')
source=("git+https://github.com/kaklakariada/portmapper.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | sed 's/^v//' | sed 's/-/_/g')"
}

build(){
	cd "${_pkgname}"
	./gradlew build
}

package() {
	# Create necessary directories
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/applications
	mkdir -p "$pkgdir"/usr/share/portmapper

	# Move the startup script to /usr/bin, and the
	# (complete) generated .jar to /usr/share/portmapper
	cp ../portmapper.sh "$pkgdir"/usr/bin/portmapper
	cp $srcdir/portmapper/build/libs/portmapper-"${pkgver}"-all.jar "$pkgdir"/usr/share/portmapper/portmapper.jar

	# Replace Version line in the .desktop.template file
	cat ../portmapper.desktop.template \
	| sed 's/Version=/Version='"$pkgver/" \
	> "$pkgdir"/usr/share/applications/portmapper.desktop

	# Mark the portmapper script as executable
	chmod a+x "$pkgdir"/usr/bin/portmapper
}
