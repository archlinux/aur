# Mantainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.10
pkgrel=3
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
)
sha1sums=('c8bb2a1d355d3c6a342fb0f95b0e47f0113eada7'
'1f9b4f74223b5ac1ec235c553e9eca2a2c927eca'
'353bdefe07bdb6eb7f53aff20d20e83b488c1c05'
'49b7919fc38803c1dd2f5b1d47fb0c75fde1fec6'
)

prepare() {
	chmod +x "download-deps.py"

	# isnan patch
	sed -e 's/isnan/std::isnan/g' -i  \
		./cocos/2d/CCActionCamera.cpp \
		./extensions/GUI/CCControlExtension/CCControlUtils.cpp \
		./cocos/scripting/js-bindings/auto/jsb_cocos2dx_3d_auto.cpp \
		./cocos/scripting/js-bindings/auto/jsb_cocos2dx_3d_extension_auto.cpp \
		./cocos/scripting/js-bindings/auto/jsb_cocos2dx_auto.cpp \
		./cocos/scripting/js-bindings/auto/jsb_cocos2dx_builder_auto.cpp \
		./cocos/scripting/js-bindings/auto/jsb_cocos2dx_extension_auto.cpp \
		./cocos/scripting/js-bindings/auto/jsb_cocos2dx_spine_auto.cpp \
		./cocos/scripting/js-bindings/auto/jsb_cocos2dx_studio_auto.cpp \
		./cocos/scripting/js-bindings/auto/jsb_cocos2dx_ui_auto.cpp \
		./cocos/scripting/js-bindings/auto/jsb_cocos2dx_navmesh_auto.cpp \
		./cocos/scripting/js-bindings/auto/jsb_cocos2dx_physics3d_auto.cpp \
		./cocos/scripting/js-bindings/manual/cocos2d_specifics.cpp \
		./cocos/scripting/js-bindings/manual/js_manual_conversions.cpp \
		./cocos/scripting/js-bindings/manual/physics3d/jsb_cocos2dx_physics3d_manual.cpp \
		./cocos/scripting/js-bindings/manual/cocostudio/jsb_cocos2dx_studio_conversions.cpp \
		./tests/js-tests/project/Classes/js_Effect3D_bindings.cpp

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
