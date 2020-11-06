# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >
# Contributor: Oliver Kuster <olivervbk gmail.com>

pkgname=qgis-grass-plugin
_pkgname=qgis
pkgver=3.16.0
pkgrel=1
pkgdesc='QGIS grass plugin resources.'
url='https://qgis.org/'
license=(GPL)
arch=(x86_64)
# there are probably way more dependencies here, but they should already be included by the packages below..
depends=(qgis=3.16.0 gdal grass)
makedepends=(cmake txt2tags)
optdepends=()
source=("https://qgis.org/downloads/$_pkgname-$pkgver.tar.bz2")
sha256sums=('ce8dfee5af989cfa2af4d087ab64d5e4022e928e847ee083e07cc9e8646ef1da')

prefix="/usr"

build() {
  mkdir -p build; cd build

  cmake -G "Unix Makefiles" "../$_pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX="$prefix" \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DENABLE_TESTS=FALSE \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DWITH_INTERNAL_{HTTPLIB2,JINJA2,MARKUPSAFE,OWSLIB,PYGMENTS,DATEUTIL,PYTZ,YAML,NOSE2,SIX,FUTURE}=FALSE \
    -DWITH_GEOREFERENCER=FALSE \
    -DWITH_3D=FALSE

  make -j $((`nproc` + 2)) grassplugin7 grassprovider7 grassrasterprovider7
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  keep_paths=(
    "lib/libqgisgrass7.so"
    "lib/libqgisgrass7.so.$pkgver"
    "lib/qgis/grass"
    "lib/qgis/plugins/libgrassplugin7.so"
    "lib/qgis/plugins/libgrassprovider7.so"
    "lib/qgis/plugins/libgrassrasterprovider7.so"
    "share/qgis/grass"
    #"share/qgis/resources/cpt-city-qgis-min/grass/"
    #"share/qgis/python/plugins/processing/algs/grass7/"
  )
  cd "$pkgdir/$prefix"
  find . -print0 2>/dev/null | while IFS= read -r -d $'\0' p ; do
	keep=false
	for k in ${keep_paths[@]}; do
		# check if one path is a subpath of the other
		if [[ "./$k" == "$p"* || "$p" == "./$k"* ]] ; then
			keep=true
			break
		fi
	done

 	if $keep; then
		echo "keeping:$p"
	else
		rm -fr "$p" &>/dev/null || true
	fi
  done

  file_count=$(find . | wc -l)
  echo "Kept $file_count files."
  [[ "$file_count" -eq 1093 ]] || { echo "ERROR: Expected to find 1093 files."; return 1; }
}

