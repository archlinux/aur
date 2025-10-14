# Maintainer: copygirl <copygirl@mcft.net>
pkgname=vintagestory

# `$_release` is the version's release type, commonly "stable" for normal releases,
# "unstable" for release candidates and "pre" for testing releases before big updates.
_release=stable
# `$_pkgver` is separate to allow specifying pre-release versions such as "-rc.1".
_pkgver=1.21.5

# `makepkg` doesn't support hyphens in `$pkgver`, so we'll strip them as per `vercmp`.
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Uncompromising wilderness survival sandbox game (requires paid account)"
arch=("x86_64")
url="https://www.vintagestory.at/"
license=("custom")
depends=("dotnet-runtime-8.0" "opengl-driver" "openal" "glibc>=2.34")
options=(!strip !debug) # .NET game probably doesn't need symbols stripped or a debug package
source=("https://cdn.vintagestory.at/gamefiles/$_release/vs_client_linux-x64_$_pkgver.tar.gz"
#       "https://account.vintagestory.at/files/$_release/vs_client_linux-x64_$_pkgver.tar.gz" (alternative source)
        "$pkgname.desktop"
        "vsmodinstall-handler.desktop")
md5sums=("d360857b7c8d56c0e165185b2d65c21c"
         "0cd6360c157fc7dc4d52952e83483e7d"
         "8ccc9b49290dda21199b14ac3cd4ac7e")

prepare() {
	# Remove install script provided by developers
	rm "$pkgname"/install.sh

	# Create symbolic links for any assets (excluding fonts) containing non-lowercase letters
	# Some asset files might include uppercase letters, but the game expects them to be lowercase
	find "$pkgname"/assets/ -not -path "*/fonts/*" -regex ".*/.*[A-Z].*" | while read -r file; do
		local filename="$(basename -- "$file")"
		ln -sf "$filename" "${file%/*}"/"${filename,,}"
	done
}

package() {
	# Copy application icon and .desktop files
	install -Dm644 "$pkgname"/assets/gameicon.xpm "$pkgdir"/usr/share/pixmaps/"$pkgname".xpm
	install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
	install -Dm644 vsmodinstall-handler.desktop "$pkgdir"/usr/share/applications/vsmodinstall-handler.desktop

	# Copy all other application files (`/opt` is the right place to dump this)
	install -dm 755 "$pkgdir"/opt # Create directory first (required)
	cp -r --preserve=mode -t "$pkgdir"/opt "$pkgname"

	# Create a symlink to run the launch script from terminal
	install -dm 755 "$pkgdir"/usr/bin # Create directory first (required)
	ln -s /opt/"$pkgname"/run.sh "$pkgdir"/usr/bin/"$pkgname"
}
