# Maintainer: Felipe Facundes

# Modified Audacity for OpenVINO support
pkgname=audacity-openvino
pkgver=3.7.5
pkgrel=1
epoch=1
pkgdesc="Audacity - Digital audio editor with AI support via openvino (mod-openvino)"
arch=(x86_64)
url="https://audacityteam.org"
license=(GPL-3.0-or-later)
depends=(
  libtorch-cxx11abi-cpu gcc13-libs gcc13
  alsa-lib expat flac gcc-libs glibc gdk-pixbuf2 glib2 gtk3
  jack lame libid3tag libmad libogg libsbsms libsndfile libsoxr
  libvorbis libx11 lilv mpg123 opusfile portaudio portmidi portsmf
  vamp-plugin-sdk wavpack wxwidgets-common openvino openvino-models
  python soundtouch sqlite suil twolame util-linux-libs wxwidgets-gtk3
)
conflicts=(audacity)
provides=(
	ladspa-host
	lv2-host
	vamp-host
	vst-host
	vst3-host
	audacity
)
makedepends=(
  git cmake chrpath ffmpeg rapidjson wxwidgets-gtk3 vst3sdk
)
source=(
  "git+https://github.com/audacity/audacity.git#tag=Audacity-$pkgver"
  "git+https://github.com/intel/openvino-plugins-ai-audacity.git"
  "audacity-openvino"
  "audacity-openvino.desktop"
)
sha256sums=(
	'SKIP' 
	'SKIP'
	'852fce50425d748e34a13466294c2d12c78ea7ebb0ac18ae294da0c7a806a8f9'
	'3319462d2f642af6f9806c256b8af7e4bceaa03e40fee4fe0131fa97482027a1'
)

prepare() {
  cd "${srcdir}/audacity"

  echo "==> Copying OpenVINO module to modules/..."
  rm -rf modules/openvino-plugins-ai-audacity
  cp -r "${srcdir}/openvino-plugins-ai-audacity" modules/openvino-plugins-ai-audacity

  echo "==> Criando CMakeLists.txt para o módulo OpenVINO..."
  cat > modules/openvino-plugins-ai-audacity/CMakeLists.txt <<'EOF'
#[[
A directory of module targets
]]

# Include the modules that we'll build

# The list of modules is ordered so that each module occurs after any others
# that it depends on
set( MODULES
   mod-openvino
)

audacity_module_subdirectory("${MODULES}")
EOF

  echo "==> Inserting openvino-plugins-ai-audacity module in CMakeLists.txt..."
  # Insert the add_subdirectory line if it is not already present
  if ! grep -q "openvino-plugins-ai-audacity" modules/CMakeLists.txt; then
    sed -i '/foreach( FOLDER ${FOLDERS} )/i add_subdirectory("openvino-plugins-ai-audacity")' modules/CMakeLists.txt
  fi

  echo "==> CMakeLists.txt updated:"
  grep openvino-plugins-ai-audacity modules/CMakeLists.txt
}

build() {
  cd "${srcdir}/audacity"

  export LIBTORCH_ROOTDIR="/opt/libtorch-cpu/"
  export CC=gcc-13
  export CXX=g++-13

  local cmake_options=(
    -B build
    -S .
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D audacity_use_openvino=ON
    -D audacity_conan_enabled=OFF
    -D audacity_has_tests=OFF
    -D audacity_lib_preference=system
    -D audacity_obey_system_dependencies=ON
    -W no-dev
	-D CMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -Wno-error=deprecated-declarations"
  )

  export CFLAGS+=" -DNDEBUG -std=gnu11"
  export CXXFLAGS+=" -DNDEBUG"
  export VST3SDK="/usr/src/vst3sdk"

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  shortcut="${pkgdir}/usr/share/applications/audacity.desktop"

  cd "${srcdir}/audacity"
  DESTDIR="${pkgdir}" cmake --install build

  # Install script wrapper
  install -Dm755 "$srcdir/audacity-openvino" "${pkgdir}/usr/bin/audacity-openvino"
  # Replace native .desktop
  if [ -f "$shortcut" ]; then
  	rm -f "$shortcut"
  fi
  install -Dm644 "$srcdir/audacity-openvino.desktop" "$shortcut"
}
