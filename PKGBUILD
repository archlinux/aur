# Maintainer: lod (aur@cyber-anlage.de)

# Please put a legally purchased ROM of Super Mario 64 into the same directory with the name 'baserom.us.z64'.
# The ROM is checksummed to ensure that it is the correct version.

pkgname=render96ex-git
pkgver=3.2.r754.8e2eea10
pkgrel=1
pkgdesc='Super Mario 64 PC Port (sm64ex) fork including Render96 Textures and Models'
arch=('x86_64')
url='https://github.com/Render96/Render96ex'
license=('Unlicense')
makedepends=('git' 'python' 'audiofile')
depends=('sdl2' 'hicolor-icon-theme')
provides=(${pkgname%%-*})

_gitname=${pkgname%%-*} && _gitname=${_gitname^}

source=(git+https://github.com/Render96/Render96ex.git#branch=alpha
		git+https://github.com/pokeheadroom/RENDER96-HD-TEXTURE-PACK.git
		https://github.com/Render96/ModelPack/releases/download/${pkgver%%.r*}/Render96_DynOs_v${pkgver%%.r*}.7z
		${pkgname%%-*}.sh
		${pkgname%%-*}.desktop
		${pkgname%%-*}.png
		file://baserom.us.z64)
		
sha256sums=('SKIP'
            'SKIP'
            'd95ef25a694b1cd2e82785418aebf2aa8fd3a6b394b350fe51971474d19664b2'
            '0198c73bec5d904d58a8dd4ca608cc41a00526d1bb2bb3a3fdf68544ca43d500'
            'd717c1dd41169185aed3de19fefd93eff7be12d1f38114b12c6c3c44e3e94e73'
            '51dadd209c0ba63c3abbf42c7c9abfd5335268cd614d503221524853f05f9191')

pkgver() {
	cd $srcdir/$_gitname
	printf "${pkgver%%.r*}.r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
	cd $srcdir/$_gitname
	cp ../baserom.us.z64 ./
}

build() {
	cd $srcdir/$_gitname
	make VERSION=us EXTERNAL_DATA=1 TEXTURE_FIX=1 $MAKEFLAGS
}

package() {	
	install -Dm755 ${pkgname%%-*}.sh $pkgdir/usr/bin/${pkgname%%-*}
	install -Dm644 $srcdir/${pkgname%%-*}.desktop $pkgdir/usr/share/applications/${pkgname%%-*}.desktop
	install -Dm644 $srcdir/${pkgname%%-*}.png $pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname%%-*}.png
	install -Dm755 $srcdir/$_gitname/build/us_pc/sm64.us.* $pkgdir/usr/share/${pkgname%%-*}/${pkgname%%-*}
	cp -r --no-preserve=mode,ownership $srcdir/$_gitname/build/us_pc/res $pkgdir/usr/share/${pkgname%%-*}/
	cp -r --no-preserve=mode,ownership $srcdir/$_gitname/build/us_pc/dynos $pkgdir/usr/share/${pkgname%%-*}/
	cp -r --no-preserve=mode,ownership $srcdir/RENDER96-HD-TEXTURE-PACK/gfx/ $pkgdir/usr/share/${pkgname%%-*}/res
	cp -r --no-preserve=mode,ownership $srcdir/Render96_DynOs_v${pkgver%%.r*}/ $pkgdir/usr/share/${pkgname%%-*}/dynos/packs
}
