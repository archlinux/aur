# Mantainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: DasFranck

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.11
pkgrel=2
pkgdesc="Cocos2D-X is a game engine that supports multiple platforms such as iOS, Android, WinXP/7/8, WP8, BlackBerry, MeeGo, Marmelade, WebOS, Mac OS X"
arch=('i686' 'x86_64')
url="http://cdn.cocos2d-x.org/"
license=('MIT License')
depends=('glew' 'glfw' 'glibc' 'fontconfig' 'libgl' 'curl' 'libx11' 'zlib' 'libpng' 'freetype2' 'python2')
#depends=('openssl' 'sqlite3')
options=('!buildflags' '!strip' 'staticlibs')
source=("${url}${_appname}-${pkgver}.zip"
"README"
"$_appname.sh"
"$_appname.csh"
)
sha1sums=('b57ecf01747097ec9682bcc4ed37b22559ce78de'
'1f9b4f74223b5ac1ec235c553e9eca2a2c927eca'
'353bdefe07bdb6eb7f53aff20d20e83b488c1c05'
'49b7919fc38803c1dd2f5b1d47fb0c75fde1fec6'
)

prepare() {
	cd "$srcdir"/$_appname-$pkgver
	chmod +x "download-deps.py"
	python2 "download-deps.py" -r yes
}

package() {
	install -d   "$pkgdir/opt/$_appname"
	install -Dm644 "README" "$pkgdir/opt/$_appname/README"
	install -Dm755 "$_appname.sh" "$pkgdir/etc/profile.d/$_appname.sh"
	install -Dm755 "$_appname.csh" "$pkgdir/etc/profile.d/$_appname.csh"

	# Remove unnecessary files:
	rm "README" "$_appname.sh" "$_appname.csh" "${_appname}-${pkgver}.zip"

	# Necessary libfmod symbolic link
	mkdir -p "$pkgdir/usr/lib"
	if [[ $CARCH == "x86_64" ]]; then
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/64-bit/libfmod.so "$pkgdir/usr/lib/libfmod.so.6"
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/64-bit/libfmodL.so "$pkgdir/usr/lib/libfmodL.so.6"
	else
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/32-bit/libfmod.so "$pkgdir/usr/lib/libfmod.so.6"
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/32-bit/libfmodL.so "$pkgdir/usr/lib/libfmodL.so.6"
	fi

	# Inconsistent executable test name patch
	sed -i 's/cpp_tests/cpp-tests/g' "$srcdir/$_appname-$pkgver/tests/cpp-tests/CMakeLists.txt"
	sed -i 's/js_tests/js-tests/g' "$srcdir/$_appname-$pkgver/tests/js-tests/project/CMakeLists.txt"
	sed -i 's/lua_tests/lua-tests/g' "$srcdir/$_appname-$pkgver/tests/lua-tests/project/CMakeLists.txt"

	# Replace hardcoded python paths to python2
	find "$srcdir"/$_appname-$pkgver/ -type f -exec sed -i "s|/usr/bin/python$|/usr/bin/python2|g" {} \;
	sed -e 's/python/python2/g' -i "$srcdir"/$_appname-$pkgver/tools/cocos2d-console/plugins/plugin_package/sdkbox "$srcdir"/$_appname-$pkgver/tools/cocos2d-console/bin/cocos

	# Packaging source
	mv "$srcdir"/$_appname-$pkgver/* "$pkgdir/opt/$_appname" 	
}
