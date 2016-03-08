# Mantainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.10
pkgrel=2
pkgdesc="Cocos2D-X is a game engine that supports multiple platforms such as iOS, Android, WinXP/7/8, WP8, BlackBerry, MeeGo, Marmelade, WebOS, Mac OS X"
arch=('i686' 'x86_64')
url="http://www.cocos2d-x.org/filedown/"
license=('MIT License')
depends=('glew' 'glfw' 'glibc' 'fontconfig' 'libgl' 'curl' 'libx11' 'zlib' 'libpng' 'freetype2' 'python2')
#depends=('openssl' 'sqlite3')
options=('!buildflags' '!strip' 'staticlibs')
source=("${url}${_appname}-${pkgver}.zip"
"README"
"$_appname.sh"
"$_appname.csh"
"CCActionCamera.patch"
"CCControlUtils.patch"
)
sha1sums=('c8bb2a1d355d3c6a342fb0f95b0e47f0113eada7'
'1f9b4f74223b5ac1ec235c553e9eca2a2c927eca'
'353bdefe07bdb6eb7f53aff20d20e83b488c1c05'
'49b7919fc38803c1dd2f5b1d47fb0c75fde1fec6'
'd28977c340ffa686a188246c6875c837bbc01fd6'
'3bb44fe6e6a8f3278ffddc6c849ba97ada31cd30'
)

prepare() {
	chmod +x "download-deps.py"
	patch ./cocos/2d/CCActionCamera.cpp CCActionCamera.patch
	patch ./extensions/GUI/CCControlExtension/CCControlUtils.cpp CCControlUtils.patch
	rm CCActionCamera.patch
	rm CCControlUtils.patch
	python2 "download-deps.py" -r yes
}

package() {
	install -d   "$pkgdir/opt/$_appname"
	install -Dm644 "README" "$pkgdir/opt/$_appname/README"
	install -Dm755 "$_appname.sh" "$pkgdir/etc/profile.d/$_appname.sh"
	install -Dm755 "$_appname.csh" "$pkgdir/etc/profile.d/$_appname.csh"
	rm "README" "$_appname.sh" "$_appname.csh" "${_appname}-${pkgver}.zip"
	mkdir -p "$pkgdir/usr/lib"
	if [[ $CARCH == "x86_64" ]]; then
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/64-bit/libfmod.so "$pkgdir/usr/lib/libfmod.so.6"
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/64-bit/libfmodL.so "$pkgdir/usr/lib/libfmodL.so.6"
	else
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/32-bit/libfmod.so "$pkgdir/usr/lib/libfmod.so.6"
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/32-bit/libfmodL.so "$pkgdir/usr/lib/libfmodL.so.6"
	fi
	mv "$srcdir/"*  "$pkgdir/opt/$_appname" 	
}
