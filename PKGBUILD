# Mantainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Submitter: Samuel FORGIONE <samuel.forgione@gmail.com>

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.12
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
'558f7dc86453f1f1ff6fd89ae01fd3f0ded8b327'
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

	# Set sdkbox python interpreter to python2
	sed -e 's/python/python2/g' -i "$srcdir"/$_appname-$pkgver/tools/cocos2d-console/plugins/plugin_package/sdkbox

	# Package source
	mv "$srcdir"/$_appname-$pkgver/* "$pkgdir/opt/$_appname" 	

}
