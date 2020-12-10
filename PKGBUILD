# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations."
    url='https://github.com/googlecartographer/cartographer'

    pkgname='ros-melodic-cartographer'
    pkgver='1.0.0'
    arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
    pkgrel=5
    license=('Apache 2.0')

    ros_makedepends=(ros-melodic-catkin)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    boost1.69
  google-glog
  protobuf
  cairo
  lua52
  python-sphinx
  gcc
  gflags
  eigen
  ceres-solver-legacy
  gmock)

    ros_depends=()
    depends=(${ros_depends[@]}
    boost1.69
  google-glog
  protobuf
  cairo
  lua52
  gflags
  eigen
  ceres-solver-legacy)
    
    # Tarball version (faster download)
    _dir="cartographer-release-release-melodic-cartographer"
    source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/cartographer-release/archive/release/melodic/cartographer/${pkgver}.tar.gz" FindGMock.patch)
sha256sums=('0b1979462b1715efc762f27bfb1b69fe659c269df96934baee12928b47b7cc9f'
            'a109c0927cff5d0a9d8ad7d0f676ce0c3af81a1aa39b88b16a030431cde2cbb4')

    prepare() {
      cd "$srcdir/$_dir"
      patch --forward --strip=1 --input="${srcdir}/FindGMock.patch"
    }

    build() {
        # Use ROS environment variables
        source /usr/share/ros-build-tools/clear-ros-env.sh
        [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

        # Create build directory
        [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
        cd ${srcdir}/build

        # Fix Python2/Python3 conflicts
        /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}
	
	rm -f ${srcdir}/${_dir}/cartographer/mapping/3d/hybrid_grid_test.cc

        # Build project
        cmake ${srcdir}/${_dir} \
                -DCMAKE_BUILD_TYPE=Release \
		-DCATKIN_ENABLE_TESTING=0 \
                -DCATKIN_BUILD_BINARY_PACKAGE=ON \
                -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
                -DPYTHON_EXECUTABLE=/usr/bin/python3 \
                -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
                -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
                -DPYTHON_BASENAME=.cpython-37m \
                -DSETUPTOOLS_DEB_LAYOUT=OFF \
	   -DBOOST_ROOT=/opt/boost1.69
    make
    }

    package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    }
    
