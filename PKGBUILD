# Maintainer: Kevin McCormack <harlemsquirrel@gmail.com>
# https://gitlab.com/lulzbot3d/cura-le/curabuild-lulzbot/
pkgname=cura-lulzbot-git
pkgver=v3.6.21.1.g711e5d9
pkgrel=1
pkgdesc='Cura LulzBot Edition for LulzBot 3D Printers by Aleph Objects, Inc.'
arch=('x86_64')
url='https://www.lulzbot.com/cura'
license=('AGPL3')
source=('git+https://gitlab.com/lulzbot3d/cura-le/curabuild-lulzbot.git')
md5sums=('SKIP')
conflicts=("cura-lulzbot")
depends=('cython'
         'gcc-fortran'
         'libsavitar'
         'openblas'
         'python'
         'python-nose'
         'python-numpy'
         'python-numpy-stl'
         'python-opengl'
         'python-parso'
         'python-pyqt5'
         'python-scipy'
         'python-setuptools'
         'python-typing_extensions'
         'qt5-graphicaleffects'
         'qt5-quickcontrols'
         'qt5-quickcontrols2')
makedepends=('cmake'
             'git'
             'python-sip'
             'python-netifaces'
             'python-pyserial'
             'python-zeroconf'
             'qt5-tools'
             'sip')
optdepends=('python-zeroconf: Detecting mDNS printers'
            'python-pyserial: USB printing')

pkgver() {
  cd curabuild-lulzbot
  git describe --tags | sed 's/-/./g'
}

build() {
  # Until this is updated, we have to replace the old paths
  grep -rl 'code.alephobjects.com/source/arcus' . | xargs \
    sed -i 's/code.alephobjects.com\/source\/arcus/gitlab.com\/lulzbot3d\/cura-le\/libarcus/g'
  grep -rl 'code.alephobjects.com/diffusion/U/uranium' . | xargs \
    sed -i 's/code.alephobjects.com\/diffusion\/U\/uranium/gitlab.com\/lulzbot3d\/cura-le\/uranium/g'
  grep -rl 'code.alephobjects.com/diffusion/CBD/cura-binary-data' . | xargs \
    sed -i 's/code.alephobjects.com\/diffusion\/CBD\/cura-binary-data/gitlab.com\/lulzbot3d\/cura-le\/cura-binary-data/g'
  grep -rl 'code.alephobjects.com/source/curaengine-lulzbot' . | xargs \
    sed -i 's/code.alephobjects.com\/source\/curaengine-lulzbot/gitlab.com\/lulzbot3d\/cura-le\/cura-engine-le/g'
  grep -rl 'code.alephobjects.com/source' . | xargs \
    sed -i 's/code.alephobjects.com\/source/gitlab.com\/lulzbot3d\/cura-le/g'

  mkdir -p curabuild-lulzbot/build
  cd curabuild-lulzbot/build
  sed -i 's/DCURA_ENGINE_VERSION=${CURA_VERSION}/DCURA_ENGINE_VERSION=${CURA_VERSION} -DENABLE_OPENMP=OFF/' ../CMakeLists.txt
  sed -i '33,34d' ../setup_linux.py.in #remove missing paths from using system python
  sed -i '57,58d' ../setup_linux.py.in #remove missing qt plugins when using system version
  sed -i 's/get_commit_hash("Savitar", cmake_binary_dir)/"4.1.0"/' ../scripts/cura_version.py #fake hash when using system libsavitar

  sed -i 's/6a4ffb2f90ef7bbd3f20f2a1db4948630ad37dc8/v3.11.0/' ../CMakeLists.txt # Protobuf v3.7.0

  sed -i '1216,1233d' ../CMakeLists.txt # Remove external cx_Freeze build

  cmake -DTAG_OR_BRANCH=master ../ \
        -DBUILD_PYTHON=OFF \
        -DBUILD_CYTHON=OFF \
        -DBUILD_QT=OFF \
        -DBUILD_SIP=OFF \
        -DBUILD_PYQT=OFF \
        -DBUILD_OPENBLAS=OFF \
        -DBUILD_NUMPY=OFF \
        -DBUILD_SCIPY=OFF \
        -DBUILD_SCIPY_LITE=OFF \
        -DBUILD_PYSERIAL=OFF \
        -DBUILD_NUMPY_STL=OFF \
        -DBUILD_ZEROCONF=OFF \
        -DBUILD_TYPING=OFF \
        -DBUILD_SAVITAR=OFF \
        -DBUILD_APPDIRS=OFF \
        -DBUILD_NETIFACES=OFF \
        -DBUILD_PYTHONSIX=OFF \
        -DBUILD_PYTHON_SETUPTOOLS=OFF \
        -DBUILD_PYTHON_PACKAGING=OFF \
        -DBUILD_PYPARSING=OFF \
        -DBUILD_PYTHON_NOSE=OFF \
        -DEXTERNALPROJECT_INSTALL_PREFIX=$pkgdir/usr \
        -DUSE_SYSTEM_LIBS=ON

  PYTHONPATH=`pwd`/inst/lib/python3/dist-packages make
}

package() {
  cd $srcdir/curabuild-lulzbot/build

  # We have to remove this since it's gone from Python 3.8
  # https://docs.python.org/3.7/library/platform.html#unix-platforms
  echo "pwd: $(pwd)"
  grep -rl 'linux_distro_name = platform.linux_distribution' . | xargs \
    sed -i 's/linux_distro_name/#linux_distro_name/g'

  PYTHONPATH=`pwd`/inst/lib/python3/dist-packages make package

  cp -r _CPack_Packages/Linux/DEB/cura-lulzbot-*-Linux/usr $pkgdir/
}

# Update md5sum
# updpkgsums

## Update .SRCINFO
# makepkg --printsrcinfo | tee .SRCINFO
