# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

dirname="deskchan"

# Maintainer: Your Name <youremail@domain.com>
pkgname="deskchan-git"   # '-bzr', '-git', '-hg' or '-svn'
pkgrel=1
pkgver=0.2.7
pkgdesc="DeskChan, your personal computer assistant."
arch=("any")
url="https://deskchan.info"
license=('LGPL')
groups=()
depends=('java-runtime' 'launch4j' 'libappindicator')
makedepends=('git' 'java-environment>7' 'unzip') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("deskchan")
conflicts=("deskchan")
replaces=()
backup=()
options=()
install=
source=("$dirname::git+https://github.com/DeskChan/DeskChan#branch=master")
noextract=()
md5sums=('SKIP')


# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/$dirname"

	printf "%s" "$(grep -E 'project\.version.*([0-9\.]+)' build.gradle | grep -oE '[0-9]+\.[0-9\.]*')"

# If not effective, will change to
# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/$dirname"
	./gradlew createExeDistZip
}

check() {
	cd "$srcdir/$dirname"
	test -f build/distributions/*zip
}

package() {
	cd "$srcdir/$dirname"
	mkdir -p $pkgdir/opt/deskchan
	cp build/distributions/*zip $pkgdir/opt/deskchan/deskchan.zip
	cd $pkgdir/opt/deskchan
	unzip deskchan.zip
	rm deskchan.zip

	cd $pkgdir
	mkdir -p $pkgdir/usr/bin

	ln -s /opt/deskchan/bin/DeskChan usr/bin/deskchan
	mkdir -p opt/deskchan/assets opt/deskchan/data
	chmod a+rw -R $pkgdir/opt/deskchan/

	mkdir -p $pkgdir/usr/share/applications $pkgdir/usr/share/icons
	cp $startdir/deskchan.desktop $pkgdir/usr/share/applications/
	cp $srcdir/$dirname/misc/appicon.ico $pkgdir/usr/share/icons/deskchan.png
}
