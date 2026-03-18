# Maintainer: Damglador <damglador@gmail.com>
# Thanks to copygirl for the main vintagestory packages, which this one is based on

pkgname=vintagestory-unstable
_pkgname=vintagestory

# _release is the version's release type, commonly "stable" for normal releases,
# "unstable" for release candidates and "pre" for testing releases before big updates.
_release=unstable
# _pkgver is separate to allow specifying pre-release versions such as "-rc.1".
_pkgver=1.22.0-rc.3

# makepkg doesn't support hyphens in pkgver, so we'll strip them as per `vercmp`.
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Uncompromising wilderness survival sandbox game (unstable branch)"
arch=("x86_64")
url="https://www.vintagestory.at/"
license=("custom")
depends=("dotnet-runtime-10.0" "opengl-driver" "openal" "glibc>=2.34")
options=("!strip" "!debug")
source=("https://cdn.vintagestory.at/gamefiles/$_release/vs_client_linux-x64_$_pkgver.tar.gz"
#       "https://account.vintagestory.at/files/$_release/vs_client_linux-x64_$_pkgver.tar.gz" (alternative source)
        "$_pkgname.desktop"
        "vsmodinstall-handler.desktop"
        "font.conf")
md5sums=('05bb59dd104af050db3144f5f1aeaad7'
         '09b467a592b34410933b457c262df0f2'
         'f086616f754a92eb4c39889d43abffd5'
         '9912e111cef7077cab433290c9995b6f')

prepare() {
	# Remove install script provided by developers
	rm vintagestory/install.sh
	# Create symbolic links for any assets (excluding fonts) containing non-lowercase letters
	# Some asset files might include uppercase letters, but the game expects them to be lowercase
	find vintagestory/assets/ -not -path "*/fonts/*" -regex ".*/.*[A-Z].*" | while read -r file; do
		local filename="$(basename -- "$file")"
		ln -sf "$filename" "${file%/*}"/"${filename,,}"
	done
}

package() {
	# Copy application icon and .desktop files
	install -Dm644 vintagestory/assets/gameicon.png "$pkgdir"/usr/share/pixmaps/"$pkgname".png
	install -Dm644 vintagestory.desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
	install -Dm644 vsmodinstall-handler.desktop "$pkgdir"/usr/share/applications/"$pkgname"-modinstall-handler.desktop

	# Copy all other application files (`/opt` is the right place to dump this)
	install -dm 755 "$pkgdir"/opt # Create directory first (required)
	cp -r --preserve=mode vintagestory "$pkgdir"/opt/"$pkgname"

	# Override `font.conf` provided by the game, as it is useless
	install -Dm644 font.conf "$pkgdir"/opt/"$pkgname"/font.conf

	# Create a symlink to run the launch script from terminal
	install -dm 755 "$pkgdir"/usr/bin # Create directory first (required)
	ln -s /opt/"$pkgname"/run.sh "$pkgdir"/usr/bin/"$pkgname"
}
