# Maintainer: NF <notfood.dev at gmail dot com>
# Contributor: Oliver Mangold <o.mangold@gmail.com>
# Contributor: Adam Brunnmeier <adam.brunnmeier@gmail.com>
pkgname=blender-2.90-bin
pkgver=2.90.200626.b7b57e7155ee
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite"
arch=('x86_64')
url="https://www.blender.org"
license=('GPL')
# dependencies copied from https://www.archlinux.org/packages/community/x86_64/blender/
depends=('libpng' 'libtiff' 'openexr' 'python' 'desktop-file-utils' 'python-requests'
         'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'glew' 'openjpeg2' 'python-numpy'
         'freetype2' 'openal' 'ffmpeg' 'fftw' 'boost-libs' 'opencollada' 'alembic'
         'openimageio' 'libsndfile' 'jack' 'opencolorio' 'openshadinglanguage' 'openimagedenoise'
         'jemalloc' 'libspnav' 'ptex' 'opensubdiv' 'openvdb' 'log4cplus' 'sdl2' 'embree')
makedepends=('wget')
optdepends=('cuda: cycles renderer cuda support')
# use different url per version to trigger rebuilds when package updates.
# using $pkgver instead of $_inc is not possible (see comments on AUR-website)
_webpage="daily.$(date '+%y%m%d').html"
source=("$_webpage::https://builder.blender.org/download/")
md5sums=('SKIP')

_setvars() {
	cd "$srcdir"
	_upstreamversion=$(echo $pkgname | cut -d '-' -f2)
	local regex="blender-${_upstreamversion}[^-]*-([^-]+)-linux64.tar.xz" && [[ $(cat $_webpage) =~ $regex ]]
	_full=${BASH_REMATCH[0]}
	_commit=${BASH_REMATCH[1]}
	local regex="([A-Za-z]+ [0-9]+, [0-9]+:[0-9]+:[0-9]+)[^-]*-\s*$_commit" && [[ $(cat $_webpage) =~ $regex ]]
	_date=$(date --date="${BASH_REMATCH[1]//,}" "+%y%m%d")
}

pkgver() {
	_setvars
	printf "$_upstreamversion.$_date.$_commit"
}

build() {
	_setvars
	cd "$srcdir"
	wget -nc "https://builder.blender.org/download/$_full"
	tar -xJ -f "$_full"
	cd "${_full%.tar.xz}"
	# Remove included Python installation, so system Python is used instead (when Python 3.8 is supported)
	#rm -rf "$_upstreamversion/python"
	sed -i "s/=blender/=blender-$_upstreamversion/" blender.desktop
	sed -i "s/=Blender/=Blender-$_upstreamversion/" blender.desktop
	#for f in datafiles/icons/*/apps/blender.* ; do chmod 644 $f && mv $f "${f%.*}-$_upstreamversion.${f#*.}" ; done
	echo -n "[Thumbnailer Entry]
TryExec=blender-$_upstreamversion-thumbnailer.py
Exec=blender-$_upstreamversion-thumbnailer.py %u %o
MimeType=application/x-blender;
" > blender.thumbnailer
	sed -i '1s;^;#!/usr/share/blender/'"$_upstreamversion"'/python/bin/python3.7m\n;' blender-thumbnailer.py
	echo -e "#!/bin/bash\nexec /usr/share/blender/blender-$_upstreamversion \$@" > blender-$_upstreamversion
	echo -e "#!/bin/bash\nexec /usr/share/blender/blender-softwaregl-$_upstreamversion \$@" > blender-$_upstreamversion-softwaregl
}

package() {
	_setvars
	cd "$srcdir/${_full%.tar.xz}"
	install -Dm644 blender.desktop "$pkgdir/usr/share/applications/blender-$_upstreamversion.desktop"
	install -Dm644 blender.thumbnailer "$pkgdir/usr/share/thumbnailers/blender-$_upstreamversion.thumbnailer"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -Dm644 blender.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/blender-$_upstreamversion.svg"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
	install -Dm644 blender-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/blender-$_upstreamversion-symbolic.svg"
	mkdir -p "$pkgdir/usr/share/blender/"
	cp -r $_upstreamversion "$pkgdir/usr/share/blender/$_upstreamversion"
	# binaries path workaround
	install -Dm755 blender "$pkgdir/usr/share/blender/blender-$_upstreamversion"
	install -Dm755 blender-$_upstreamversion "$pkgdir/usr/bin/blender-$_upstreamversion"
	install -Dm755 blender-softwaregl "$pkgdir/usr/share/blender/blender-softwaregl-$_upstreamversion"
	install -Dm755 blender-$_upstreamversion-softwaregl "$pkgdir/usr/bin/blender-$_upstreamversion-softwaregl"
	install -Dm755 blender-thumbnailer.py "$pkgdir/usr/bin/blender-$_upstreamversion-thumbnailer.py"
}
