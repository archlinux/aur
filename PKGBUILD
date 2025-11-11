# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Maintainer: Eldred Habert <me@eldred.fr>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Andrew Bueide <abueide@protonmail.com>
# Contributor: rouhannb <rouhannb@protonmail.com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>
# Contributor: Jomar Milan <jomarm@jomarm.com>

pkgname=aseprite
pkgver=1.3.15.5
_skiaver=m124
_skiahash=08a5439a6b
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64')
url="https://www.aseprite.org/"
license=('LicenseRef-Aseprite-EULA')
depends=(# ~ Aseprite's direct dependencies ~
         # pixman is not linked to because we use Skia instead
         # harfbuzz is linked statically because Aseprite expects an older version
         cmark libcurl.so libgif.so libjpeg.so zlib libpng 'tinyxml2>=11.0.0' libfreetype.so libarchive.so libfmt.so
         libwebp.so libwebpmux.so libwebpdemux.so libjpeg.so
         hicolor-icon-theme # For installing Aseprite's icons
         # ~ Skia deps ~
         # (Skia links dynamically to HarfBuzz, only Aseprite itself doesn't. >_<)
         libexpat.so=1-64 libharfbuzz.so=0-64 libgl
         # Already required by Aseprite: libjpeg-turbo libpng zlib freetype2
         # These two are only reported by Namcap, but don't seem to be direct dependencies?
         libfontconfig.so libxcursor
         # Required Dependency
         libxrandr)
makedepends=(# "Meta" dependencies
             cmake ninja git python
             # Aseprite (including e.g. LAF)
             libxi
             # Skia
             gn harfbuzz-icu
             # TODO: Benchmark clang v gcc
             # Fuck it, compiling with GCC>=13 is broken and I'm not gonna write a patch to fix it
             clang
             )
source=("https://github.com/aseprite/aseprite/releases/download/v1.3.15.4/Aseprite-v1.3.15.5-Source.zip"
        # Which branch a given build of Aseprite requires is noted in its `INSTALL.md`
        "skia-$_skiaver.tar.gz::https://github.com/aseprite/skia/archive/refs/tags/$_skiaver-$_skiahash.tar.gz"
        # forgive me, I couldn't figure out linker errors.
        # update commit with skia
        skia-$_skiaver-icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=a0718d4f121727e30b8d52c7a189ebf5ab52421f
		aseprite-strings::git+https://github.com/aseprite/strings.git#commit=038a79a039eecee7110a5da5862e15941abea629
        desktop.patch
        shared-fmt.patch
        # Based on https://patch-diff.githubusercontent.com/raw/aseprite/aseprite/pull/2535.patch
        shared-libarchive.patch
        # Based on https://patch-diff.githubusercontent.com/raw/aseprite/aseprite/pull/2523.patch
        shared-libwebp.patch
        shared-skia-deps.patch
        optional-pixman.patch
        fix-shared-tinyxml2.patch
        shared-libwebp-found.patch
        include_cstdint.patch
        shared_libjpeg-turbo.patch)
noextract=("Aseprite-v$pkgver-Source.zip"
           "skia-$_skiaver.tar.gz"
           "aseprite-skia-$_skiaver-flutter.tar.gz") # Don't extract Aseprite or skia sources at the root
sha256sums=('2402325af2d6b7f663a5f06f728a6d2a1a2053e17cd97afa483b155689a3e9d4'
            'c2a567d6b8bb933a92615cbdee0de268d02c3a06863337ee8822eedab9ed66ba'
            'b52f179a687ef2f91a52b696ab6581f4a37df5e88cb22040fa1ec6567cf0ebb1'
            'b8c25e0f29d05eefe9e522c32fb0a38db4f0f574adcfb5f20d4324c9e39fbb8c'
            '8b14e36939e930de581e95abf0591645aa0fcfd47161cf88b062917dbaaef7f9'
            'c3591d376180d99ff8001c3d549c0bd18ef5e4d95f1755ccaa8e2fd65dd5d2b3'
            '96d75ecc951712e80734f476511658fcc3c91fc1655fe9a01453c3fc8c2a9274'
            '0f8adb959d7000697af453d6cf5aaf9984b74868008382aad541d2c29871c751'
            'eb9f544e68b41b5cb1a9ab7a6648db51587e67e94f1a452cb5a84f3d224bf5d0'
            'c2d14f9738a96a9db3695c00ac3d14b1312b6a595b151bd56e19422c86517654'
            'ba02fc060dc930cfd66a8903a5d8a59f981753bdf416e91cc77a48c56c86aea3'
            '72605d6760c29eb98f2d8d8cf2cc9f9f7d7655bcf7cfc944f6a46b0957adbb14'
            '3381038fc5209600428801fa0b2b05ddee031b0926eaa75c114172e503916cd5'
            '0fa67d34f63cb4ed472b620ebad0656aeca646cb7f1069b7066ee91e6902fe6c')
_debug="true"
prepare() {
	# Extract Aseprite's sources
	mkdir -p aseprite
	bsdtar -xf "${noextract[0]}" -C aseprite
	# Extract Skia's sources
	mkdir -p skia
	bsdtar xf skia-$_skiaver.tar.gz  --strip-components=1 -C skia
	# link to skia's icu
	mkdir -p skia/third_party/externals/
	ln -s $srcdir/skia-$_skiaver-icu skia/third_party/externals/icu
	# Fix up Aseprite's desktop integration
	[[ -n $_debug ]] && echo desktop.patch
	env -C aseprite patch -tp1 <desktop.patch
	# Allow using more shared libs
	[[ -n $_debug ]] && echo shared-fmt.patch
	env -C aseprite patch -tp1 <shared-fmt.patch
	[[ -n $_debug ]] && echo shared-libarchive.patch
	env -C aseprite patch -tp1 <shared-libarchive.patch
	[[ -n $_debug ]] && echo shared-libwebp.patch
	env -C aseprite patch -tp1 <shared-libwebp.patch
	[[ -n $_debug ]] && echo shared-pixman.patch
	env -C aseprite patch -tp1 <optional-pixman.patch
	# Their "FindSkia" module forcefully tries to use Skia's FreeType and HarfBuzz,
	# but we don't clone those because we use the shared ones. Avoid overwriting the settings instead.
	[[ -n $_debug ]] && echo shared-skia-deps.patch
	env -C aseprite patch -tp1 <shared-skia-deps.patch
	# TinyEXIF cannot find tinyxml2 otherwise
	[[ -n $_debug ]] && echo fix-shared-tinyxml2.patch
	env -C aseprite/third_party/TinyEXIF patch -tp1 <fix-shared-tinyxml2.patch
	[[ -n $_debug ]] && echo shared-libwebp-found.patch
	env -C aseprite patch -tp1 <shared-libwebp-found.patch
	[[ -n $_debug ]] && echo shared_libjpeg-turbo.patch
	env -C aseprite patch -tp1 <shared_libjpeg-turbo.patch
	[[ -n $_debug ]] && echo include_cstdint.patch
	patch -tp1 <include_cstdint.patch
}

build() {
	echo Building Skia...
	local _skiadir="$PWD/skia/obj"
	export CXX=clang++
	export CC=clang
	export CXXFLAGS+=" -std=c++11 -stdlib=libstdc++"
	export AR=ar
	export NM=nm
	# Flags can be found by running `gn args --list "$_skiadir"` from skia's directory.
	# (Pipe the output somewhere, there's a LOT of args.)
	#
	# The flags are chosen to provide the API required by Aseprite and nothing else (if possible),
	# so as to reduce the compilation time and final binary size.
	#
	# Individual rationales:
	#   is_official_build: Suggested by the build instructions.
	#   skia_build_fuzzers: We don't care about them.
	#   skia_enable_pdf: Not used by Aseprite.
	#   skia_enable_skottie: Not used by Aseprite.
	#   skia_use_lib*_{encode,decode}: Aseprite only loads PNG assets, so only libpng is required.
	#   skia_use_expat: Only required for the Android font manager and SVGCanvas/SVGDevice.
	#   skia_use_piex: Not used by Aseprite. Only used for reading RAW files.
	#   skia_use_xps: Not used outside of Windows.
	#   skia_use_zlib: Only used for PDF and RAW files.
	#   skia_enable_skparagraph: Aseprite does not link against this library.
	#   skia_use_system_icu: Aseprite wants an `icudtl.dat`, which would require pulling a 1GiB git repo
	#                        as a dependency

	# gn is bad software
	env -C skia gn gen "$_skiadir" --args='is_official_build=true skia_build_fuzzers=false skia_enable_pdf=false skia_enable_skottie=false skia_enable_svg=false skia_use_libjpeg_turbo_encode=false skia_use_libjpeg_turbo_decode=false skia_use_libwebp_encode=false skia_use_libwebp_decode=false skia_use_expat=false skia_use_piex=false skia_use_xps=false skia_use_zlib=false skia_enable_skparagraph=false skia_use_wuffs=false skia_use_system_icu=false cc="clang" cxx="clang++"'
	ninja -C "$_skiadir" skia modules
	echo Building Aseprite...
	# Suppress install messages since we install to a temporary area; `install -v` will do the job
	cmake -S aseprite -B build -G Ninja -Wno-dev -DCMAKE_INSTALL_MESSAGE=NEVER -DCMAKE_BUILD_TYPE=None \
-DENABLE_UPDATER=OFF -DENABLE_{SCRIPTING,WEBSOCKET}=ON \
-DLAF_WITH_{EXAMPLES,TESTS}=OFF -DLAF_BACKEND=skia \
-DSKIA_DIR="$PWD/skia" -DSKIA_LIBRARY_DIR="$_skiadir" \
-DUSE_SHARED_{CMARK,CURL,FMT,GIFLIB,LIBJPEG_TURBO,ZLIB,LIBPNG,TINYXML,PIXMAN,FREETYPE,HARFBUZZ,LIBARCHIVE,WEBP}=ON \
-DCMAKE_POLICY_VERSION_MINIMUM=3.5 # workaround
	cmake --build build
}

check() {
	export CXX=clang++
	export CC=clang
	export CXXFLAGS+=" -std=c++11 -stdlib=libstdc++"
	export AR=ar
	export NM=nm
	env -C build ctest --output-on-failure
}

package() {
	export CXX=clang++
	export CC=clang
	export CXXFLAGS+=" -std=c++11 -stdlib=libstdc++"
	export AR=ar
	export NM=nm
	# Now the fun part: components of e.g. `libwebp` get installed as well,
	# since we've had to compile it. But we don't want them.
	# So, install normally, and then cherry-pick Aseprite's files out of that.
	# Use a whitelist to prefer installing not enough (breakage goes noticed),
	# instead of too much (cruft rarely goes noticed). Also hope that it doesn't break :)
	cmake --install build --prefix=staging --strip

	# Install the binary and its `.desktop` file
	install -vDm 755 staging/bin/aseprite "$pkgdir/usr/bin/aseprite"
	install -vDm 644 aseprite/src/desktop/linux/aseprite.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -vDm 644 aseprite/src/desktop/linux/mime/aseprite.xml "$pkgdir/usr/share/mime/packages/$pkgname.xml"
	# Thumbnailer
	install -vDm 755 aseprite/src/desktop/linux/aseprite-thumbnailer "$pkgdir/usr/bin/aseprite-thumbnailer"
	install -vDm 644 aseprite/src/desktop/linux/gnome/aseprite.thumbnailer "$pkgdir/usr/share/thumbnailers/aseprite.thumbnailer"
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
	# Copy translations
	mkdir -p "$pkgdir/usr/share/$pkgname/data/strings/"
	cp -vt "$pkgdir/usr/share/$pkgname/data/strings/" aseprite-strings/*.ini
	# Copy translations' license
	install -vm 644 aseprite-strings/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/translations.txt"
}
