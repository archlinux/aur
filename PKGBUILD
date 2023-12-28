# Maintainer: Typology <mohammedkaabi64@gmail.com>
# Co-Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Co-Maintainer: Andrew Bueide <abueide@protonmail.com>
# Co-Maintainer: rouhannb <rouhannb@gmail.com>
# Contributor: Eldred Habert <me@eldred.fr>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite-skia-bin
pkgver=1.3.2
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64')
url="https://www.aseprite.org/"
license=('custom')
depends=(# ~ Aseprite's direct dependencies ~
         # pixman is not linked to because we use Skia instead
         # harfbuzz is linked statically because Aseprite expects an older version
         cmark libcurl.so libgif.so libjpeg.so zlib libpng tinyxml libfreetype.so=6-64 libarchive.so
         libexpat.so=1-64 libharfbuzz.so=0-64
         hicolor-icon-theme # For installing Aseprite's icons
         # ~ Skia deps ~
         libgl libc++
         # These two are only reported by Namcap, but don't seem to be direct dependencies?
         libfontconfig.so libxcursor)
makedepends=(# "Meta" dependencies
             cmake ninja git python clang
             # Aseprite (including e.g. LAF)
             libxi
             # Skia
             harfbuzz-icu)
provides=(aseprite)
conflicts=(aseprite)
source=("https://github.com/aseprite/aseprite/releases/download/v$pkgver/Aseprite-v$pkgver-Source.zip"
        # Which branch a given build of Aseprite requires is noted in its `INSTALL.md`
        "https://github.com/aseprite/skia/releases/download/m102-861e4743af/Skia-Linux-Release-x64-libc++.zip"
        desktop.patch
        # Based on https://patch-diff.githubusercontent.com/raw/aseprite/aseprite/pull/2535.patch
        shared-libarchive.patch
        # Based on https://patch-diff.githubusercontent.com/raw/aseprite/aseprite/pull/2523.patch
        shared-libwebp.patch
        shared-skia-deps.patch
        optional-pixman.patch)
noextract=("${source[0]##*/}" "${source[1]##*/}") # Don't extract Aseprite sources or Skia at the root
sha256sums=('0246b18ff77d4c4e813c7f40207bfbd1387813b82d57900cde869dab370a26cc'
            '66293c15aa773a96121afb01f09109d3e5d455a6fd51944e0bb8bdc0829913ea'
            '8b14e36939e930de581e95abf0591645aa0fcfd47161cf88b062917dbaaef7f9'
            'e42675504bfbc17655aef1dca957041095026cd3dd4e6981fb6df0a363948aa7'
            '320ed456512fb26f30aa682d7d34529d6fc3372d76daba3812cecb8fc21d5f1d'
            'eb9f544e68b41b5cb1a9ab7a6648db51587e67e94f1a452cb5a84f3d224bf5d0'
            'c2d14f9738a96a9db3695c00ac3d14b1312b6a595b151bd56e19422c86517654')

prepare() {
	mkdir -p aseprite skia
	bsdtar -xf ${noextract[0]} -C aseprite
	bsdtar -xf ${noextract[1]} -C skia

	# Fix up Aseprite's desktop integration
	env -C aseprite patch -tp1 <desktop.patch
	# Allow using more shared libs
	env -C aseprite patch -tp1 <shared-libarchive.patch
	env -C aseprite patch -tp1 <shared-libwebp.patch
	env -C aseprite patch -tp1 <optional-pixman.patch
	# Their "FindSkia" module forcefully tries to use Skia's FreeType and HarfBuzz,
	# but we don't clone those because we use the shared ones. Avoid overwriting the settings instead.
	env -C aseprite patch -tp1 <shared-skia-deps.patch
}

build() {
	local _skiadir="$srcdir/skia/out/Release-x64"
	# Suppress install messages since we install to a temporary area; `install -v` will do the job
	# Can't use shared FMT not TINYXML because of ABI incompatibilities (GCC vs Clang)
	cmake -S aseprite -B build -G Ninja -Wno-dev -DCMAKE_INSTALL_MESSAGE=NEVER -DCMAKE_BUILD_TYPE=None \
-DENABLE_{UPDATER,WEBSOCKET}=NO -DENABLE_SCRIPTING=ON -DLAF_WITH_EXAMPLES=OFF -DLAF_WITH_TESTS=OFF -DLAF_BACKEND=skia \
-DSKIA_DIR="$srcdir/skia" -DSKIA_LIBRARY_DIR="$_skiadir" -DSKIA_LIBRARY="$_skiadir/libskia.a" \
-DUSE_SHARED_{CMARK,CURL,GIFLIB,JPEGLIB,ZLIB,LIBPNG,PIXMAN,FREETYPE,HARFBUZZ,LIBARCHIVE,WEBP}=YES \
-DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_CXX_FLAGS="$CXXFLAGS -stdlib=libc++" -DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=libc++ \
-DWEBP_INCLUDE_DIR="$srcdir/skia/third_party/externals/libwebp/src" \
-DWEBP{,MUX,DEMUX}_LIBRARY= # Use Skia's already-bundled WebP library (link to no additional libs)
	ninja -C build
}

package() {
	# Now the fun part: components of e.g. `libwebp` get installed as well,
	# since we've had to compile it. But we don't want them.
	# So, install normally, and then cherry-pick Aseprite's files out of that.
	# Use a whitelist to prefer installing not enough (breakage goes noticed),
	# instead of too much (cruft rarely goes noticed). Also hope that it doesn't break :)
	cmake --install build --prefix=staging --strip

	# Install the binary and its `.desktop` file
	install -vDm 755 staging/bin/aseprite "$pkgdir/usr/bin/aseprite"
	install -vDm 644 aseprite/src/desktop/linux/aseprite.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -vDm 644 aseprite/src/desktop/linux/mime/aseprite.xml "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
	# Install the icons in the correct directory (which is not the default)
	local _size
	for _size in 16 32 48 64 128 256; do
		# The installed icon's name is taken from the `.desktop` file
		install -vDm 644 staging/share/aseprite/data/icons/ase$_size.png "$pkgdir/usr/share/icons/hicolor/${_size}x$_size/apps/aseprite.png"
	done
	# Delete the icons to avoid copying them in two places (they aren't used by Aseprite itself)
	rm -rf staging/share/aseprite/data/icons
	# Install all of the program's data
	cp -vrt "$pkgdir/usr/share" staging/share/aseprite
	# Also install the licenses
	install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" aseprite/{EULA.txt,docs/LICENSES.md}
	# Copy the font's license, but leave it in the font directory as well (probably doesn't hurt)
	install -vm 644 aseprite/data/fonts/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/font.txt"
}

# vim:set ts=2 sw=2 et:
