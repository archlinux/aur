# Maintainer: Imperator Storm <30777770+ImperatorStorm@users.noreply.github.com>
# Co-Maintainer: Eldred Habert <me@eldred.fr>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Andrew Bueide <abueide@protonmail.com>
# Contributor: rouhannb <rouhannb@protonmail.com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite
pkgver=1.2.30
pkgrel=5
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64')
url="https://www.aseprite.org/"
license=('custom')
depends=(# ~ Aseprite's direct dependencies ~
         # pixman is not linked to because we use Skia instead
         # harfbuzz is linked statically because Aseprite expects an older version
         cmark libcurl.so libgif.so libjpeg.so zlib libpng tinyxml libfreetype.so libarchive.so
         libwebp.so libwebpmux.so libwebpdemux.so
         hicolor-icon-theme # For installing Aseprite's icons
         # ~ Skia deps ~
         # (Skia links dynamically to HarfBuzz, only Aseprite itself doesn't. >_<)
         libexpat.so=1-64 libharfbuzz.so=0-64 libgl
         # Already required by Aseprite: libjpeg-turbo libpng zlib freetype2
         # These two are only reported by Namcap, but don't seem to be direct dependencies?
         libfontconfig.so libxcursor)
makedepends=(# "Meta" dependencies
             cmake ninja git python
             # Aseprite (including e.g. LAF)
             libxi pixman
             # Skia
             harfbuzz-icu)
source=("https://github.com/aseprite/aseprite/releases/download/v$pkgver/Aseprite-v$pkgver-Source.zip"
        # Which branch a given build of Aseprite requires is noted in its `INSTALL.md`
        "git+https://github.com/aseprite/skia.git#branch=aseprite-m81"
        # `gn` executable required to configure Skia, pulled from `skia/bin/fetch-gn`
        # Normally we'd use the Arch-provided one, but it has API incompatibilities
        "gn::https://chromium-gn.storage-download.googleapis.com/3523d50538357829725d4ed74b777a572ce0ac74"
        # Skia dependencies, determined from `skia/DEPS`
        # Only pulling what we need, though
        "git+https://chromium.googlesource.com/chromium/buildtools.git#commit=505de88083136eefd056e5ee4ca0f01fe9b33de8"
        "git+https://skia.googlesource.com/common.git#commit=9737551d7a52c3db3262db5856e6bcd62c462b92"
        # Python 3-compliant version of the script
        is_clang.py
        # Based on https://patch-diff.githubusercontent.com/raw/aseprite/aseprite/pull/2535.patch
        shared-libarchive.patch
        # Based on https://patch-diff.githubusercontent.com/raw/aseprite/aseprite/pull/2523.patch
        shared-libwebp.patch
        optional-pixman.patch)
noextract=("${source[0]##*/}") # Don't extract Aseprite sources at the root
sha256sums=('9f4b098fe2327f2e9d73eb9f2aeebecad63e87ff2cf6fb6eeeee3c0778bb8874'
            'SKIP'
            'c8c2d617f1a33d6eb27f25ebcc30bd8ba1e6a0aa980cada21dda2ad1401fa4a2'
            'SKIP'
            'SKIP'
            'cb901aaf479bcf1a2406ce21eb31e43d3581712a9ea245672ffd8fbcd9190441'
            'e42675504bfbc17655aef1dca957041095026cd3dd4e6981fb6df0a363948aa7'
            '9a85e9b1b52c1d33d128cb87c12395d9a245049cfc10e148659ae2acd4cab3e6'
            'c2d14f9738a96a9db3695c00ac3d14b1312b6a595b151bd56e19422c86517654')

prepare() {
	# Extract Aseprite's sources
	mkdir -p aseprite
	bsdtar -xf "${noextract[0]}" -C aseprite

	# Symlink Skia's build dependencies
	# Sort of emulating `skia/tools/git-sync-deps`, but only grabbing what we need
	mkdir -p skia/third_party/externals
	# Key = repo name (from above), value = path under `src/skia/`
	local -A _skiadeps=([buildtools]=buildtools
	                    [common]=common) _dep
	for _dep in "${!_skiadeps[@]}"; do
		ln -svfT "$(realpath $_dep)" "skia/${_skiadeps[$_dep]}"
	done
	chmod 755 gn

	# Replace `is_clang.py` with Python 3-compliant version
	cp -v is_clang.py skia/gn

	# Allow using shared libarchive (the bundled version prevents using the `None` build type...)
	env -C aseprite patch -tp1 <shared-libarchive.patch
	# Allow using shared libarchive (breaks builds otherwise...)
	env -C aseprite patch -tp1 <shared-libwebp.patch
	# Skip the build-time dependency on Pixman since it doesn't get used in the end
	env -C aseprite patch -tp1 <optional-pixman.patch
}

build() {
	echo Building Skia...
	local _skiadir="$PWD/skia/obj"
	# Must use the bundled `gn` executable and HarfBuzz libraries because of incompatibilities
	# Flags can typically be found in `src/skia/gn/skia.gni`... but you're kind of on your own
	env -C skia ../gn gen "$_skiadir" --args="`printf '%s ' \
is_debug=false is_official_build=true skia_enable_{skottie,pdf}=false \
skia_use_{expat,libjpeg_turbo,libwebp,xps,zlib,libgifcodec,sfntly}=false`"
	ninja -C "$_skiadir" skia modules

	echo Building Aseprite...
	# Suppress install messages since we install to a temporary area; `install -v` will do the job
	cmake -S aseprite -B build -G Ninja -Wno-dev -DCMAKE_INSTALL_MESSAGE=NEVER -DCMAKE_BUILD_TYPE=None \
-DENABLE_UPDATER=NO -DLAF_WITH_EXAMPLES=OFF -DLAF_WITH_TESTS=OFF -DLAF_BACKEND=skia \
-DSKIA_DIR="$PWD/skia" -DSKIA_LIBRARY_DIR="$_skiadir" -DSKIA_LIBRARY="$_skiadir/libskia.a" \
-DUSE_SHARED_{CMARK,CURL,GIFLIB,JPEGLIB,ZLIB,LIBPNG,TINYXML,PIXMAN,FREETYPE,HARFBUZZ,LIBARCHIVE,WEBP}=YES
	ninja -C build
}

check() {
	env -C build ctest --output-on-failure
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
