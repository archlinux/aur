# Maintainer: Oliver Mangold <o.mangold@gmail.com>
# Contributor: Adam Brunnmeier <adam.brunnmeier@gmail.com>
pkgname=blender-2.7-bin
pkgver=2.79.190727.e045fe53f1b0
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (2.7 branch)"
arch=('i686' 'x86_64')
url="https://www.blender.org"
license=('GPL')
depends=('alembic' 'libgl' 'python' 'python-numpy' 'openjpeg' 'desktop-file-utils'
         'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')
makedepends=('wget')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
# use different url per version to trigger rebuilds when package updates.
# using $pkgver instead of $_inc is not possible (see comments on AUR-website)
_inc=190728
source=(
    "download$_inc::https://builder.blender.org/download/"
)
md5sums=('SKIP')

_setvars() {
	cd "$srcdir"
	local regex="blender-(2.7[^-]*)-([^-]+)-linux-([^-]+)-$CARCH.tar.bz2" && [[ $(cat download$_inc) =~ $regex ]]
	_full=${BASH_REMATCH[0]}
	_upstreamversion=${BASH_REMATCH[1]}
	_commit=${BASH_REMATCH[2]}
	local regex="$_full.*?<small>([[:alnum:] ]+), ([[:digit:]:]+) - $_commit" && [[ $(cat download$_inc) =~ $regex ]]
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
	sed -i 's/=blender/=blender-2.7/' blender.desktop
	sed -i 's/=Blender/=Blender-2.7/' blender.desktop
	sed -i 's/"blender"/"blender-2.7"/' blender-softwaregl
	for f in icons/*/apps/blender.* ; do chmod 644 $f && mv $f "${f%.*}-2.7.${f#*.}" ; done
	echo -n '[Thumbnailer Entry]
TryExec=blender-2.7-thumbnailer.py
Exec=blender-2.7-thumbnailer.py %u %o
MimeType=application/x-blender;
' > blender.thumbnailer
	sed -i '1s;^;#!/usr/share/blender/'"$_upstreamversion"'/python/bin/python3.7m\n;' blender-thumbnailer.py
	echo -e '#!/bin/bash\nexec /usr/share/blender/blender-2.7 $@' > blender-2.7
	echo -e '#!/bin/bash\nexec /usr/share/blender/blender-2.7-softwaregl $@' > blender-2.7-softwaregl
}

package() {
	_setvars
	cd "$srcdir/${_full%.tar.bz2}"
	install -Dm644 blender.desktop "$pkgdir/usr/share/applications/blender-2.7.desktop"
	install -Dm644 blender.thumbnailer "$pkgdir/usr/share/thumbnailers/blender-2.7.thumbnailer"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/"
	cp -r icons/* "$pkgdir/usr/share/icons/hicolor/"
	mkdir -p "$pkgdir/usr/share/blender/"
	cp -r $_upstreamversion "$pkgdir/usr/share/blender/$_upstreamversion"
	# binaries path workaround
	install -Dm755 blender "$pkgdir/usr/share/blender/blender-2.7"
	install -Dm755 blender-2.7 "$pkgdir/usr/bin/blender-2.7"
	install -Dm755 blender-softwaregl "$pkgdir/usr/share/blender/blender-2.7-softwaregl"
	install -Dm755 blender-2.7-softwaregl "$pkgdir/usr/bin/blender-2.7-softwaregl"
	install -Dm755 blender-thumbnailer.py "$pkgdir/usr/bin/blender-2.7-thumbnailer.py"
}
