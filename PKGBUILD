pkgname=gpvdm-git
pkgver=4.40
pkgrel=1
pkgdesc="A numerical device model for the simulation of solar cells and OLEDs, git checkout"
arch=(x86_64)
url="http://www.gpvdm.com"
license=('GPL')
depends=(
python-numpy
python-matplotlib
python-pyqt5
python-psutil
python-opengl
python-cairo
python-dbus
suitesparse
gnuplot
superlu
python-dateutil
mencoder
imagemagick
blas
)

makedepends=(
git
python
libzip
gsl
zip
texlive-bin
texlive-core
autoconf
automake
python-pythondialog
help2man
)
provides=(gpvdm)
conflicts=(gpvdm)

source=(git+https://github.com/roderickmackenzie/gpvdm.git)
md5sums=('SKIP')

prepare() {
  cd gpvdm
  rm -rf gpvdm_core/libfit  # delete this for now to get this to build
}

build() {
  cd gpvdm
  PYTHONPATH=./build_system/ python -c "from make_m4 import make_m4; make_m4()"
  PYTHONPATH=./build_system/ python -c "from compile_menu import write_includes; write_includes()"
  for dir in gpvdm_core gpvdm_gui gpvdm_data
  do
    pushd $dir
    #autoreconf
    aclocal
    automake --add-missing
    automake
    autoconf
    if test "${dir}"x == "gpvdm_core"
    then
      ./configure CPPFLAGS="-I/usr/include/"
    else
      ./configure
    fi
    make clean
    make
    popd
  done
}

check() {
  cd gpvdm
  make -k check
}

package() {
  cd gpvdm
  #make DESTDIR="$pkgdir/" DEST_LIB=lib install
}


