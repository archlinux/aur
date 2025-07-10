# Maintainer: Jakub Smulski <hgonomeg@gmail.com>
# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=coot
pkgver=1.1.17
pkgrel=1
pkgdesc="Crystallographic Object-Oriented Toolkit for model building, completion and validation"
arch=('i686' 'x86_64')
url="https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/"
license=('GPL')
replaces=('coot-data')
#depends=('guile' 'gtkglext' 'libccp4>=6.5.1-2' 'libclipper>=2.1.20170202-3' 'gsl' 'imlib' 'swig'
#         'freeglut' 'libgl' 'gtk4' 'cairo' 'libssm>=1.4.0-2' 'zlib' 'curl' 'python' 'gtkglarea' 'which' 'bc' 'sqlite' 'rdkit' 'mmdb2>=2.0.12-4')
makedepends=('boost' 'bc' 'which')
depends=('boost-libs' 'guile' 'libccp4>=6.5.1-2' 'libclipper>=2.1.20170202-3' 'fftw2-float' 'gsl' 'swig'
         'libgl' 'gtk4' 'glib2' 'glm' 'cairo' 'libssm>=1.4' 'zlib' 'curl' 'python' 'python-gobject' 'sqlite' 'rdkit' 'mmdb2>=2.0.12-4')
source=($pkgname-$pkgver.tar.gz::https://github.com/pemsley/$pkgname/archive/refs/tags/Release-$pkgver.tar.gz
        https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/$pkgname/dependencies/refmac-monomer-library.tar.gz
        https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/$pkgname/dependencies/reference-structures.tar.gz
        )

sha256sums=('127480271faafd0543b6a12708608e6f449901bf04d1e955dfdc252cc3d02e85'
            '03562eec612103a48bd114cfe0d171943e88f94b84610d16d542cda138e5f36b'
            '44db38506f0f90c097d4855ad81a82a36b49cd1e3ffe7d6ee4728b15109e281a'
            )
prepare() {	
  cd "$srcdir/$pkgname-Release-$pkgver"
  echo Patching configure.ac so that we can have C++20 \(as required now by RDKit\)
  sed -i 's/c++17/c++20/g' configure.ac
  #patch -Np1 -i "$srcdir/glm_nopkgconfig.patch"
}

build() {
  cd "$srcdir/$pkgname-Release-$pkgver"

  aclocal -I macros
  libtoolize --automake --copy
  autoconf
  automake --copy --add-missing --gnu

  #CXXFLAGS="${CXXFLAGS} -fpermissive"
  CXXFLAGS="-Wreturn-type -Wl,--as-needed -Wno-sequence-point -Wsign-compare -Wno-unknown-pragmas -Wno-template-id-cdtor -Wno-deprecated-declarations"
  PYTHON=python3

  ./configure --prefix=/usr \
              --disable-static \
              --with-enhanced-ligand-tools
  make
}

package() {
  cd "$srcdir/$pkgname-Release-$pkgver"
  make DESTDIR="$pkgdir/" install
  #sed -i 's|COOT_PYTHON_DIR=|COOT_PYTHON_DIR=/usr/lib/python2.7/site-packages/coot|' src/$pkgname
  sed -i 's|COOT_REFMAC_LIB_DIR=|COOT_REFMAC_LIB_DIR=/usr/share/coot/lib/|' src/$pkgname
  install -p -m 755 src/$pkgname $pkgdir/usr/bin

  # remove shebang from python scripts
  # for lib in $(find $pkgdir/usr/lib/python2.7/site-packages/$pkgname/ -name "*.py"); do
  #  sed '/\/usr\/bin\/env/d' $lib > $lib.new &&
  #  touch -r $lib $lib.new &&
  #  mv $lib.new $lib
  # done

  # chmod 644 $pkgdir/usr/lib/python2.7/site-packages/$pkgname/$pkgname.py

  install -d $pkgdir/usr/share/$pkgname/reference-structures
  install -Dm644 $srcdir/reference-structures/*.pdb $pkgdir/usr/share/$pkgname/reference-structures/

  install -d $pkgdir/usr/share/$pkgname/lib/data/monomers
  cp -r $srcdir/monomers/* $pkgdir/usr/share/$pkgname/lib/data/monomers/
}
