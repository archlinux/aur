# Mantainer: Gennadiy Chernyshyk <genaloner@gmail.com>
# Previous Mantainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Previous Maintainer: Samuel FORGIONE <samuel.forgione@gmail.com>

# After installation, you need to reload the environment variables from /etc/profile. You can do it manually:
# `source /etc/profile`
# or just reload session.
#
# In order to use android, you should define in your bashrc, zshrc, whateverrc :
# export NDK_ROOT=/opt/android-ndk
# export ANDROID_SDK_ROOT=/opt/android-sdk
# export ANT_ROOT=/usr/bin
# (Each path came with package aur/android-ndk aur/android-sdk and extra/apache-ant)
# 
# Use `cocos` wrapper to create, compile and run your project.
# `cocos` will echo you basic command
# `cocos <command>` will echo you basic parameter for <command>
# 
# Basic setup:
# `cocos new -l cpp -p com.firm.app myapp`
# `cd myapp`
# `cocos run -p android -j$(nproc)`
# `cocos run -p linux -j$(nproc)`
# Or you do it manually:
# `cocos new -l cpp -p com.firm.app myapp`
# `mkdir linux-build && cd linux-build`
# `cmake ..`
# `../bin/debug/linux/MyGame`

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.17
pkgrel=1
pkgdesc="Cocos2D-X is a game engine that supports multiple platforms such as iOS, Android, WinXP/7/8, WP8, BlackBerry, MeeGo, Marmelade, WebOS, Mac OS X"
arch=('i686' 'x86_64')
url="http://cdn.cocos2d-x.org/"
license=('MIT License')
depends=('glew' 'glfw' 'glibc' 'fontconfig' 'libgl' 'curl' 'libx11' 'zlib' 'libpng' 'freetype2' 'python2')
options=('!buildflags' '!strip' 'staticlibs')
source=("${url}${_appname}-${pkgver}.zip"
        "${_appname}.sh"
        "${_appname}.csh")
sha256sums=('3cb45f629dda174ab47d083f6818827f58bea194d65c753d60dceed2cbbcedd0'
            'f2f74a36538c43045894bd2b2415a2396bcb5c28f9241296b0e6d39a452b56b1'
            '3a7ae492fe9b2d7db8ef15c2d47e147746823942943e099d5a494c7076b2e92b')


prepare() {
	cd "$srcdir/${_appname}-$pkgver"
	
	# Remove junk files
	find -name "*README*" -exec rm {} +
	find -name "*AUTHORS*" -exec rm {} +
	rm .travis.yml
	rm .appveyor.yml
	rm CONTRIBUTING.md
	rm download-deps.py
	rm issue_template.md
	rm setup.py
	rm CHANGELOG
	rm web/.gitignore
	rm web/CHANGELOG.txt
	rm 'web/tools/readme for tools.txt'
	rm tools/missing-tools.txt
	rm -r licenses
	
    # Update the file timestamps -- otherwise the build system will keep recompiling everything always:
	find -exec touch {} +

	# Fix permissions:
	chmod 755 tools/cocos2d-console/bin/cocos
	chmod 755 tools/cocos2d-console/plugins/plugin_package/sdkbox
	
	# Set sdkbox python interpreter to python2
	sed -e 's/python/python2/g' -i tools/cocos2d-console/plugins/plugin_package/sdkbox
	
    # Disable sending usage data
	sed -e 's/enable_stat=.*/enable_stat=false/g' -i tools/cocos2d-console/bin/cocos2d.ini
	
	# Add necessary libfmod symbolic link
	cd external/linux-specific/fmod/prebuilt/64-bit
	ln -sf libfmod.so libfmod.so.6
    ln -sf libfmodL.so libfmodL.so.6
}


package() {

	# Install preliminary files
	install -d "$pkgdir/opt/${_appname}"
	install -Dm755 "${_appname}.sh" "$pkgdir/etc/profile.d/${_appname}.sh"
	install -Dm755 "${_appname}.csh" "$pkgdir/etc/profile.d/${_appname}.csh"

	# Copy package source
	mv "$srcdir"/${_appname}-$pkgver/* "$pkgdir/opt/${_appname}"
}
