# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=sdds
pkgver=3.5
pkgrel=1
pkgdesc="Toolkit for the Self Describing Data Set file format developed at Argonne Nat'l lab"
arch=("any")
makedepends=('perl')
url="http://www.aps.anl.gov/Accelerator_Systems_Division/Accelerator_Operations_Physics/manuals/SDDStoolkit/SDDStoolkit.html"
license=('custom')
source=(
        "http://www.aps.anl.gov/Accelerator_Systems_Division/Accelerator_Operations_Physics/downloads/SDDS.${pkgver}.tar.gz"
        "http://www.aps.anl.gov/Accelerator_Systems_Division/Accelerator_Operations_Physics/downloads/epics.base.configure.tar.gz"
        "http://www.aps.anl.gov/Accelerator_Systems_Division/Accelerator_Operations_Physics/downloads/defns.rpn"
	"http://www.aps.anl.gov/Accelerator_Systems_Division/Accelerator_Operations_Physics/downloads/epics.extensions.configure.tar.gz"
	)
md5sums=('735b4e9adb18c3277b757c46563de5b4'
         '4db0cac7a918424b2fc2a588c95a29d9'
         '7b5e17cdbcdeff1e3381fd1618f0a40d'
         '0c2b5e593aecc70edb6c86bca57452c6')

prepare() {
  sed -i 's,\$,#\$,g' "${srcdir}/epics/base/configure/os/CONFIG_SITE.linux-x86_64.UnixCommon"
  #sed -i "s,#INSTALL_LOCATION=<fullpathname>,INSTALL_LOCATION=${pkgdir},g" "${srcdir}/epics/extensions/configure/CONFIG_SITE"
  #sed -i 's,SHARED_LIBRARIES = NO,SHARED_LIBRARIES = YES,g' "${srcdir}/epics/extensions/configure/CONFIG_SITE"
  #sed -i 's,SHARED_LIBRARIES=NO,SHARED_LIBRARIES=YES,g' "${srcdir}/epics/extensions/configure/CONFIG"
  
  # fixes for python
  sed -i 's,PYTHON_PREFIX = \$(shell python -c "import sys; print sys.prefix"),PYTHON_PREFIX = \$(shell python2 -c "import sys; print sys.prefix"),g' "${srcdir}/epics/extensions/src/SDDS/python/Makefile"
  sed -i 's,PYTHON_EXEC_PREFIX = \$(shell python -c "import sys; print sys.exec_prefix"),PYTHON_EXEC_PREFIX = \$(shell python2 -c "import sys; print sys.exec_prefix"),g' "${srcdir}/epics/extensions/src/SDDS/python/Makefile"
  sed -i 's,PYTHON_VERSION = \$(shell python -c "import sys; print sys.version\[:3\]"),PYTHON_VERSION = \$(shell python2 -c "import sys; print sys.version\[:3\]"),g' "${srcdir}/epics/extensions/src/SDDS/python/Makefile"



  cd "${srcdir}/epics/base"
  make clean

  cd "${srcdir}/epics/extensions/configure"
  make clean
}

build() {
  cd "${srcdir}/epics/base"
  export RPN_DEFNS="${srcdir}/defns.rpn"
  export HOST_ARCH=linux-x86_64
  export EPICS_HOST_ARCH=linux-x86_64
  make

  cd "${srcdir}/epics/extensions/configure"
  make

  cd "${srcdir}/epics/extensions/src/SDDS"
  make

  cd "${srcdir}/epics/extensions/src/SDDS/python"
  make
}

package() {
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/epics/extensions" "${pkgdir}/opt/sdds"
  cd "${pkgdir}/opt/sdds"
  rm -rf CVS configure config 
}
