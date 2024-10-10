# Maintainer: lod (aur@cyber-anlage.de)

# Please put a legally purchased ROM of Super Mario 64 into the same directory with the name 'baserom.us.z64'.
# The ROM is checksummed to ensure that it is the correct version.

pkgname=render96ex-git
pkgver=3.2.r767.06f2594f
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
		
b2sums=('SKIP'
        'SKIP'
        'a823aeba5447ad6281ece46184aa292ce21e6a4dc5b83e3c825503ad2e2500350f307b184744f4c655984b99f2ba3efda0b1f8e99c09b0bc46fa1d6c7b71950d'
        '94568ad233c0e2f9901f088b0192e1f956b3cf39119598444970fe9d8125f2dbe5503cfb67287bdd2f0d67492ccb22e3cfede6206c930b33bcc7806a74e3cf0d'
        '46895d9367d2ab36ef2fbbc48c5ffb5ef532a462a16f2be715903b1685ffd65012a9acb8e649d154660aee66367b5cb729a5282f6876b5e614795c2e2fbdcc57'
        'c86b1aca74da0a1108bf1e3801ad6bd99ddd3ca46a1edce55f7549b1f06ffaf1c996058eaca21d806a618c0e739e2d1995bf22bb6b0d14cb9683180cfc25e213'
        'db73672334acf22d2ea182ebd8bffd472b9478dd2f4b117b178d8543ef61435386df5ff285d2f086d1f79fdf4dd7e19c78046376f791616627d4d50d40a874f9')
        

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
