# Maintainer: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-spynnaker-git
pkgname=('python-spynnaker-git' 'python2-spynnaker-git')
pkgver=1
pkgrel=1
pkgdesc="Spinnaker implementation of PyNN"
arch=('any')
url="https://pypi.org/project/sPyNNaker/#files"
license=('GPL')
makedepends=('python2' 'python2-setuptools' 'python' 'python-setuptools' 'git')
depends=('python2' 'python' 'python2-lazyarray' 'python-lazyarray' 'python-neo' 'python2-neo' 'python-quantities' 'python2-quantities' 'python-lxml' 'python2-lxml' 'python-jsonschema' 'python2-jsonschema' 'python-future' 'python2-future' 'python2-futures' 'python2-sortedcontainers' 'python-sortedcontainers' 'python2-sortedcollections' 'python-sortedcollections' 'python-requests' 'python2-requests')
source=( 
"spalloc::git+https://github.com/SpiNNakerManchester/spalloc.git"
"SpiNNaker_DataSpecification::git+https://github.com/SpiNNakerManchester/DataSpecification.git"
"SpiNNaker_PACMAN::git+https://github.com/SpiNNakerManchester/PACMAN.git"
"SpiNNMachine::git+https://github.com/SpiNNakerManchester/SpiNNMachine.git"
"SpiNNMan::git+https://github.com/SpiNNakerManchester/SpiNNMan.git"
"SpiNNStorageHandlers::git+https://github.com/SpiNNakerManchester/SpiNNStorageHandlers.git"
"SpiNNUtilities::git+https://github.com/SpiNNakerManchester/SpiNNUtils.git"
"sPyNNaker::git+https://github.com/SpiNNakerManchester/sPyNNaker.git"
"SpiNNFrontEndCommon::git+https://github.com/SpiNNakerManchester/SpiNNFrontEndCommon.git"
"spinn_common::git+https://github.com/SpiNNakerManchester/spinn_common.git"
"spinnaker_tools::git+https://github.com/SpiNNakerManchester/spinnaker_tools.git"
"SpiNNakerGraphFrontEnd::git+https://github.com/SpiNNakerManchester/SpiNNakerGraphFrontEnd.git"
"spynnaker8::git+https://github.com/SpiNNakerManchester/sPyNNaker8.git"
"https://files.pythonhosted.org/packages/source/P/PyNN/PyNN-0.9.5.tar.gz"
)

sha256sums=(
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'91af2126b639a6a795bfc2709ac49423278c4794b6d0da143908b9afcb415f80')

pkgver() {
  printf "%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s.%s" $(git -C sPyNNaker rev-list --count HEAD) $(git -C sPyNNaker rev-parse --short HEAD) $(git -C SpiNNFrontEndCommon rev-list --count HEAD) $(git -C SpiNNFrontEndCommon rev-parse --short HEAD) $(git -C spinn_common rev-list --count HEAD) $(git -C spinn_common rev-parse --short HEAD) $(git -C spinnaker_tools rev-list --count HEAD) $(git -C spinnaker_tools rev-parse --short HEAD) $(git -C SpiNNakerGraphFrontEnd rev-list --count HEAD) $(git -C SpiNNakerGraphFrontEnd rev-parse --short HEAD) $(git -C spynnaker8 rev-list --count HEAD) $(git -C spynnaker8 rev-parse --short HEAD) $(git -C spalloc rev-list --count HEAD) $(git -C spalloc rev-parse --short HEAD) $(git -C SpiNNaker_DataSpecification rev-list --count HEAD) $(git -C SpiNNaker_DataSpecification rev-parse --short HEAD) $(git -C SpiNNaker_PACMAN rev-list --count HEAD) $(git -C SpiNNaker_PACMAN rev-parse --short HEAD) $(git -C SpiNNMachine rev-list --count HEAD) $(git -C SpiNNMachine rev-parse --short HEAD) $(git -C SpiNNMan rev-list --count HEAD) $(git -C SpiNNMan rev-parse --short HEAD) $(git -C SpiNNStorageHandlers rev-list --count HEAD) $(git -C SpiNNStorageHandlers rev-parse --short HEAD) $(git -C SpiNNUtilities rev-list --count HEAD) $(git -C SpiNNUtilities rev-parse --short HEAD)
}

prepare()
{
  cd "${srcdir}/SpiNNFrontEndCommon/c_common/front_end_common_lib/"
  sed -i "s/python/python2/" Makefile
  sed -i "s/python/python2/" local.mk
  
  cd "${srcdir}/spinnaker_tools"
  sed -i "s/==/=/" setup
  sed -i "s/^SPINN_DIRS.*/\ \ &/" setup
  sed -i '/\ \ SPINN_DIRS/ i SHELL=\`readlink /proc/\$\$/exe | xargs basename\`' setup
  sed -i '/\ \ SPINN_DIRS/ i \ ' setup
  sed -i '/\ \ SPINN_DIRS/ i if [ \"$SHELL\" = \"zsh\" ]; then' setup
  sed -i '/\ \ SPINN_DIRS/ i \ \ SPINN_DIRS=\`cd \"\$(dirname \"\${(%):-\%N}\")\";pwd -P\`' setup
  sed -i '/\ \ SPINN_DIRS.*BASH_SOURCE.*/ i else' setup
  sed -i '/\ \ SPINN_DIRS.*BASH_SOURCE.*/ a fi' setup
  
  source $PWD/setup
  
  make clean
  make || exit $?
  cd ..
  cd spinn_common
  make clean
  make install-clean
  make || exit $?
  make install
  cd ..
  cd SpiNNFrontEndCommon/c_common/
  cd front_end_common_lib/
  make install-clean
  cd ..
  make clean
  PYTHONPATH="${srcdir}/SpiNNUtilities/" make || exit $?
  make install
  cd ../..
  cd sPyNNaker/neural_modelling/
  source $PWD/setup.bash
  make clean
  PYTHONPATH="${srcdir}/SpiNNUtilities/" make || exit $?
  cd ../../SpiNNakerGraphFrontEnd/spinnaker_graph_front_end/examples/
  make clean
  PYTHONPATH="${srcdir}/SpiNNUtilities/" make || exit $?
  echo "Neural model compilation completed"
}

package_python2-spynnaker-git() {
  cd "${srcdir}/spalloc"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNaker_DataSpecification"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNaker_PACMAN"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNMachine"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNMan"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNStorageHandlers"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNUtilities"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNFrontEndCommon"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNakerGraphFrontEnd"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/${_name}"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/PyNN-0.9.5"
  python2 setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/spynnaker8"
  python2 setup.py install --root="${pkgdir}"
  
  
  python2sitepackagesdir=`python2 -c "import site; print(site.getsitepackages()[0])"`
  
  echo -n "directory to install python2 packages: "
  echo ${python2sitepackagesdir}
  
  cd "${pkgdir}/${python2sitepackagesdir}"
  currentpath=`pwd`
  python2 -c "import sys; import os; sys.path.insert(0,os.getcwd()); import spynnaker8.setup_pynn"
  
#  if [ -d "${pkgdir}/${python2sitepackagesdir}/pyNN/nest/_build/" ]; then
#    cd "${pkgdir}/${python2sitepackagesdir}/pyNN/nest/_build/"
#    mv pynn_extensions.so "${pkgdir}/usr/lib"
#    mv libpynn_extensions.so "${pkgdir}/usr/lib"
#  fi
  
  cd "${pkgdir}/usr/bin"
  mv get_cores_in_run_state get_cores_in_run_state2
  mv spalloc spalloc2
  mv spalloc-job spalloc-job2
  mv spalloc-machine spalloc-machine2
  mv spalloc-ps spalloc-ps2
  mv spalloc-where-is spalloc-where-is2
} 

package_python-spynnaker-git() {
  cd "${srcdir}/spalloc"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNaker_DataSpecification"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNaker_PACMAN"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNMachine"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNMan"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNStorageHandlers"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNUtilities"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNFrontEndCommon"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/SpiNNakerGraphFrontEnd"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/PyNN-0.9.5"
  python setup.py install --root="${pkgdir}"
  
  cd "${srcdir}/spynnaker8"
  python setup.py install --root="${pkgdir}"
  
  python3sitepackagesdir=`python -c "import site; print(site.getsitepackages()[0])"`
  
  echo -n "directory to install python3 packages: "
  echo ${python3sitepackagesdir}
  
#  if [ -d "${pkgdir}/${python3sitepackagesdir}/pyNN/nest/_build/" ]; then
#    cd "${pkgdir}/${python3sitepackagesdir}/pyNN/nest/_build/"
#    rm pynn_extensions.so
#    rm libpynn_extensions.so
#  fi
}
