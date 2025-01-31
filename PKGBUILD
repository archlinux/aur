# Maintainer: lod (aur@cyber-anlage.de)

# Please put a legally purchased ROM of Super Mario 64 into the same directory with the name 'baserom.us.z64'.
# The ROM is checksummed to ensure that it is the correct version.

pkgname=render96ex-git
pkgver=3.25.r849.61480c4e
pkgrel=1
pkgdesc='Super Mario 64 PC Port (sm64ex) fork including Render96 Textures and Models'
arch=('x86_64')
url='https://github.com/Render96/Render96ex'
license=('Unlicense')
makedepends=('git' 'python' 'audiofile' 'glu')
depends=('bash' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'sdl2' )
provides=(${pkgname%%-*})
_gitname=${pkgname%%-*} && _gitname=${_gitname^}
options=('!debug')
source=(git+https://github.com/Render96/Render96ex.git#branch=tester
		git+https://github.com/pokeheadroom/RENDER96-HD-TEXTURE-PACK.git
		git+https://github.com/Render96/ModelPack.git#branch=models_vanilla
		https://github.com/Render96/ModelPack/releases/download/${pkgver%%.r*}/Render96_DynOs_v${pkgver%%.r*}.7z
		https://sm64pc.info/downloads/levels/Render96_Bob_omb_Battlefield_v4.7z
		https://sm64pc.info/downloads/levels/Render96_Bowser_1_v3.7z
		https://sm64pc.info/downloads/levels/Render96_Bowser_2_v3.7z
		https://sm64pc.info/downloads/levels/Render96_Cool_Cool_Mountain_v3.7z
		https://sm64pc.info/downloads/levels/Render96_Jolly_Roger_Bay_v3.7z
		https://sm64pc.info/downloads/levels/Render96_Whomps_Fortress_v3.7z
		${pkgname%%-*}.sh
		${pkgname%%-*}.desktop
		${pkgname%%-*}.png
		file://baserom.us.z64)
		
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'ff0d769182e9ac82462f20e184683b3baefdbe1d45e2eeab98b865fc2d5c4e2b8c110542029053da64bb758edeab3d4a2a87a74829dc7c440ca3da1653e39e68'
        'b090ee9179141ff44cf5a39b6630db6666b0ea7a76836eb5f3dd1fcce568c4cec8a3b92185791330155f73fc4db5a9729a097f87e9097396236aa36da26c54f7'
        'd1a1ce2274b3e09e74c86c68b695d8075222346b2b5ebecfd1f4d793b190b94bd46494573b38392cd4d6c6ccbcd92c7970811a61a4ffe8d56077c32c8457081b'
        'f17dd5d3733b64288fd6e8b4606fcf635e30aee49a3761db10f006876a8a25278dc165b5632328c90953bd8438f69a405f6ee6b293f7e3f5ac3f152d847730da'
        'fb8d3d45d1204ab3579c6653ddf250cb0acfdba222fd760396c968a05ec54f55bd3172ea26ecd0d00810952aab02133ca20a9626360e5c3e2e6fdf9a11500c23'
        'a1808ddd9c2068f3809ba2db5aa5f78e36a4865a15804eaca1264481f2ceab2140e806b2e06d418420d655e146de4d1421d0c5d2e94309310dcdffb8ee6a86d2'
        '0cb89452a0972101b0b37ec0ce0da8a0a17c57fa99a90de59f099f04639ab37cedf179ec914a27b3b2ab3c925a6fe66ed647471b2a506c774e5c92690eccd989'
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

	cp -r $srcdir/ModelPack/Render96/* $srcdir/$_gitname/actors/

	cp -r $srcdir/levels/* $srcdir/$_gitname/levels/

	mkdir -p $srcdir/$_gitname/build/us_pc/dynos/packs/
	cp -r $srcdir/Render96_DynOS_v${pkgver%%.r*}/ $srcdir/$_gitname/build/us_pc/dynos/packs/
	cp -r $srcdir/Render96\ Luigi\ v${pkgver%%.r*} $srcdir/$_gitname/build/us_pc/dynos/packs/
	cp -r $srcdir/Render96\ Wario\ v${pkgver%%.r*} $srcdir/$_gitname/build/us_pc/dynos/packs/
	cp -r $srcdir/Render96\ Mario\ v${pkgver%%.r*} $srcdir/$_gitname/build/us_pc/dynos/packs/
	
	# add #include <stdio.h> to these files so it can build with SDL2-compat
	sed -i '/#include <SDL2\/SDL.h>/a #include <stdio.h>' src/pc/audio/audio_sdl.c src/pc/gfx/gfx_opengl.c
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
}
