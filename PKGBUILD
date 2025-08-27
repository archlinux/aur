# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
_pkgname=supertux-advance
pkgname=supertux-advance-git
pkgver=0.2.1.r600.g9ac64c2e
pkgrel=3
pkgdesc="A SuperTux game made in Brux GDK with 16bit-style graphics."

arch=(any)

url="https://codeberg.org/KelvinShadewing/supertux-advance"
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

	cd "$_pkgname"

	# Copy folder structure with good permissions
	/usr/bin/find . \
	-type d \
	-exec \
	/usr/bin/install -dm755 "${pkgdir}/opt/${_pkgname}/{}" \;

	# Populate with game-data, except the Windows bits and the executable
	/usr/bin/find . \
	-type f \
	-exec \
	/usr/bin/install -m644 "{}" "${pkgdir}/opt/${_pkgname}/{}" \;

	cd ..

	install -Dm644 "$_pkgname/icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"
}
