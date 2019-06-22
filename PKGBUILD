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
pkgver=3.17.2
pkgrel=1
pkgdesc="Cocos2D-X is a game engine that supports multiple platforms such as iOS, Android, WinXP/7/8, WP8, BlackBerry, MeeGo, Marmelade, WebOS, Mac OS X"
arch=('i686' 'x86_64')
url="https://cocos2d-x.org/"
license=('MIT License')
depends=('glew' 'glfw' 'glibc' 'fontconfig' 'libgl' 'curl' 'libx11' 'zlib' 'libpng' 'freetype2' 'python2')
source=("git+https://github.com/cocos2d/${_appname}#tag=${_appname}-${pkgver}"
        "https://github.com/cocos2d/cocos2d-x-3rd-party-libs-bin/archive/metal-support-2.tar.gz"
        "${_appname}.sh"
        "${_appname}.csh")
sha256sums=('SKIP'
            'dde210e8e86e326be12b64a00be1a2ed7885c1129cd8000a12730880f8d95b05'
            'f2f74a36538c43045894bd2b2415a2396bcb5c28f9241296b0e6d39a452b56b1'
            '3a7ae492fe9b2d7db8ef15c2d47e147746823942943e099d5a494c7076b2e92b')


prepare() {
    # Download submodules
    cd ${_appname}
    git submodule init tools
    git submodule init web
    git submodule update tools web
    git submodule update web
    
    # Move third-party precompiled binaries
    mv $srcdir/${_appname}-3rd-party-libs-bin-metal-support-2/* external
    
    # Remove junk files
    rm -r licenses
    rm -r tests
    rm -r docs
    rm -r external/android-specific
    rm -r external/curl
    rm -r external/fbx-conv
    rm -r external/glsl-optimizer
    rm -r external/png
    rm -r external/lua/lua/prebuilt
    rm external/lua/lua/Android.mk
    rm -r external/lua/luajit/prebuilt/android
    rm -r external/lua/luajit/prebuilt/ios
    rm -r external/lua/luajit/prebuilt/mac
    rm -r external/lua/luajit/prebuilt/win32
    rm -r external/recast/proj.win10
    rm -r external/recast/proj.win32
    rm external/recast/Android.mk
    rm -r external/sqlite3
    rm -r external/win10-specific
    rm -r external/win32-specific
    rm -r external/zlib
    rm -r external/*/*/android
    rm -r external/*/*/ios
    rm -r external/*/*/mac
    rm -r external/*/*/tizen
    rm -r external/*/*/tvos
    rm -r external/*/*/win10
    rm -r external/*/*/win32
    find -name "*README*" -exec rm {} +
    find -name "*AUTHORS*" -exec rm {} +
    find -name "*CHANGELOG*" -exec rm {} +
    rm .travis.yml
    rm .appveyor.yml
    rm CONTRIBUTING.md
    rm download-deps.py
    rm issue_template.md
    rm setup.py
    rm tools/missing-tools.txt
    
    # Update the file timestamps -- otherwise the build system will keep recompiling everything always:
    find -exec touch {} +

    # Fix permissions:
    chmod 755 tools/cocos2d-console/bin/cocos
    chmod 755 tools/cocos2d-console/plugins/plugin_package/sdkbox
    
    # Set sdkbox python interpreter to python2
    sed -e 's/python/python2/g' -i tools/cocos2d-console/plugins/plugin_package/sdkbox
    
    # Disable sending usage data
    sed -e 's/enable_stat=.*/enable_stat=false/g' -i tools/cocos2d-console/bin/cocos2d.ini
}


package() {
    # Install preliminary files
    install -d "$pkgdir/opt/${_appname}"
    install -Dm755 "${_appname}.sh" "$pkgdir/etc/profile.d/${_appname}.sh"
    install -Dm755 "${_appname}.csh" "$pkgdir/etc/profile.d/${_appname}.csh"

    # Copy package source
    mv "$srcdir"/${_appname}/* "$pkgdir/opt/${_appname}"
}
