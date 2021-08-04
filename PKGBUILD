pkgname='gimp-plugin-gmic-git'
_name='gmic'
pkgver=2.9.8.r13.g2885531.gimp.2.0
pkgrel=1
pkgdesc="Front-end to the image processing framework G'MICQ"
url="https://github.com/c-koi/${_name}-qt"
depends=('gimp' 'libpng' 'zlib' 'fftw' 'curl' 'qt5-base')
makedepends=('wget')
license=('GPL3')
arch=('i686' 'x86_64')
source=("git+${url}.git" "git+https://github.com/dtschump/${_name}.git")
md5sums=('SKIP' 'SKIP')

_try_gimp_version() {
	case "$1" in
		2.0)
			_host=gimp
			_plugin_dir=/usr/lib/gimp/$1/plug-ins/
			_builder=qmake
			;;
		2.99|3.0)
			_host=gimp3
			_plugin_dir=/usr/lib/gimp/$1/plug-ins/gmic_gimp_qt/
			# https://github.com/c-koi/gmic-qt/pull/104 added experimental gimp3 support, but it only covers the cmake approach, not qmake.
			_builder=cmake
			;;
		*)
			return 1
			;;
	esac
}

# _gimp_version should be "2.0", "2.99" or "3.0"; it can be specified by passing an environment variable in, or it can be discovered.
# (Ideally this might possibly be multiple distinct packages, but I’m not sure, since packages like gimp and gimp-devel conflict anyway, so at the least I don’t think they’d be produced from a common pkgbase.)
(( PRINTSRCINFO )) || msg "Choosing GIMP major version to build for..."
if [ -n "$_gimp_version" ]; then
	if _try_gimp_version "$_gimp_version"; then
		(( PRINTSRCINFO )) || msg2 "Using $_gimp_version (from _gimp_version environment variable)"
	else
		error "_gimp_version was manually set to '$_gimp_version', but I don’t know what to do with that (known values are '2.0', '2.99' and '3.0')"
		exit 1
	fi
else
	for f in /usr/share/gimp/?.*/; do
		if _try_gimp_version "${f:16:-1}"; then
			_gimp_version="${f:16:-1}"
			break
		fi
	done
	if [ -n "$_gimp_version" ]; then
		(( PRINTSRCINFO )) || msg2 "Using $_gimp_version (found installed locally)"
	else
		error "Couldn’t determine GIMP version, make sure you have a GIMP package installed"
		exit 1
	fi
fi

pkgver() {
  cd "${_name}-qt"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v\.//;s/$/.gimp.'"$_gimp_version"'/' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}"
	make -C ${_name}/src CImg.h gmic_stdlib.h
	cd "${_name}-qt"
	if [ $_builder = cmake ]; then
		mkdir -p build
		cd build
		cmake .. -DGMIC_QT_HOST=$_host
		make
	else
		qmake HOST=$_host
		make
	fi
}

package() {
	cd "${srcdir}/${_name}-qt"
	mkdir -p "${pkgdir}${_plugin_dir}"
	if [ $_builder = cmake ]; then
		cd build
	fi
	cp ${_name}_gimp_qt "${pkgdir}${_plugin_dir}"
}
