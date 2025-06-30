# Maintainer: Hartmut Seichter <hartmut@technotecture.com>
# based on vrpn-git: David Runge <dave@sleepmap.de>

pkgname=vrpn
pkgver=7.36
pkgrel=1
_pkg=${pkgname}

pkgdesc='Virtual Reality Peripheral Network library and tools'
arch=('x86_64')
url="https://vrpn.github.io/"
license=('Boost')
depends=('gpm' 'hidapi' 'libusb')
provides=("vrpn")
conflicts=("vrpn-git")
makedepends=('cmake')

# tag source
source=("https://github.com/vrpn/vrpn/archive/refs/tags/v0${pkgver}.zip")

sha512sums=('b3531e30b18baff9429685de0df2ebefdd3831e42a3a904be9757e20ca3e92f5a2e0169f9f2ee68f9c75f91102baac5d23d1f350c6733b103b53a69009f05692')

build(){
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"

  # vrpn requires an out-of-source build
  # cd "${srcdir}/vrpn"
  # mkdir -p build && cd build

  #
  # Configure
  #
  cmake -B build \
    -S "${_pkg}-0${pkgver}/" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.12 \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE='None' \
    -DBUILD_TESTING=OFF \
    -DVRPN_BUILD_CLIENTS=ON \
    -DVRPN_BUILD_CLIENT_LIBRARY=ON \
    -DVRPN_BUILD_EXTRA_COMPILER_WARNINGS=ON \
    -DVRPN_BUILD_HID_GUI=OFF \
    -DVRPN_BUILD_JAVA=OFF \
    -DVRPN_BUILD_PROFILING_SUPPORT=OFF \
    -DVRPN_BUILD_PYTHON=OFF \
    -DVRPN_BUILD_PYTHON_HANDCODED_2X=OFF \
    -DVRPN_BUILD_PYTHON_HANDCODED_3X=OFF \
    -DVRPN_BUILD_SERVERS=ON \
    -DVRPN_BUILD_SERVER_LIBRARY=ON \
    -DVRPN_BUILD_TEST_RPC_GENERATION=OFF \
    -DVRPN_GPL_SERVER=ON \
    -DVRPN_HIDAPI_USE_LIBUSB=ON \
    -DVRPN_HID_DEBUGGING=OFF \
    -DVRPN_INCLUDE_INTERSENSE=OFF \
    -DVRPN_INCLUDE_PHASESPACE=OFF \
    -DVRPN_USE_DEV_INPUT=ON \
    -DVRPN_USE_FREESPACE=OFF \
    -DVRPN_USE_GHOST=OFF \
    -DVRPN_USE_GPM_MOUSE=OFF \
    -DVRPN_USE_HDAPI=OFF \
    -DVRPN_USE_HID=ON \
    -DVRPN_USE_JOYLIN=ON \
    -DVRPN_USE_JSONNET=OFF \
    -DVRPN_USE_LIBNIFALCON=OFF \
    -DVRPN_USE_LIBUSB_1_0=ON \
    -DVRPN_USE_LOCAL_HIDAPI=OFF \
    -DVRPN_USE_LOCAL_JSONCPP=OFF \
    -DVRPN_USE_MICROSCRIBE=OFF \
    -DVRPN_USE_MOTIONNODE=OFF \
    -DVRPN_USE_MPI=OFF \
    -DVRPN_USE_NATIONAL_INSTRUMENTS=OFF \
    -DVRPN_USE_NATIONAL_INSTRUMENTS_MX=OFF \
    -DVRPN_USE_NIDAQ=OFF \
    -DVRPN_USE_PHANTOM_SERVER=OFF \
    -DVRPN_USE_TRIVISIOCOLIBRI=OFF \
    -DVRPN_USE_USDIGITAL=OFF \
    -DVRPN_USE_VIEWPOINT=OFF \
    -DVRPN_USE_WIIUSE=OFF

#    -DOVR_ROOT_DIR=/usr/include/ovr-$(pkg-config --modversion libovr)/ \
#    -DVRPN_USE_OVR=OFF \

#
# Build
#

    make -C build

}

package() {

  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  # configuration
  mv "${pkgdir}/usr/etc" "${pkgdir}"

  # configuration example
  install -Dm0644 "${pkgdir}/usr/share/${_pkg}-0${pkgver}/${_pkg}.cfg.sample" \
  "${pkgdir}/usr/share/doc/${pkgname}/${_pkg}.cfg.sample"
}
