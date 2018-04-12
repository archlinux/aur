# Maintainer: Benjamin Hodgetts <ben@xnode.org>

pkgname=dosbox-ex-svn
pkgver=0.74.r4093
pkgrel=1
pkgdesc="DOSBox in both 32 and 64bit (with No-splash, 3DFX Glide, Fluidsynth, OpenGL shaders, ImgMake and MUNT-32 patches)."
arch=(x86_64)
url=http://dosbox.sourceforge.net/
license=('CUSTOM' 'GPL2')
depends=(alsa-lib libgl libpng mesa sdl_net sdl_sound munt lib32-munt lib32-fluidsynth fluidsynth)
makedepends=(subversion)
provides=(dosbox)
conflicts=(dosbox dosbox-git dosbox-svn)
#source=(dosbox-svn::svn+https://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk 'gl.h' 'glide.patch' 'shaders.patch' 'munt.patch' 'synth.patch' 'quiet.patch' 'imgmake.patch' 'joystick.patch' 'opl.patch' 'voodoo.patch')
#sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
source=(dosbox-svn::svn+https://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk 'patches.tgz')
md5sums=('SKIP' '6d48245333c50320ce845ec8ffb952e2')

pkgver(){
	echo $(cat dosbox-svn/VERSION).r$(svnversion "${SRCDEST}"/dosbox-svn/)
}

prepare() {
	## Unpack the patches (because they don't fit on AUR otherwise)
	tar axvf patches.tgz

	cd dosbox-svn

	## New Voodoo / GLide Support
	patch -Nlp0 -i ../voodoo.patch

	## Apply 3DFX/Glide patch
	#patch -Nlp0 -i ../glide.patch
	## Copy OpenGL headers (needed for Glide to build)
	#mkdir -p include/GL
	#cp -f ../gl.h include/GL/

	## Apply Shaders Patch
	patch -Nlp0 -i ../shaders.patch

	## Apply MUNT-32 integration Patch
	patch -Nlp1 -i ../munt.patch

	## Apply FluidSynth integration Patch (must be after MT-32)
	patch -Nlp1 -i ../synth.patch

	## Quiet DOSBox Startup Patch
	patch -Nlp1 -i ../quiet.patch

	## Add Modern Gamepad Patch
	patch -Nlp1 -i ../joystick.patch

	## Add Nuked OPL Support
	patch -Nlp0 -i ../opl.patch

	## Add imgmake functionality
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
