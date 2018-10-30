# Maintainer: Benjamin Hodgetts <ben@xnode.org>

pkgname=dosbox-ex-svn
pkgver=0.74.r4146
pkgrel=1
pkgdesc="DOSBox in both 32 and 64bit (with No-splash, 3DFX Glide, Fluidsynth, OpenGL shaders, ImgMake and MUNT-32 patches)."
arch=(x86_64)
url=http://dosbox.sourceforge.net/
license=('CUSTOM' 'GPL2')
depends=(alsa-lib libgl libpng mesa sdl_net sdl_sound munt lib32-fluidsynth fluidsynth)
optdepends=(lib32-munt)
makedepends=(subversion)
provides=(dosbox)
conflicts=(dosbox dosbox-git dosbox-svn)
## Lock to revision 4146 as 4147 alters SDL and breaks patches
source=(dosbox-svn::svn+https://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk#revision=4146 'patches.tgz')
md5sums=('SKIP' 'SKIP')

pkgver(){
	echo $(sed 's/-/./' dosbox-svn/VERSION).r$(svnversion "${SRCDEST}"/dosbox-svn/)
}

prepare() {
	## Unpack the patches (because they don't fit on AUR otherwise)
	tar axvf patches.tgz

	cd dosbox-svn

	## New Voodoo / GLide Support
	echo "Voodoo Patch"
	patch -Nlp0 -i ../voodoo.patch

	## Apply 3DFX/Glide patch
	#patch -Nlp0 -i ../glide.patch
	## Copy OpenGL headers (needed for Glide to build)
	#mkdir -p include/GL
	#cp -f ../gl.h include/GL/

	## Apply Shaders Patch
	echo "Shader Patch"
	patch -Nlp0 -i ../shaders.patch

	## Apply MUNT-32 integration Patch
	echo "MUNT Patch"
	patch -Nlp1 -i ../munt.patch

	## Apply FluidSynth integration Patch (must be after MT-32)
	echo "Synth Patch"
	patch -Nlp1 -i ../synth.patch

	## Quiet DOSBox Startup Patch
	echo "Quiet Patch"
	patch -Nlp1 -i ../quiet.patch

	## Add Modern Gamepad Patch
	echo "Joystick Patch"
	patch -Nlp1 -i ../joystick.patch

	## Add Nuked OPL Support (disable for now, doesn't apply)
	#echo "OPL Patch"
	#patch -Nlp0 -i ../opl.patch

	## Add imgmake functionality
	echo "IMGMake Patch"
	patch -Nlp0 -i ../imgmake.patch
}

build() {
	cd dosbox-svn

	## Build 64bit DOSBox
	sh autogen.sh
	./configure --prefix=/usr
	make
	mv src/dosbox src/dosbox64

	## Build 32bit DOSBox
	export CFLAGS="${CFLAGS} -m32"
	export CXXFLAGS="${CFLAGS} -m32"
	sh autogen.sh
	./configure --prefix=/usr LDFLAGS="-L/usr/lib32" --build=i686-pc-linux-gnu
	make
	mv src/dosbox src/dosbox32
}

package() {
	cd dosbox-svn
	install -Dm755 src/dosbox64 ${pkgdir}/usr/bin/dosbox
	install -Dm755 src/dosbox32 ${pkgdir}/usr/bin/dosbox32
}
