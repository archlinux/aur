# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
_pkgname=supertux-advance
pkgname=supertux-advance-git
pkgver=0.2.1.r600.g9ac64c2e
pkgrel=1
pkgdesc="A SuperTux game made in Brux GDK with 16bit-style graphics."

arch=(any)

url="https://github.com/KelvinShadewing/supertux-advance"
license=('AGPL-3.0-only')

depends=('brux-gdk-git')
makedepends=('git')

provides=("supertux-advance")
conflicts=("supertux-advance")

source=("$_pkgname::git+$url.git#branch=main" "$_pkgname-exec" "$_pkgname.desktop")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$_pkgname"

	local tag
	tag=$(git describe --tags --abbrev=0)

	# Get the number of commits since the last tag
	local commits
	commits=$(git rev-list "${tag}..HEAD" --count)

	# Get the current commit hash (abbreviated)
	local commit_hash
	commit_hash=$(git rev-parse --short HEAD)

	# Remove the 'v' prefix if it exists
	tag=${tag#v}

	# Construct the version string
	echo "${tag}.r${commits}.g${commit_hash}"
}

package() {
	# Executable and Desktop file
	install -Dm755 "$_pkgname-exec" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	# Source files
	install -dm755 "$pkgdir/opt/$_pkgname/src"
	install -dm755 "$pkgdir/opt/$_pkgname/res"
	install -dm755 "$pkgdir/opt/$_pkgname/lang"
	install -dm755 "$pkgdir/opt/$_pkgname/contrib"
	install -dm755 "$pkgdir/opt/$_pkgname/mods"

	cp -r "$_pkgname/src/"* "$pkgdir/opt/$_pkgname/src/"
	cp -r "$_pkgname/res/"* "$pkgdir/opt/$_pkgname/res/"
	cp -r "$_pkgname/lang/"* "$pkgdir/opt/$_pkgname/lang/"
	cp -r "$_pkgname/contrib/"* "$pkgdir/opt/$_pkgname/contrib/"
	cp -r "$_pkgname/mods/"* "$pkgdir/opt/$_pkgname/mods/"

	install -Dm644 "$_pkgname/icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"
	install -Dm644 "$_pkgname/icon.png" "$pkgdir/opt/$_pkgname/icon.png"
	install -Dm644 "$_pkgname/supertuxadvance.ico" "$pkgdir/opt/$_pkgname/supertuxadvance.ico"

	install -Dm644 "$_pkgname/game.brx" "$pkgdir/opt/$_pkgname/game.brx"

	install -Dm644 "$_pkgname/README.md" "$pkgdir/opt/$_pkgname/README.md"
	install -Dm644 "$_pkgname/LICENSE" "$pkgdir/opt/$_pkgname/LICENSE"
}
