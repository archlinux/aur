# Maintainer: Luigi Pertoldi <gipert@pm.me>
pkgname='geant4-debug'
_pkgname='geant4'
pkgver=11.0.3
_pkgver=v11.0.3
pkgrel=2
pkgdesc="A simulation toolkit for particle physics interactions (compiled with debugging info)."
depends=('cmake>=3.16'
         'xerces-c>=3'
         'qt5-base'
         'glu'
         'openmotif'
         'soqt'
         'zlib'
         'python>=3'
         'boost'
        )
conflicts=('geant4')
optdepends=('java-environment: for histogram visualizations and
analysis'
  'tcsh: for C Shell support'
  'python: for G4Python support'
  'geant4-abladata: Data files for nuclear shell effects in INCL/ABLA hadronic mode'
  'geant4-ensdfstatedata: Nuclei properties from the Evaluated Nuclear Structure Data Files'
  'geant4-incldata: Data files for proton and neutron density profiles'
  'geant4-ledata: Data files for low energy electromagnetic processes'
  'geant4-levelgammadata: Data files for photon evaporation'
  'geant4-neutronhpdata: Neutron data files with thermal cross sections'
  'geant4-particlexsdata: Data files for evaluated p, d, t, He3, He4 and gamma cross sections, replaces geant4-neutronxsdata'
  'geant4-piidata: Data files for shell ionisation cross sections'
  'geant4-radioactivedata: Data files for radioactive decay hadronic processes'
  'geant4-realsurfacedata: Data files for measured optical surface reflectance'
  'geant4-saiddata: Data files from evaluated cross-sections in SAID data-base'
)
url="http://geant4.cern.ch/"
arch=('x86_64')
license=('custom: http://geant4.cern.ch/license/')
options=('!emptydirs' '!strip')
install="${_pkgname}.install"
source=("http://geant4-data.web.cern.ch/releases/${_pkgname}-${_pkgver}.tar.gz"
        "${_pkgname}.install")


md5sums=('caf371e8b07a7ea3ef3b4719bf0fc5f0'
         'a6abacd078760aebda58316454d7e0c9')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

build() {

  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  env -i \
      QT_SELECT=5 \
      PATH=/usr/bin \
      cmake \
      -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DGEANT4_BUILD_MULTITHREADED=ON \
      -DGEANT4_USE_PYTHON=ON \
      -DGEANT4_USE_G3TOG4=ON \
      -DGEANT4_USE_GDML=ON \
      -DGEANT4_USE_INVENTOR_QT=ON \
      -DGEANT4_USE_QT=ON \
      -DGEANT4_USE_OPENGL_X11=ON \
      -DGEANT4_USE_RAYTRACER_X11=ON \
      -DGEANT4_USE_XM=ON \
      -DGEANT4_USE_TOOLSSG=QT \
      -DGEANT4_USE_SYSTEM_ZLIB=ON \
      -DGEANT4_BUILD_TLS_MODEL=global-dynamic \
      -DGEANT4_INSTALL_PACKAGE_CACHE=OFF \
      ../${_pkgname}-${_pkgver}

  G4VERBOSE=1 make

}

package() {
  # normally the geant4.[c]sh is meant to configure the
  # LD_LIBRARY_PATH, PATH and the "G4DATASETS". Let's not source that
  # script since
  #
  # - LD_LIBRARY_PATH can be set using ldconf
  # - PATH is not really needed
  # - the "G4DATASETS" are not installed by default in this package

  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install

  ##
  ## This is not needed as ldconfig automatically includes /usr/lib
  ##
  # use a file that pacman can track instead of adding directly to ld.so.conf
  # install -d "${pkgdir}/etc/ld.so.conf.d"
  # echo '/usr/lib' > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}

# All this is just a comment
echo ""
: <<'EOF'

 From: https://geant4-userdoc.web.cern.ch/UsersGuides/InstallationGuide/html/installguide.html#geant4-build-options
 Last revisited: Dec 15, 2021. (11.0)

 |----------------------------------+------------------------------------------------------+----------------|
 | option                           | default                                              | set to         |
 |----------------------------------+------------------------------------------------------+----------------|
 | CMAKE_INSTALL_PREFIX             | /usr/local                                           | /usr           |
 | CMAKE_BUILD_TYPE                 | Release                                              |                |
 | GEANT4_BUILD_MULTITHREADED       | ON                                                   |                |
 | GEANT4_INSTALL_DATA              | OFF                                                  |                |
 | GEANT4_INSTALL_DATADIR           | CMAKE_INSTALL_DATAROOTDIR                            |                |
 | GEANT4_USE_G3TOG4                | OFF                                                  | ON             |
 | GEANT4_USE_GDML                  | OFF                                                  | ON             |
 | GEANT4_USE_INVENTOR              | OFF                                                  |                |
 | GEANT4_USE_INVENTOR_QT           | OFF                                                  | ON             |
 | GEANT4_USE_OPENGL_WIN32          | OFF, Windows Only                                    |                |
 | GEANT4_USE_OPENGL_X11            | OFF, Unix Only                                       | ON             |
 | GEANT4_USE_PYTHON                | OFF                                                  | ON             |
 | GEANT4_USE_QT                    | OFF                                                  | ON             |
 | GEANT4_USE_RAYTRACER_X11         | OFF, Unix only                                       | ON             |
 | GEANT4_USE_SYSTEM_CLHEP          | OFF                                                  |                |
 | GEANT4_USE_SYSTEM_EXPAT          | ON                                                   |                |
 | GEANT4_USE_SYSTEM_ZLIB           | OFF                                                  | ON             |
 | GEANT4_USE_TOOLSSG               | OFF                                                  | QT             |
 | GEANT4_USE_XM                    | OFF, Unix Only                                       | ON             |
 |----------------------------------+------------------------------------------------------+----------------|
 | BUILD_SHARED_LIBS                | ON                                                   |                |
 | BUILD_STATIC_LIBS                | OFF                                                  |                |
 | CMAKE_CXX_STANDARD               | 17                                                   |                |
 | CMAKE_INSTALL_BINDIR             | bin                                                  |                |
 | CMAKE_INSTALL_INCLUDEDIR         | include                                              |                |
 | CMAKE_INSTALL_LIBDIR             | lib(+?SUFFIX)                                        |                |
 | CMAKE_INSTALL_PYTHONDIR          | CMAKE_INSTALL_LIBDIR/python3.<PYMINOR>/site-packages |                |
 | CMAKE_INSTALL_DATAROOTDIR        | share                                                |                |
 | GEANT4_INSTALL_DATA_TIMEOUT      | 1500                                                 |                |
 | GEANT4_INSTALL_EXAMPLES          | ON                                                   |                |
 | GEANT4_INSTALL_PACKAGE_CACHE     | ON                                                   | OFF            |
 | GEANT4_INSTALL_DATASETS_TENDL    | OFF                                                  |                |
 | GEANT4_BUILD_MSVC_MP             | OFF, Windows Only                                    |                |
 | GEANT4_BUILD_TLS_MODEL           | initial-exec                                         | global-dynamic |
 | GEANT4_BUILD_STORE_TRAJECTORY    | ON                                                   |                |
 | GEANT4_BUILD_VERBOSE_CODE        | ON                                                   |                |
 | GEANT4_BUILD_BUILTIN_BACKTRACE   | OFF                                                  |                |
 | GEANT4_BUILD_PHP_AS_HP           | OFF                                                  | what's this?   |
 | GEANT4_USE_SMARTSTACK            | OFF                                                  | what's this?   |
 | GEANT4_USE_SYSTEM_PTL            | OFF                                                  |                |
 | GEANT4_USE_TBB                   | OFF                                                  |                |
 | GEANT4_ENABLE_TESTING            | OFF                                                  |                |
 | GEANT4_USE_FREETYPE              | OFF                                                  |                |
 | GEANT4_USE_HDF5                  | OFF                                                  |                |
 | GEANT4_USE_USOLIDS               | OFF                                                  |                |
 | GEANT4_USE_TIMEMORY              | OFF                                                  |                |
 | GEANT4_USE_VTK                   | OFF                                                  |                |
 | CMAKE_PREFIX_PATH                | OFF                                                  |                |
 |----------------------------------+------------------------------------------------------+----------------|

 |--------------------------------+-----------------------------------------------------------------------------------------|
 | CMAKE_CXX_FLAGS                | -W -Wall -pedantic -Wno-non-virtual-dtor -Wno-long-long -Wwrite-strings -Wpointer-arith |
 |                                | -Woverloaded-virtual -Wno-variadic-macros -Wshadow -pipe                                |
 | CMAKE_CXX_FLAGS_RELEASE        | -O3 -DNDEBUG -fno-trapping-math -ftree-vectorize -fno-math-errno                        |
 | CMAKE_CXX_FLAGS_DEBUG          | -g                                                                                      |
 | CMAKE_CXX_FLAGS_RELWITHDEBINFO | -O2 -g                                                                                  |
 |--------------------------------+-----------------------------------------------------------------------------------------|
EOF
echo ""
