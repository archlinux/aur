# Maintainer: David Runge <dave@sleepmap.de>

pkgname=vrpn-git
_pkg=vrpn
pkgver=07.30.1311.gafe0eae8
pkgrel=2
pkgdesc='The Virtual Reality Peripheral Network lib and tools'
arch=('i686' 'x86_64')
url="http://www.cs.unc.edu/Research/vrpn"
license=('Boost')
depends=('gpm' 'libusbx' 'hidapi')
conflicts=("vrpn")
provides=("vrpn")
makedepends=('cmake' 'git')
source=("git+https://github.com/vrpn/vrpn.git"
        "git+https://github.com/vrpn/hidapi.git"
        "git+https://github.com/vrpn/jsoncpp.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd ${_pkg}
  git describe --always | sed -e 's|^v||g' -e 's|-|.|g'
}

prepare() {
  cd "${_pkg}"
  git submodule init
  git config submodule.submodules/hidapi.url "${srcdir}/hidapi"
  git config submodule.submodules/hidapi.branch "${_pkg}-utilized-head"
  git config submodule.submodules/jsoncpp.url "${srcdir}/jsoncpp"
  git submodule update

  cd server_src
  # Fixing vrpn.cfg path finding"
  sed -i 's|"vrpn.cfg"|"/etc/vrpn.cfg"|' \
    aureal_sound_server/vrpn_Sound_A3D.cpp \
    ausim_sound_server/vrpn_Sound_ASM.cpp \
    directx_sound_server/vrpn_Sound_DX9.cpp \
    miles_sound_server/v5.0/sound_server.cpp \
    miles_sound_server/v6.0/sound_server.cpp \
    vrpn.C \
    vrpn_Generic_server_object.h
  # Fixing -f option help text
  sed -i 's|default vrpn.cfg|default /etc/vrpn.cfg|' vrpn.C
}

build(){
  cd ${_pkg}

  # vrpn requires an out-of-source build
  mkdir build-dir
  cd build-dir

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_BUILD_TYPE=Release \
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
    -DVRPN_USE_GPM_MOUSE=ON \
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
    -DVRPN_USE_WIIUSE=OFF \
    -DOVR_ROOT_DIR=/usr/include/ovr-$(pkg-config --modversion libovr)/ \
    -DVRPN_USE_OVR=ON \
    ..
  make
}

package() {
  cd "${_pkg}/build-dir"
  make DESTDIR="${pkgdir}" install

  # configuration
  mv "${pkgdir}/usr/etc" "${pkgdir}"

  # configuration example
  install -Dm0644 "${pkgdir}/usr/share/${_pkg}-07.34/${_pkg}.cfg.sample" \
  "${pkgdir}/usr/share/doc/${pkgname}/${_pkg}.cfg.sample"
}
