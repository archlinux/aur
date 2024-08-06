# Maintainer: username227 <gfrank227 at gmail dot com> 

pkgname=deemix-fix-gui-appimage-git
pkgver=r264.a755828
pkgrel=1
pkgdesc='A GUI electron app for the deemix library'
url=https://gitlab.com/deeplydrumming/DeemixFix
license=("GPL3-or-later")
arch=("x86_64")
provides=('deemix')
conflicts=('deemix-gui-appimage' 'deemix-gui-git' 'deemix-fix-gui-git')
depends=('hicolor-icon-theme')
makedepends=('git' 'pnpm' 'electron' 'unappimage-git' 'cairo')
source=('git+https://gitlab.com/deeplydrumming/DeemixFix' 'packagefix.patch' 'deemix-gui.desktop')
b2sums=('SKIP'
        '8544eeed4112f12417a6fdd6e22c90a4877d013bafeb009a594314c5f0f0fd612d995af1dfea74a6c24a7f98b782f021eed75d4a8eb2081d63e4b14804fcaafc'
        '0c2d4326bfb12715930139e055e6543fc8d6d3863725dd3e1cac4f052dd8df7b32577ea5c08ed0a903bfcff227f311d0a5a3d407ace655c89963138d1e77a60b')
options=('!strip')
pkgver() {
  cd DeemixFix
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
	cd $srcdir/DeemixFix
	pnpm i
	patch package.json $srcdir/packagefix.patch
	pnpm dist
	unappimage $srcdir/DeemixFix/dist/deemix-gui.AppImage
}
package(){
	install -dm644 $pkgdir/usr/share/icons
	install -Dm755 $srcdir/DeemixFix/dist/deemix-gui.AppImage $pkgdir/usr/bin/deemix-gui
	cp -r $srcdir/DeemixFix/squashfs-root/usr/share/icons/hicolor $pkgdir/usr/share/icons/hicolor
	install -Dm755 $srcdir/deemix-gui.desktop -t $pkgdir/usr/share/applications
}

