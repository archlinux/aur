# Maintainer: Xavier Cho <mysticfallband@gmail.com>

pkgname=upbge-git
pkgver=106084.bb8d73864d7
pkgrel=1
pkgdesc="Uchronia Project Blender Game Engine fork of Blender Game Engine"
arch=('i686' 'x86_64')
url="https://upbge.org/"
depends=('alembic' 'libgl' 'python' 'desktop-file-utils' 'hicolor-icon-theme' 'openjpeg'
		 'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
		 'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng' 'python-numpy')
optdepends=('cuda: CUDA support in Cycles'
			'optix: OptiX support in Cycles'
			'openimagedenoise: Intel Open Image Denoise support in compositing')
makedepends=('git' 'cmake' 'boost' 'mesa' 'llvm')
provides=('blender')
conflicts=('blender')
license=('GPL')
install=upbge.install
# NOTE: the source array has to be kept in sync with .gitmodules
# the submodules has to be stored in path ending with git to match
# the path in .gitmodules.
# More info:
#   http://wiki.blender.org/index.php/Dev:Doc/Tools/Git
source=('git://github.com/UPBGE/upbge.git' \
	'blender-addons.git::git://github.com/UPBGE/blender-addons.git' \
	'blender-addons-contrib.git::git://git.blender.org/blender-addons-contrib.git' \
	'blender-translations.git::git://git.blender.org/blender-translations.git' \
	'blender-dev-tools.git::git://git.blender.org/blender-dev-tools.git' \
	embree.patch \
	upbge.desktop)
md5sums=(
	'SKIP' 
	'SKIP' 
	'SKIP' 
	'SKIP' 
	'SKIP' 
	'1cd3132ec4e15df823d336529f5d1d6f'
	'37ce92c740691f858156511e22b40143')

# determine whether we can precompile CUDA kernels
_CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
if [ "$_CUDA_PKG" != "" ]; then
	_EXTRAOPTS="-DWITH_CYCLES_CUDA_BINARIES=ON \
		-DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda"
fi

# check for optix
_OPTIX_PKG=`pacman -Qq optix 2>/dev/null` || true
if [ "$_OPTIX_PKG" != "" ]; then
	_EXTRAOPTS="$_EXTRAOPTS \
	-DWITH_CYCLES_DEVICE_OPTIX=ON \
	-DOPTIX_ROOT_DIR=/opt/optix"
fi

# check for open image denoise
_OIDN_PKG=`pacman -Qq openimagedenoise 2>/dev/null` || true
if [ "$_OIDN_PKG" != "" ]; then
	_EXTRAOPTS="$_EXTRAOPTS \
	-DWITH_OPENIMAGEDENOISE=ON"
fi

# check for embree
_EMBREE_PKG=`pacman -Qq embree 2>/dev/null` || true
if [ "$_EMBREE_PKG" != "" ]; then
	_EXTRAOPTS="$_EXTRAOPTS \
	-DWITH_CYCLES_EMBREE=ON"
fi

pkgver() {
	cd "$srcdir/upbge"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/upbge"

	#update the submodules
	git submodule sync
	git submodule update --init --recursive --remote --depth=1
	git submodule foreach git checkout master
	git submodule foreach git pull --rebase --depth=1

	if [ "$_EMBREE_PKG" != "" ]; then
		git apply -v "${srcdir}"/embree.patch
	fi
}

build() {
	mkdir -p "$srcdir/blender-build"
	 _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
	  echo "python version detected: ${_pyver}"

	cd "$srcdir/blender-build"

	cmake "$srcdir/upbge" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWITH_INSTALL_PORTABLE=OFF \
		-DWITH_GAMEENGINE=ON \
		-DWITH_PLAYER=ON \
		-DWITH_OPENCOLORIO=ON \
		-DWITH_FFTW3=ON \
		-DWITH_SYSTEM_GLEW=ON \
		-DWITH_CODEC_FFMPEG=ON \
		-DWITH_PYTHON_INSTALL=OFF \
		-DPYTHON_VERSION="${_pyver}" \
		-DWITH_MOD_OCEANSIM=ON \
		$_EXTRAOPTS
	make
}

package() {
	cd "$srcdir/blender-build"

	make DESTDIR="$pkgdir" install

	mv "$pkgdir/usr/share/blender" "$pkgdir/usr/share/upbge"

	install -D -m755 "$srcdir"/blender-build/bin/blenderplayer \
		"$pkgdir"/usr/bin/blenderplayer
	install -D -m644 "$srcdir"/upbge.desktop \
		"$pkgdir"/usr/share/applications/upbge.desktop
	install -D -m644 "$srcdir"/upbge/release/freedesktop/icons/scalable/apps/upbge.svg \
		"$pkgdir"/usr/share/icons/hicolor/scalable/apps/upbge,svg

	if [ -e "$pkgdir"/usr/share/upbge/*/scripts/addons/cycles/lib/ ] ; then
		# make sure the cuda kernels are not stripped
		chmod 444 "$pkgdir"/usr/share/upbge/*/scripts/addons/cycles/lib/*
	fi
}
