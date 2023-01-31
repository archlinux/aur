pkgname=mcpelinux
pkgver=1.34
pkgrel=15
pkgdesc='A custom packaging of mcpelauncher and msa. Put the extracted x86_64 or x86 APK in /var/lib/mcpelinux or pull APK/Split APKS from waydroid by running command mcpullwd.'
url='https://github.com/minecraft-linux'
arch=(x86_64)
license=('GPL3')
depends=('pulseaudio' 'libpulse')
makedepends=('git' 'libzip' 'clang' 'cmake' 'qt5-base' 'qt5-webengine' 'qt5-quickcontrols' 'qt5-tools')
optdepends=('gamemode: For GameMode tweaks' 'qt5-base: For Microsoft Account Support' 'qt5-webengine: For Microsoft Account Support' 'qt5-quickcontrols: For Microsoft Account Support')
source=("git+${url}/mcpelauncher-manifest#tag=v0.8.0" "git+https://github.com/minecraft-linux/msa-manifest#tag=v0.6.0" "git+${url}/android_bionic#commit=45ab709bbd4ddf50b2c8fd05a6cbd048ed776f46" "git+https://android.googlesource.com/platform/system/core" "git+${url}/logger.git" "git+${url}/base64.git" "git+${url}/file-util.git" "git+${url}/arg-parser.git" "git+${url}/rapidxml.git" "git+${url%minecraft-linux}MCMrARM/simple-ipc.git" "git+${url}/msa.git" "git+${url}/msa-daemon.git" "git+${url}/msa-daemon-client.git" "git+${url}/msa-ui-gtk.git" "git+${url}/msa-ui-qt.git" "git+${url}/properties-parser.git" "git+${url}/daemon-utils.git" "git+${url}/eglut.git" "git+${url%minecraft-linux}MCMrARM/linux-gamepad.git" "git+${url}/game-window.git" "git+${url}/file-picker.git" "git+${url}/cll-telemetry.git" "git+${url}/minecraft-imported-symbols.git" "git+${url}/mcpelauncher-common.git" "git+${url}/mcpelauncher-core.git" "git+${url}/mcpelauncher-client.git" "git+${url}/mcpelauncher-linux-bin.git" "git+${url}/epoll-shim.git" "git+${url}/osx-elf-header.git" "git+${url}/mcpelauncher-mac-bin.git" "git+${url}/android-support-headers.git" "git+${url}/libc-shim.git" "git+${url}/mcpelauncher-linker.git" "git+${url%minecraft-linux}freundTech/mcpelauncher-webview.git" "git+${url%minecraft-linux}ChristopherHX/libjnivm.git" "git+${url}/mcpelauncher-errorwindow.git" "https://pastebin.com/raw/U8aNBkuD" "https://vignette.wikia.nocookie.net/minecraft/images/3/3b/MinecraftApp.png" "https://pastebin.com/raw/J6wPyTnx" "https://pastebin.com/raw/Ljy6zZmM" "https://pastebin.com/raw/0S23ggea")
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
__msa_submod=('logger' 'base64' 'file-util' 'arg-parser' 'rapidxml' 'simple-ipc' 'daemon-utils' 'msa' 'msa-daemon' 'msa-daemon-client' 'msa-ui-gtk' 'msa-ui-qt')
__mcpelauncher_submod=('logger' 'base64' 'file-util' 'properties-parser' 'simple-ipc' 'daemon-utils' 'msa-daemon-client' 'eglut' 'linux-gamepad' 'game-window' 'file-picker' 'cll-telemetry' 'minecraft-imported-symbols' 'mcpelauncher-common' 'mcpelauncher-core' 'mcpelauncher-client' 'arg-parser' 'mcpelauncher-linux-bin' 'epoll-shim' 'osx-elf-header' 'mcpelauncher-mac-bin' 'android-support-headers' 'libc-shim' 'mcpelauncher-linker' 'mcpelauncher-webview' 'libjnivm' 'mcpelauncher-errorwindow')
prepare(){
	cd msa-manifest
	git submodule init
	for submod in "${__msa_submod[@]}" ; do
	git config submodule.${submod}.url "$srcdir/${submod}"
	done
	git -c protocol.file.allow=always submodule update
	cd ../mcpelauncher-manifest
	git submodule init
	for submod in "${__mcpelauncher_submod[@]}" ; do
	git config submodule.${submod}.url "$srcdir/${submod}"
	done
	git -c protocol.file.allow=always submodule update
	cd mcpelauncher-linker
	git submodule init
	git config submodule.bionic.url "$srcdir/android_bionic"
	git config submodule.core.url "$srcdir/core"
	git -c protocol.file.allow=always submodule update
}
build(){
	mkdir $srcdir/mcpelauncher-manifest/build ; cd $srcdir/mcpelauncher-manifest/build
	CC=clang CXX=clang++ cmake .. -Wno-dev -DCMAKE_BUILD_TYPE=Release -DJNI_USE_JNIVM=ON
	make -j$(getconf _NPROCESSORS_ONLN)
	mkdir $srcdir/msa-manifest/build ; cd $srcdir/msa-manifest/build
	cmake -DENABLE_MSA_QT_UI=ON .. -Wno-dev
	make -j$(getconf _NPROCESSORS_ONLN)
}
package(){
	cd $srcdir/mcpelauncher-manifest/build
	make DESTDIR=$pkgdir install
	rm  -r $pkgdir/usr/local/share/mcpelauncher/lib/armeabi-v7a
	cd $srcdir/msa-manifest/build
	make DESTDIR=$pkgdir install
	mv $pkgdir/usr/local/{share,bin} $pkgdir/usr/
	rm -r $pkgdir/usr/local
	install -Dm 755 $srcdir/../J6wPyTnx $pkgdir/usr/bin/mcclean
	install -Dm 755 $srcdir/../Ljy6zZmM $pkgdir/usr/bin/mcrun
	install -Dm 755 $srcdir/../U8aNBkuD $pkgdir/usr/share/applications/mcpelauncher-client.desktop
	install -Dm 755 $srcdir/../MinecraftApp.png $pkgdir/usr/share/icons/hicolor/scalable/apps/minecraftpe.png
	install -Dm 755 $srcdir/../0S23ggea $pkgdir/usr/bin/mcpullwd
	sed -i -e 's/\r$//' $pkgdir/usr/bin/{mcclean,mcrun,mcpullwd}
	mkdir -p $pkgdir/var/lib/mcpelinux
	chmod 777 $pkgdir/var/lib/mcpelinux
}
