# Maintainer: selebray1998
# Contributor: Felipe Facundes
# Changelog: CHANGELOG

pkgname=audacity-openvino
pkgver=3.7.7
pkgrel=3
epoch=2

# Auto-track latest 3.7.x release tag; override with explicit pkgver if needed
_audacity_tag_prefix=Audacity-3.7
pkgdesc="Audacity - Digital audio editor with AI support via openvino (mod-openvino)"
arch=(x86_64)
url="https://audacityteam.org"
license=(GPL-3.0-or-later)
depends=(
  libtorch whisper.cpp-openvino
  alsa-lib expat flac gcc-libs glibc gtk3
  jack lame libid3tag libmad libogg libsbsms libsndfile libsoxr
  libvorbis lilv mpg123 opusfile portaudio portmidi portsmf
  vamp-plugin-sdk wavpack openvino-models
  python soundtouch sqlite suil twolame util-linux-libs wxwidgets-gtk3
)
optdepends=(
  'intel-compute-runtime: Intel GPU acceleration for OpenVINO'
  'level-zero-loader: Level Zero GPU API support'
  'libtorch-cuda: CUDA GPU tensor operations (replaces libtorch)'
  'libtorch-rocm: ROCM GPU tensor operations (replaces libtorch)'
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
  git cmake chrpath ffmpeg rapidjson wxwidgets-gtk3 vst3sdk opencl-clhpp
)
source=(
   "git+https://github.com/audacity/audacity.git"
   "git+https://github.com/intel/openvino-plugins-ai-audacity.git#tag=v3.7.1-R4.2"
   "audacity-openvino"
   "audacity-openvino.desktop"
   "CHANGELOG"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
  cd "${srcdir}/audacity"
  local tag
  tag=$(git tag -l "${_audacity_tag_prefix}.*" --sort=-v:refname | head -1)
  if [ -n "$tag" ]; then
    echo "${tag#Audacity-}"
  else
    echo "${pkgver}"
  fi
}

prepare() {
  cd "${srcdir}/audacity"

   # Checkout the latest matching tag
   local latest_tag
   latest_tag=$(git tag -l "${_audacity_tag_prefix}.*" --sort=-v:refname | head -1 || true)
    if [ -n "$latest_tag" ]; then
      git -c advice.detachedHead=false checkout "$latest_tag"
   else
     echo "==> WARNING: no tag matching ${_audacity_tag_prefix}.* found, using HEAD"
   fi

  rm -rf modules/openvino-plugins-ai-audacity
  cp -r "${srcdir}/openvino-plugins-ai-audacity" modules/openvino-plugins-ai-audacity

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

  if ! grep -q "openvino-plugins-ai-audacity" modules/CMakeLists.txt; then
    sed -i '/foreach( FOLDER ${FOLDERS} )/i add_subdirectory("openvino-plugins-ai-audacity")' modules/CMakeLists.txt
  fi

  # whisper.cpp 1.8.3 removed speed_up from whisper_full_params
  sed -i '/wparams\.speed_up = params\.speed_up;/d' modules/openvino-plugins-ai-audacity/mod-openvino/OVWhisperTranscription.cpp
  sed -i '/bool speed_up = false;/d' modules/openvino-plugins-ai-audacity/mod-openvino/OVWhisperTranscription.cpp

  # Newer OpenVINO API: data<T>() returns const T* for const tensors
  sed -i 's/float\* pXTensor = x_tensor\.data<float>()/const float* pXTensor = x_tensor.data<float>()/g' modules/openvino-plugins-ai-audacity/mod-openvino/htdemucs.cpp
  sed -i 's/float\* pXTTensor = xt_tensor\.data<float>()/const float* pXTTensor = xt_tensor.data<float>()/g' modules/openvino-plugins-ai-audacity/mod-openvino/htdemucs.cpp
  sed -i 's/float\* pXTensor_Out = x_out_tensor\.data<float>()/const float* pXTensor_Out = x_out_tensor.data<float>()/g' modules/openvino-plugins-ai-audacity/mod-openvino/htdemucs.cpp
  sed -i 's/float\* pXTTensor_Out = xt_out_tensor\.data<float>()/const float* pXTTensor_Out = xt_out_tensor.data<float>()/g' modules/openvino-plugins-ai-audacity/mod-openvino/htdemucs.cpp
  # std::memcpy destination needs non-const void*; data_ptr() returns void* for writes
  sed -i 's/std::memcpy(pXTensor, x\.data_ptr()/std::memcpy(const_cast<float*>(pXTensor), x.data_ptr()/g' modules/openvino-plugins-ai-audacity/mod-openvino/htdemucs.cpp
  sed -i 's/std::memcpy(pXTTensor, xt\.data_ptr()/std::memcpy(const_cast<float*>(pXTTensor), xt.data_ptr()/g' modules/openvino-plugins-ai-audacity/mod-openvino/htdemucs.cpp
  # torch::from_blob takes void*, not const void*
  sed -i 's/torch::from_blob(pXTensor_Out,/torch::from_blob(const_cast<float*>(pXTensor_Out),/g' modules/openvino-plugins-ai-audacity/mod-openvino/htdemucs.cpp
  sed -i 's/torch::from_blob(pXTTensor_Out,/torch::from_blob(const_cast<float*>(pXTTensor_Out),/g' modules/openvino-plugins-ai-audacity/mod-openvino/htdemucs.cpp

  # std::not1 was removed in C++20; replace with std::not_fn
  sed -i 's/std::not1( std::mem_fn( pmf ) )/std::not_fn( std::mem_fn( pmf ) )/g' libraries/lib-track/Track.h
}

build() {
    cd "${srcdir}/audacity"

    # Use CUDA libtorch if available, fall back to CPU
    if [ -d "/opt/libtorch-cuda" ]; then
      export LIBTORCH_ROOTDIR="/opt/libtorch-cuda/"
    elif [ -d "/opt/libtorch" ]; then
      export LIBTORCH_ROOTDIR="/opt/libtorch/"
    else
      export LIBTORCH_ROOTDIR="/opt/libtorch-cpu/"
    fi

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
      -D CMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -Wno-deprecated-declarations"
      -D CMAKE_RULE_MESSAGES=OFF
      --log-level=ERROR
    )

    export CFLAGS+=" -DNDEBUG -std=gnu11"
    export CXXFLAGS+=" -DNDEBUG"
    export VST3SDK="/usr/src/vst3sdk"

    cmake "${cmake_options[@]}"
    cmake --build build -- -j$(nproc)
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
  # Install changelog
  install -Dm644 "$srcdir/CHANGELOG" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
}
