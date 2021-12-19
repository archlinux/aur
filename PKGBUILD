pkgbase=gnuradio38
pkgname=(gnuradio38 gnuradio38-companion)
pkgver=v3.8.4.0.r27.g1d110e076
pkgrel=2
pkgdesc="General purpose DSP and SDR toolkit. 3.8 branch."
arch=('x86_64')
url="https://gnuradio.org"
license=('GPL')
depends=(
python-numpy
gsl
blas
libuhd
libvolk
log4cpp
python-yaml
gmp
gsm
codec2-git
python-mako
python-click-plugins
)
makedepends=(
alsa-lib
boost
cmake
fftw
glu
gtk3
jack
pango
portaudio
python-gobject
python-lxml
python-pyqt5
python-cairo
qwt
swig
zeromq
)

source=(
  "git+https://github.com/gnuradio/gnuradio.git#branch=maint-3.8"
  gnuradio-bind-placeholders.patch
  21-fcd.rules
)
sha256sums=('SKIP'
            'dc3171060b778245716229fe5ee9dd9162df1699ae6aed653a7e2d5f92418920'
            '928f4e4b5d8d9fab634e119b83ba9db9fb3501b4d5527cceb7bfa595818be81a')
pkgver() {
  cd gnuradio
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd gnuradio
  patch -Np1 -i ../gnuradio-bind-placeholders.patch
  sed -i -e "s|GR_PKG_LIBEXEC_DIR|GR_RUNTIME_DIR|" grc/scripts/freedesktop/CMakeLists.txt
  sed "s|6.2.0|6.4.0|g" -i cmake/Modules/FindQwt.cmake
  sed -i -e "s| sphinx-build$| sphinx-build2|" cmake/Modules/FindSphinx.cmake
}

build() {
  export PYTHON=python3
  cd gnuradio
  cmake \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D PYTHON_EXECUTABLE=$(which python3) \
    -D ENABLE_INTERNAL_VOLK=OFF \
    -D ENABLE_GRC=ON \
    -D ENABLE_GR_QTGUI=ON \
    -D QWT_LIBRARIES=/usr/lib/libqwt.so \
    -W no-dev \
    -B build \
    -G Ninja \
    -S .
  cmake --build build
}

package_gnuradio38() {
  depends+=(
    'libasound.so'
    'libboost_filesystem.so'
    'libboost_program_options.so'
    'libboost_thread.so'
    'libfftw3f.so'
    'libfftw3f_threads.so'
    'libjack.so'
    'libportaudio.so'
    'libzmq.so'
    )
  optdepends=('boost: gr_modtool'
              'swig: gr_modtool'
              'cmake: gr_modtool'
              'pkgconfig: libuhd')
  provides=(
    'gnuradio'
    'libgnuradio-zeromq.so'
    'libgnuradio-wavelet.so'
    'libgnuradio-vocoder.so'
    'libgnuradio-uhd.so'
    'libgnuradio-trellis.so'
    'libgnuradio-runtime.so'
    'libgnuradio-qtgui.so'
    'libgnuradio-pmt.so'
    'libgnuradio-filter.so'
    'libgnuradio-fft.so'
    'libgnuradio-fec.so'
    'libgnuradio-dtv.so'
    'libgnuradio-digital.so'
    'libgnuradio-channels.so'
    'libgnuradio-blocks.so'
    'libgnuradio-audio.so'
    'libgnuradio-analog.so'
  )
  confilcts=(gnuradio)

  cd gnuradio
  DESTDIR="${pkgdir}" cmake --install build
  install -vDm 644 ../21-fcd.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
  install -vDm 644 grc/scripts/freedesktop/gnuradio-grc.desktop -t "${pkgdir}/usr/share/applications/"
}

package_gnuradio38-companion() {
  pkgdesc="GUI frontend for gnuradio and SDR."
  depends=(
    'gnuradio'
    'qwt'
    'python-lxml'
    'python-opengl'
    'python-cairo'
    'python-gobject'
    'python-pyqt5'
  )
  provides=(gnuradio-companion)
  conflicts=(gnuradio-companion)
  # Yup, nothing in the package except dependencies,
  # because more than five optdeps is too many for most people.
}

# options for armv6:
# -Dhave_mfpu_neon=0 \
# -DCMAKE_CXX_FLAGS:STRING="-march=armv6 -mfpu=vfp -mfloat-abi=hard" \
# -DCMAKE_C_FLAGS:STRING="-march=armv6 -mfpu=vfp -mfloat-abi=hard" \

# options for armv7:
# -DCMAKE_CXX_FLAGS:STRING="-march=armv7-a -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard"
# -DCMAKE_C_FLAGS:STRING="-march=armv7-a -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard"
# line 341 add /usr/lib/arm-linux-gnueabihf /usr/lib/arm-linux-gnueabi
