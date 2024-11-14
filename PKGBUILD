# Maintainer: Technochips <thetechnochips at protonmail dot com>

pkgname=madness-interactive-reloaded
pkgver=0.50.0_beta
pkgrel=2
pkgdesc='Moddable action video game based on Madness Combat'
arch=('x86_64')
url='https://studiominus.nl/madness-interactive-reloaded.html'
license=('GPL-3.0-only' 'MIT' 'Apache-2.0')
depends=('dotnet-runtime-8.0' 'ffmpeg5.1' 'skia-sharp' 'openal' 'xdg-utils' 'xdg-desktop-portal' 'bash')
makedepends=('dotnet-sdk-8.0' 'git' 'cmake')

repover=v${pkgver//_/-}
nfdver=1.2.1

source=('MIR'
	'MIR.desktop'
	'do-not-copy-windows-blobs.patch'
	"git+https://github.com/studio-minus/${pkgname}.git#tag=${repover}"
	'git+https://github.com/mestiez/BigGustave.git#commit=49327bfce72485c6e006066b1438adc7a2af5b71'
	"https://github.com/btzy/nativefiledialog-extended/archive/refs/tags/v${nfdver}.tar.gz")

sha256sums=('3228bd564d9ab3044dfcb3a60f94ba29c320580afd8a4809be9f82e1cca599f8'
            'b44d8dc9eaa7643276b224d000fdbef15f149adff4e2dfc2d6bb4185226bc7a9'
            '4254ae3c14d2cd6d73fcb29a898dc09da6f67ca2074f3b233f6b69a87e054b72'
            'aafc05cbf4bbb4ff16ca58f515a6363dbed060124d0ecf3b863a8077dee0fb6c'
            '9749d429a80e2b960e5ffa50f73c20cca2e45ec5613a38e6fa2752a3f6653397'
            '443697a857c4efacbe08cdaf5182724fa9d9b9a79b8feff2a1601bde1df46b07')

prepare() {
	cd "$srcdir/$pkgname"

	echo "Adding submodules..."
	git submodule init
	git config submodule.src/BigGustave.url "$srcdir/BigGustave"
	git -c protocol.file.allow=always submodule update

	echo "Applying backport patches..."

	# fix incident mode, this commit was quietly added to the windows build.
	git cherry-pick -n b03426047fc4a6f25bbea6c8c3573b4ad637df06 -m 1
	# fix linux-related crash, see: https://github.com/studio-minus/madness-interactive-reloaded/pull/365
	git cherry-pick -n c73abd0ffdf88ab8ee23246838d84f3607898e9b -m 1
	# the project copies over ffmpeg dll files by default. we don't need those.
	patch -Np1 -i "$srcdir/do-not-copy-windows-blobs.patch"
}
build() {
	# compile dependencies

	cd "$srcdir/nativefiledialog-extended-${nfdver}"
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DNFD_BUILD_TESTS=OFF -DNFD_INSTALL=OFF -DBUILD_SHARED_LIBS=ON -DNFD_PORTAL=ON ..
	cmake --build .

	# compile the game itself

	cd "$srcdir/$pkgname/src/MadnessInteractiveReloaded"
	dotnet build -c Release --no-self-contained --runtime linux-x64

	cd bin/Release/net8.0/linux-x64

	# symlink ffmpeg5.1 libraries
	ln -sf /usr/lib/libavcodec.so.59 .
	ln -sf /usr/lib/libavdevice.so.59 .
	ln -sf /usr/lib/libavfilter.so.8 .
	ln -sf /usr/lib/libavformat.so.59 .
	ln -sf /usr/lib/libavutil.so.57 .
	ln -sf /usr/lib/libpostproc.so.56 .
	ln -sf /usr/lib/libswresample.so.4 .
	ln -sf /usr/lib/libswscale.so.6 .

	# copy dependencies we built
	cp "$srcdir/nativefiledialog-extended-${nfdver}/build/src/libnfd.so" .
}
package() {
	# create empty directories
	install -m 755 -d "$pkgdir/usr/share"
	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 -d "$pkgdir/usr/share/applications"
	install -m 755 -d "$pkgdir/usr/share/pixmaps"

	# copy entire folder
	cp -r "$srcdir/$pkgname/src/MadnessInteractiveReloaded/bin/Release/net8.0/linux-x64" "$pkgdir/usr/share/MIR"

	# copy miscellaneous desktop files
	install -m 755 -t "$pkgdir/usr/bin" "$srcdir/MIR"
	install -m 644 -t "$pkgdir/usr/share/applications" "$srcdir/MIR.desktop"
	ln -s "/usr/share/MIR/resources/textures/icon.png" "$pkgdir/usr/share/pixmaps/MIR.png"
}
