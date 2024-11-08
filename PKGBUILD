#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
#Contributor: Andrew Bueide <abueide@protonmail.com>
_pkgname="gdx-texture-packer-gui"
pkgname="${_pkgname}-git"
pkgver=r708.76ff228
pkgrel=1
pkgdesc="A command line and GUI for packing textures"
arch=('any')
url="https://github.com/crashinvaders/gdx-texture-packer-gui"
license=('Apache')
depends=('java-runtime' 'unzip')
conflicts=("$_pkgname")
source=("$url/archive/refs/heads/master.zip")
sha256sums=('SKIP')

pkgver() {
	# Define the remote URL and branch to track
	local remote_url="$url"      # Replace with your repo URL
	local remote_branch="master" # Replace with your branch name, e.g., main or master

	# Fetch only the commit history for the remote branch
	git init -q temp_repo
	cd temp_repo || exit
	git remote add origin "$remote_url"
	git fetch origin "$remote_branch" >/dev/null 2>&1

	# Count the number of commits and get the latest commit hash
	commit_count=$(git rev-list --count origin/"$remote_branch")
	commit_hash=$(git rev-parse --short origin/"$remote_branch")

	# Format the version string similarly
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$commit_count" "$commit_hash"
	)

	# Clean up
	cd ..
	rm -rf temp_repo
}

build() {
	printf "#!/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${_pkgname}/${_pkgname}.jar' \"\$@\"\n" >${_pkgname}.sh
	cd ${srcdir}/${_pkgname}-master
	JAVA_HOME=/usr/lib/jvm/java-8-openjdk/ ./gradlew distRelease
}

package() {
	install -Dm644 "${srcdir}/${_pkgname}-master/distribution/output/gdx-texture-packer.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
	install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
}
