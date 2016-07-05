# Mantainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Submitter: Samuel FORGIONE <samuel.forgione@gmail.com>
# Contributor: DasFranck

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.11.1
pkgrel=1
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
sha1sums=(
'6af829e1b77c1d57f2d8bb74ceb68234b9ede8bd'
'2cff669a51b66d513824be811688aa9da553e400'
'353bdefe07bdb6eb7f53aff20d20e83b488c1c05'
'49b7919fc38803c1dd2f5b1d47fb0c75fde1fec6'
)

prepare() {
	cd "$srcdir"/$_appname-$pkgver
	chmod +x "download-deps.py"
	python2 "download-deps.py" -r yes
}

package() {
	install -d "$pkgdir/opt/$_appname"
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

	# Package source
	mv "$srcdir"/$_appname-$pkgver/* "$pkgdir/opt/$_appname" 	
}
