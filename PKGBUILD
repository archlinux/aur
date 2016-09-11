# Mantainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Submitter: Samuel FORGIONE <samuel.forgione@gmail.com>

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.13
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
"RuntimeCCSImpl.patch"
"SocketIO.patch"
"CCTMXLayer.patch"
)
sha1sums=(
'30ab3a821467578df4e1ee9d9b2bbb39ae0605e4'
'2cff669a51b66d513824be811688aa9da553e400'
'353bdefe07bdb6eb7f53aff20d20e83b488c1c05'
'49b7919fc38803c1dd2f5b1d47fb0c75fde1fec6'
'716869895fc2b071c66a58f727c643f48e927569'
'b042a9fa4c7ea6d472985b1b61d0a57ebf56708a'
'c6cf99ba9fcd7fa4f80c1f3014c6c0b5fd34120a'
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

	# Patch memory leaks:
	patch "$srcdir"/$_appname-$pkgver/tools/simulator/libsimulator/lib/runtime/RuntimeCCSImpl.cpp RuntimeCCSImpl.patch
	patch "$srcdir"/$_appname-$pkgver/cocos/network/SocketIO.cpp SocketIO.patch
	patch "$srcdir"/$_appname-$pkgver/cocos/2d/CCTMXLayer.cpp CCTMXLayer.patch

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
