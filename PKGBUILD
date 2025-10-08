# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Radoslaw Chmielarz <radoslaw.chmielarz@gmail.com> (https://aur.archlinux.org/account/rchmielarz)

_pkgname=gnss-sdr
pkgname="${_pkgname}-git"
pkgver=0.0.20+279.r10134.20251003.5fd5851fa
pkgrel=1
pkgdesc="GNSS (Global Navigation Satellite System) software receiver"
arch=(
  "i686"
  "x86_64"
)
url="http://gnss-sdr.org"
license=('GPL-3.0-or-later')
depends=(
  'abseil-cpp'
  'armadillo'
  'boost-libs'
  'gcc-libs'
  'glibc'
  'gmp'
  # 'gnuplot'
  'gnuradio'
  'gnutls'
  'gr-limesdr'
  'libad9361'
  'libfmt.so'
  # 'libgnuradio-analog.so'
  # 'libgnuradio-blocks.so'
  # 'libgnuradio-fft.so'
  # 'libgnuradio-filter.so'
  # 'libgnuradio-iio.so'
  'libgnuradio-osmosdr.so'  # Provided by gnurario-osmosdr
  # 'libgnuradio-pmt.so'
  # 'libgnuradio-runtime.so'
  # 'libgnuradio-uhd.so'
  # 'libgnuradio-zeromq.so'
  'libiio.so'
  'libmatio'
  # 'liborc-0.4.so'
  'libpcap.so'
  # 'libprotobuf.so'
  'libspdlog.so'
  'libuhd.so'
  'libvolk.so'
  'openblas'
  'opencl-icd-loader'
  'protobuf'
  'pugixml'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'gnsstk'
  'gnuradio'
  'gnuradio-osmosdr'
  'gnutls'
  'google-glog'
  #'gnssstk'
  'gtest'
  # 'libcpufeatures' # Conflicts with 'libvolk', so corresponding build option is switched off.
  'gzip'
  'libgnuradio-analog.so'
  'libgnuradio-blocks.so'
  'libgnuradio-fft.so'
  'libgnuradio-filter.so'
  'libgnuradio-iio.so'
  'libgnuradio-pmt.so'
  'libgnuradio-uhd.so'
  'libgnuradio-zeromq.so'
  'libiio'
  'libpcap'
  'libuhd'
  'libvolk'
  'log4cpp'
  'make'
  'mathjax2'
  'orc>0.4.22' 'orc<0.5'
  'pkgconf'
  'protobuf'
  'python>=2.7' # python3 is also ok.
  'python-mako>=0.4.2'
  'python-six'
  'pugixml'
  'zeromq'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+https://github.com/gnss-sdr/gnss-sdr.git#branch=next"
  # "gnss-metadata-standard::git+https://github.com/IonMetadataWorkingGroup/GNSS-Metadata-Standard" # Will be cloned from upstream by `cmake` anyway.
)
sha256sums=(
  'SKIP'
  # 'SKIP'
)
#options+=('!lto')
if `which ccache > /dev/null 2>&1`; then
  options+=('ccache')
fi

prepare() {
  cd "${srcdir}"
  if [ -d build ]; then
    rm -Rf build
  fi

  mkdir -p build

  cd "${srcdir}/${_pkgname}"

  git log > git.log

  cd "${srcdir}"

  _CFLAGSADDITIONS="-Wno-error=maybe-uninitialized -Wno-error=format-security" # Switch off treating compiler warnings as errors.
  _CFLAGSADDITIONS+=" -Wno-maybe-uninitialized -Wno-format-security" # Silence some compiler warnings.
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  # Moved `cmake` call here, since it downloads stuff (`Cloning into 'gnss-metadata-standard'...`).
  _cmake_config_opts=(
    -DBoost_USE_STATIC_LIBS=OFF
    -DENABLE_AD9361=OFF      # requires 'libiio' # The dependency target "gnsstk-14.3.0" of target "obsdiff" does not exist. # The dependency target "gnsstk-14.3.0" of target "rinex2assist" does not exist.
    -DENABLE_AD936X_SDR=ON   # requires 'libiio'
    -DENABLE_ARRAY=OFF       # gr-dbfcttc required for building gnss-sdr with this option enabled
    -DENABLE_BENCHMARKS=OFF
    -DENABLE_CPUFEATURES=OFF # Needs 'libcpufeatures' which conflicts with 'libvolk'.
    -DENABLE_CUDA=OFF        # CUDA libs is big bloat and not useful on systems without NVIDIA GPU.
    -DENABLE_DMA_PROXY=OFF   # requires the DMA Proxy driver
    -DENABLE_EXTERNAL_MATHJAX=OFF # Use MathJax from an external CDN in HTML docs
    -DENABLE_FLEXIBAND=OFF  # Teleorbit Flexiband GNU Radio driver required to build gnss-sdr with the optional FLEXIBAND adapter
    -DENABLE_FMCOMMS2=ON    # requires 'gr-iio'
    -DENABLE_FPGA=OFF       # The dependency target "gnsstk-14.3.0" of target "obsdiff" does not exist. # The dependency target "gnsstk-14.3.0" of target "rinex2assist" does not exist.
    -DENABLE_GNSS_SIM_INSTALL=ON
    -DENABLE_GNUTLS=ON
    -DENABLE_ION=ON
    -DENABLE_LIMESDR=ON
    -DENABLE_LOG=ON
    -DENABLE_MAX2771=OFF    # requires the 'spidev' driver. # ENABLE_MAX2771 can only be set when ENABLE_FPGA is also set.
    -DENABLE_OPENCL=ON
    -DENABLE_ORC=ON
    -DENABLE_OSMOSDR=ON
    -DENABLE_OWN_ABSEIL=OFF
    -DENABLE_OWN_ARMADILLO=OFF
    -DENABLE_OWN_GLOG=OFF
    -DENABLE_OWN_GNSSTK=OFF
    -DENABLE_OWN_GPSTK=OFF
    -DENABLE_PACKAGING=OFF
    -DENABLE_PLUTOSDR=ON   # requires 'gr-iio'
    -DENABLE_PROFILING=OFF
    -DENABLE_RAW_UDP=ON    # requires 'libpcap'
    -DENABLE_UHD=ON
    -DENABLE_ZMQ=ON        # requires 'gr-zeromq'
    -Wno-dev
    #--log-context
    #--debug-find
    #--debug-output
    #--trace
    #--trace-expand
  )

  cmake -S "${_pkgname}" -B build \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STRIP=ON \
    -DENABLE_SYSTEM_TESTING=OFF \
    -DENABLE_SYSTEM_TESTING_EXTRA=OFF \
    -DENABLE_UNIT_TESTING=OFF \
    -DENABLE_UNIT_TESTING_EXTRA=OFF \
    -DENABLE_UNIT_TESTING_MINIMAL=OFF \
    -DENABLE_INSTALL_TESTS=OFF \
    "${_cmake_config_opts[@]}"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}


build() {
  cd "${srcdir}"

  make -C build
}
package() {
  cd "${srcdir}"

  make -C build DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgname}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"  git.log README.md CONTRIBUTING.md CODE_OF_CONDUCT.md CITATION.cff AUTHORS

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
