# Maintainer: Technochips <thetechnochips at protonmail dot com>

pkgname=madness-interactive-reloaded
pkgver=0.49.4_beta
pkgrel=1
pkgdesc='Moddable action video game based on Madness Combat'
arch=('x86_64')
url='https://studiominus.nl/madness-interactive-reloaded.html'
license=('GPL-3.0-only', 'MIT')
depends=('dotnet-runtime-8.0' 'ffmpeg5.1' 'skia-sharp' 'openal' 'xdg-utils')
makedepends=('dotnet-sdk-8.0' 'git')

repover=v${pkgver//_/-}
source=("git+https://github.com/studio-minus/${pkgname}.git#tag=${repover}"
	'git+https://github.com/mestiez/BigGustave.git#commit=49327bfce72485c6e006066b1438adc7a2af5b71'
	'git+https://github.com/mestiez/Walgelijk.git#commit=d44f0292d258d0599689b87e6616e54798d8c9fd')

sha256sums=('4d4554c77cd280fb0d97933a722f26b4e4eed85c76b56f3014e1757eacd5f1b8'
            '9749d429a80e2b960e5ffa50f73c20cca2e45ec5613a38e6fa2752a3f6653397'
	    '724de654123d6d6106279500206c6ecf574981fbf5d9ded925dfc3448a192eb6')

prepare() {
	cd "$srcdir/$pkgname"

	echo "Adding submodules..."
	git submodule init
	git config submodule.src/BigGustave.url "$srcdir/BigGustave"
	git -c protocol.file.allow=always submodule update

	ln -sf "$srcdir/Walgelijk/Walgelijk" src/.

	# apply patches
	
	# backport multiple linux-related crash fixes. see:
	# https://github.com/studio-minus/madness-interactive-reloaded/pull/342
	# https://github.com/studio-minus/madness-interactive-reloaded/pull/361
	# https://github.com/studio-minus/madness-interactive-reloaded/issues/358
	echo "Applying backport patches..."
	git config advice.mergeConflict false # don't display warning, everything's fine.
	git cherry-pick -n 896ae8c37aa7de99c09a127a75d62b0b3e4e2cdd
	git cherry-pick -n 7cf59fb2e9d49fc904be6b1774c750d3356a45ba
	git cherry-pick -n 3447b7dbf06e77c20f62b20bb4e8c8bf7734c32c
	git cherry-pick -n da6b758e4a15cb70b3f1982e4c9f6aa8bf35f498
	git cherry-pick -n 7df8a849e7a608552641245d3a2a4dcc28dac7b7 || {
		git checkout --ours src/MadnessInteractiveReloaded/MIR.csproj
		git add src/MadnessInteractiveReloaded/MIR.csproj
	}
	git cherry-pick -n 9004d8f8b8403fdab6f1d64318d23ac9f1454de4
	git cherry-pick -n c0a4703bd618334bdaf0a4ceb63a4b10f7fd5442
	git cherry-pick -n 21ca77ecc8886b8290916930e0a74e98d40044bc

	# the project copies over ffmpeg dll files by default. we don't need those.
	patch -Np1 -i "$startdir/do-not-copy-windows-blobs.patch"

	# we want to use the local walgelijk repo, which has additional linux crashes fixed. see:
	# https://github.com/mestiez/Walgelijk/pull/23
	patch -Np1 -i "$startdir/use-local-dependencies.patch"
}
build() {
	cd "$srcdir/$pkgname/src/MadnessInteractiveReloaded"
	dotnet build -c Release --os linux -a x64

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
}
package() {
	install -m 755 -d "$pkgdir/usr/share"
	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 -d "$pkgdir/usr/share/applications"
	install -m 755 -d "$pkgdir/usr/share/pixmaps"

	cp -r "$srcdir/$pkgname/src/MadnessInteractiveReloaded/bin/Release/net8.0/linux-x64" "$pkgdir/usr/share/MIR"
	install -m 755 -t "$pkgdir/usr/bin" "$startdir/MIR"
	install -m 644 -t "$pkgdir/usr/share/applications" "$startdir/MIR.desktop"
	ln -s "/usr/share/MIR/resources/textures/icon.png" "$pkgdir/usr/share/pixmaps/MIR.png"
}
