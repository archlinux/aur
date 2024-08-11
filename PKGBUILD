#!/hint/bash
# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>

pkgname=djv-git
pkgver=2.0.8.r456.gdcd4694
pkgrel=2
pkgdesc="Professional media review software for VFX, animation, and film production"
arch=("x86_64")
url="https://github.com/darbyjohnston/DJV"
license=('CUSTOM')
groups=()
depends=('ffmpeg' 'python' 'libpulse' 'bash' 'alsa-lib' 'libx11' 'gcc-libs' 'glibc')
optdepends=()
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("${pkgname%-git}::git+https://github.com/darbyjohnston/DJV.git"
	"djv.desktop"
  "719-remove-non-compiling-assignment-operator.patch"
  "FFmpeg-6.x.patch"
  "OpenEXR.patch")
noextract=()
sha256sums=('SKIP'
			'ca440bc9c1713e9edb17ed5adc0456441e69af25f803c834427f23a6991e2eca'
      '8abc5c5ef033801ea99a9f289126e473ccf4ebdb9ab33fa8157f957fdeb03a2f'
      '221227ddf7007287059314434515ca3169dcf0de1713aec2f8008e3d2d782216'
			'9f5393b152206f75df96437bf5abfed230a34cfa3fb25c21fd751a383e8546bf')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# Disable DJV_ASSERT
	sed -i '/add_definitions(-DDJV_ASSERT)/d' "${srcdir}/${pkgname%-git}/CMakeLists.txt"

  # Apply patch to fix FFmpeg 6.x
  patch -Np1 --directory="${srcdir}/${pkgname%-git}" -i "${srcdir}/FFmpeg-6.x.patch"

	# Add patch to fix OpenEXR for modern GCC
	sed -i "26 i\    PATCH_COMMAND git apply ${srcdir}/OpenEXR.patch" ${pkgname%-git}/etc/SuperBuild/cmake/Modules/BuildOpenEXR.cmake

  # Add patch to fix rapidjson for modern GCC
  sed -i "26 i\    PATCH_COMMAND git apply ${srcdir}/719-remove-non-compiling-assignment-operator.patch" ${pkgname%-git}/etc/SuperBuild/cmake/Modules/BuildRapidJSON.cmake

  # Disable jack support in rtAudio
  sed -i "19 i\    -DRTAUDIO_API_JACK=Off" ${pkgname%-git}/etc/SuperBuild/cmake/Modules/BuildRtAudio.cmake
}

build() {
	export DJV_BUILD=$PWD
	export LD_LIBRARY_PATH=$DJV_BUILD/${pkgname%-git}-install/lib:$LD_LIBRARY_PATH
	
	cmake -S "${pkgname%-git}/etc/SuperBuild" -B ${pkgname%-git}-Release \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="$DJV_BUILD/${pkgname%-git}-install" \
		-DCMAKE_PREFIX_PATH="$DJV_BUILD/${pkgname%-git}-install" \
		-DCMAKE_INSTALL_RPATH=""

	njobs=$(grep -Po -- '-j\s?[0-9]+'<<<"${MAKEFLAGS}") ||
	njobs=$(grep -c ^processor /proc/cpuinfo)
	
	echo 'Building DJV'

	cmake --build ${pkgname%-git}-Release -j "${njobs}"
	echo 'Finished building DJV'
}

package() {
	install -D -m755 "$srcdir"/${pkgname%-git}-install/bin/djv* -t "$pkgdir/opt/${pkgname%-git}/bin/"
	cp -r "$srcdir/${pkgname%-git}-install/docs" "$pkgdir/opt/${pkgname%-git}/"
	cp -r "$srcdir/${pkgname%-git}-install/etc" "$pkgdir/opt/${pkgname%-git}/"
	install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -D -m644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
	install -D -m644 "${srcdir}/${pkgname%-git}/etc/Icons/djv-app-icon-512.svg" "${pkgdir}/usr/share/pixmaps/djv.svg"
	
	install -d -m755 "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname%-git}/bin/djv.sh" "${pkgdir}/usr/bin/djv"
}
