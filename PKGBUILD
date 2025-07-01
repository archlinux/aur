# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=adwaita-colors-icon-theme
_reponame=Adwaita-colors
pkgver=2.4.2
_commit=2f6b3dc9be1059f99a086c65e3fd12e54aa48c5d # Release tag commit
pkgrel=1
pkgdesc="Adwaita Colors enhances the Adwaita icon theme by integrating GNOME’s accent color feature. It ensures that your Adwaita icons reflect the same accent color as your GNOME theme."
arch=(any)
url="https://github.com/dpejoh/Adwaita-colors"
license=(GPL3)
depends=("adwaita-icon-theme" "adwaita-icon-theme-legacy")
makedepends=("git")
conflicts=("adwaita-colors-icon-theme-git")
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

package() {
	# Find all directories starting with "Adwaita-" in $_reponame
	find $_reponame -type d -name "Adwaita-*" | while read -r dir; do
		# Construct the full path to the "index.theme" file
		file="$dir/index.theme"
		# Check if the file exists and contains the target text
		if [ -f "$file" ] && grep -q "Inherits=Adwaita," "$file"; then
			# Replace the text using sed
			sed -i 's/Inherits=Adwaita,/Inherits=MoreWaita,Adwaita,/g' "$file"
		fi
	done
	local themedir="$pkgdir/usr/share/icons"
	install -d "$themedir"
	cp -r "$_reponame/Adwaita"*      "$themedir"
}
