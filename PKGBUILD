# Maintainer: Luke Chen Shui <chenshuiluke@gmail.com>
pkgname=portmapper-git
pkgver=2.2.1_46_gbe0982a
pkgrel=1
epoch=
pkgdesc='A tool to easily manage port mappings and port forwarding through UPnP'
arch=('i686' 'x86_64')
url="https://github.com/kaklakariada/portmapper"
depends=('java-runtime>=11' 'coreutils')
makedepends=('gradle')
source=("git+https://github.com/kaklakariada/portmapper.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | sed 's/^v//' | sed 's/-/_/g')"
}

build() {
	cd portmapper

	if [[ -v HOME && ! -v GRADLE_USER_HOME ]]; then
		# Set the Gradle home to the .cache directory, as
		# not to indefinitely clutter the user's home directory
		# with half a gibibyte of hidden data
		GRADLE_USER_HOME="$HOME/.cache/gradle" gradle build
	else
		# Let Gradle figure out where to place its cache
		gradle build
	fi
}

package() {
	# Create necessary directories
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/applications
	mkdir -p "$pkgdir"/usr/share/portmapper

	# Upstream seems to configure the project so that Gradle considers this
	# build to be the next release's version, though $(git describe ...)
	# uses the latest tag's version number. Unfortunately this affects the name
	# of the built jar.
	local realver="$(cd "$srcdir"/portmapper/build/libs; echo portmapper-*-all.jar | sed 's|portmapper-\(.*\)-all.jar|\1|')"
	[[ -n "$realver" ]] || (echo "Failed to get the name of the built Java archive." 1>&2 && return 1)

	# Move the startup script to /usr/bin, and the
	# (complete) generated .jar to /usr/share/portmapper
	cd "$srcdir"
	cp ../portmapper.sh "$pkgdir"/usr/bin/portmapper
	cp "$srcdir"/portmapper/build/libs/portmapper-"$realver"-all.jar "$pkgdir"/usr/share/portmapper/portmapper.jar

	# Replace Version line in the .desktop.template file
	cat ../portmapper.desktop.template \
	| sed 's/Version=/Version='"$pkgver/" \
	> "$pkgdir"/usr/share/applications/portmapper.desktop

	# Mark the portmapper script as executable
	chmod a+x "$pkgdir"/usr/bin/portmapper
}
