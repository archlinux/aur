# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-git
_pkgname=ferium
pkgver=3.28.7.r3.g7e795a6
pkgrel=1
pkgdesc="Ferium is an easy to use CLI program for downloading and updating Minecraft mods from Modrinth, CurseForge, and GitHub Releases."
arch=("x86_64")
depends=("gcc-libs")
makedepends=("cargo" "just" "zip" "unzip" "git")
optdepends=("gtk: Support for gui dialogs")
provides=("ferium")
conflicts=("ferium-gui-bin" "ferium-bin")
url="https://github.com/theRookieCoder/ferium"
license=('MPL2')
source=('git+https://github.com/theRookieCoder/ferium'
	"ferium.desktop")
sha256sums=('SKIP'
            '594cdfb846ab9cbac0fd781a445501ebb1e3f491fd21202bf3733b00f2151018')
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build(){
    cd "$srcdir/ferium"
    if pacman -T gtk3 > /dev/null; then
	echo "Detected gtk3, will compile gui version"
	just build-linux
        mv "$srcdir/ferium/out/ferium-linux-gnu.zip" "$srcdir/ferium/out/ferium.zip"
    else 
	echo "No gtk3 installed, will compile nogui version"
	just build-linux-nogui
        mv "$srcdir/ferium/out/ferium-linux-gnu-nogui.zip" "$srcdir/ferium/out/ferium.zip"
    fi
}
package() {
	cd "$srcdir/ferium/out"
	unzip -o ferium.zip
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium" 

	install -Dm644 -t "$pkgdir/usr/share/applications" "../../../ferium.desktop"
}
