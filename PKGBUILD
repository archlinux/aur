# Maintainer: Julian Hofmann <aur at julianh dot de>

## links
# https://crossonic.org
# https://github.com/juho05/crossonic

pkgname="crossonic-bin"
_pkgname="${pkgname%-bin}"
pkgver=0.5.2
pkgrel=1
pkgdesc="An OpenSubsonic compatible cross-platform music client"
arch=('x86_64')
url="https://github.com/juho05/crossonic"
license=("MPL-2.0")

depends=(
	'gtk3'
	'mpv'
	'fontconfig'
	'cairo'
	'gdk-pixbuf2'
	'glib2'
	'glibc'
	'libgcc'
	'libstdc++'
	'libx11'
	'libxi'
	'at-spi2-core'
	'pango'
	'libepoxy'
	'harfbuzz'
	'zlib'
	'hicolor-icon-theme'
)
makedepends=('patchelf')
provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!debug')

_pkgsrc="Crossonic-$pkgver-linux-x86-64"
_pkgext="tar.gz"
source=(
	"$_pkgsrc.$_pkgext"::"$url/releases/download/v$pkgver/$_pkgsrc.$_pkgext"
)
noextract=("$_pkgsrc.$_pkgext")
sha256sums=(
	'aef19f52680685b4b9c8fbf764a4b1e926fc30df81b1c946d4435e954f1c2a93'
)

prepare() {
	# the tarball has no top level directory
	rm -rf "$_pkgsrc"
	mkdir "$_pkgsrc"
	bsdtar -xf "$_pkgsrc.$_pkgext" -C "$_pkgsrc"
}

package() {
	install -dm755 "$pkgdir/usr/lib/$_pkgname" "$pkgdir/usr/bin"
	cp -a "$_pkgsrc/." "$pkgdir/usr/lib/$_pkgname/"

	# the upstream libs contain rpaths of the build machine
	patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/$_pkgname/lib"/*.so

	# the release binary is built with the version check enabled
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
export CROSSONIC_DISABLE_VERSION_CHECK=1
exec /usr/lib/$_pkgname/Crossonic "\$@"
END

	local _appid="org.crossonic.app"
	install -Dm644 "$_pkgsrc/data/flutter_assets/assets/icon/desktop/crossonic-512.png" \
		"$pkgdir/usr/share/icons/hicolor/512x512/apps/$_appid.png"

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_appid.desktop" << END
[Desktop Entry]
Type=Application
Name=Crossonic
Comment=Music player for (Open)Subsonic servers
Exec=$_pkgname
Icon=$_appid
Categories=AudioVideo;Audio;Player;
Keywords=music;player;subsonic;opensubsonic;
StartupWMClass=$_appid
StartupNotify=true
Terminal=false
END

	install -Dm644 /dev/stdin "$pkgdir/usr/share/metainfo/$_appid.metainfo.xml" << END
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>$_appid</id>
  <name>Crossonic</name>
  <summary>Music player for (Open)Subsonic servers</summary>
  <developer id="de.julianh">
    <name>Julian Hofmann</name>
  </developer>
  <metadata_license>CC0-1.0</metadata_license>
  <project_license>MPL-2.0</project_license>
  <description>
    <p>
      Crossonic is a modern cross-platform music client for crossonic-server and other (Open)Subsonic compatible music servers.
    </p>
  </description>
  <launchable type="desktop-id">$_appid.desktop</launchable>
  <url type="homepage">https://crossonic.org/app</url>
  <url type="bugtracker">https://github.com/juho05/crossonic/issues</url>
  <categories>
    <category>AudioVideo</category>
    <category>Audio</category>
  </categories>
  <content_rating type="oars-1.1"/>
  <provides>
    <binary>$_pkgname</binary>
  </provides>
</component>
END
}
