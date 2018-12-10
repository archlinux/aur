# Maintainer: Adam Brunnmeier <adam.brunnmeier@gmail.com>
pkgname=blender-2.8-bin
pkgver=2.80.181210.168a6a4bfc1
pkgrel=2
pkgdesc="A fully integrated 3D graphics creation suite"
arch=('i686' 'x86_64')
url="https://www.blender.org"
license=('GPL')
# dependencies copied from https://www.archlinux.org/packages/community/x86_64/blender/ minus python
depends=('libpng' 'libtiff' 'openexr' 'desktop-file-utils'
         'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'glew' 'openjpeg'
         'freetype2' 'openal' 'ffmpeg' 'fftw' 'boost-libs' 'opencollada' 'alembic'
         'openimageio' 'libsndfile' 'jack' 'opencolorio' 'openshadinglanguage'
         'jemalloc' 'libspnav' 'ptex' 'opensubdiv' 'openvdb' 'log4cplus' 'sdl2')
makedepends=('wget')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://builder.blender.org/download")
md5sums=('SKIP')

_setvars() {
	cd "$srcdir"
	local regex="blender-(2.8[^-]*)-([^-]*)-linux-[^-]*-$CARCH.tar.bz2" && [[ $(cat download) =~ $regex ]]
	_full=${BASH_REMATCH[0]}
	_upstreamversion=${BASH_REMATCH[1]}
	_commit=${BASH_REMATCH[2]}
	local regex="$_full.*?<small>([[:alnum:] ]+), ([[:digit:]:]+) - $_commit" && [[ $(cat download) =~ $regex ]]
	_date=$(date --date="${BASH_REMATCH[1]} ${BASH_REMATCH[2]}" "+%y%m%d")
}

pkgver() {
	_setvars
	printf "$_upstreamversion.$_date.$_commit"
}

build() {
	_setvars
	cd "$srcdir"
	wget -O- "https://builder.blender.org/download//$_full" | tar xj
	cd "${_full%.tar.bz2}"
	sed -i 's/=blender/=blender-2.8/' blender.desktop
	sed -i 's/=Blender/=Blender-2.8/' blender.desktop
	rm icons/blender_icon_source.svg
	for f in icons/*/apps/blender.* ; do chmod 644 $f && mv $f "${f%.*}-2.8.${f#*.}" ; done
	echo -n '[Thumbnailer Entry]
TryExec=blender-2.8-thumbnailer.py
Exec=blender-2.8-thumbnailer.py %u %o
MimeType=application/x-blender;
' > blender.thumbnailer
	sed -i '1s;^;#!/usr/share/blender/'"$_upstreamversion"'/python/bin/python3.7m\n;' blender-thumbnailer.py
	echo -e '#!/bin/bash\nexec /usr/share/blender/blender $@' > blender-2.8
	echo -e '#!/bin/bash\nexec /usr/share/blender/blender-softwaregl $@' > blender-2.8-softwaregl
}

package() {
	_setvars
	cd "$srcdir/${_full%.tar.bz2}"
	install -Dm644 blender.desktop "$pkgdir/usr/share/applications/blender-2.8.desktop"
	install -Dm644 blender.thumbnailer "$pkgdir/usr/share/thumbnailers/blender-2.8.thumbnailer"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/"
	cp -r icons/* "$pkgdir/usr/share/icons/hicolor/"
	mkdir -p "$pkgdir/usr/share/blender/"
	cp -r $_upstreamversion "$pkgdir/usr/share/blender/$_upstreamversion"
	# binaries path workaround
	install -Dm755 blender "$pkgdir/usr/share/blender/blender"
	install -Dm755 blender-2.8 "$pkgdir/usr/bin/blender-2.8"
	install -Dm755 blender-softwaregl "$pkgdir/usr/share/blender/blender-softwaregl"
	install -Dm755 blender-2.8-softwaregl "$pkgdir/usr/bin/blender-2.8-softwaregl"
	install -Dm755 blender-thumbnailer.py "$pkgdir/usr/bin/blender-2.8-thumbnailer.py"
}
