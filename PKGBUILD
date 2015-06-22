# Maintainer: Ali Neishabouri <ali at neishabouri.net>
# Contributor: David Campbell <davekong@archlinux.us>

pkgname=neuron
pkgver=7.3
pkgrel=8
pkgdesc="Empirically-based simulations of neurons and networks of neurons"
arch=('i686' 'x86_64')
url="http://www.neuron.yale.edu"
license=('GPL')
depends=('interviews' 'openmpi' 'python')
optdepends=('python-numpy' 'python-scipy' 'mpich2')
source=("http://www.neuron.yale.edu/ftp/neuron/versions/v$pkgver/nrn-$pkgver.tar.gz" "patch.diff")
options=('libtool')
md5sums=('993e539cb8bf102ca52e9fefd644ab61' 'ba01405ea8ff911a3802459ac2c27b01')

build() {
  cd "$srcdir/nrn-$pkgver"

  # We do this so the python libraries actually get installed in the package prefix
  sed -i "s_ac\_pysetup='--home=\$(prefix)'_ac\_pysetup='--home=$pkgdir/usr'_g" "$srcdir/nrn-$pkgver/configure"
  sed -i 's_exec\_prefix="${prefix}/${host\_cpu}"_exec\_prefix="${prefix}"_g' "$srcdir/nrn-$pkgver/configure"

  # Python 3 complains about a prototype (see http://www.neuron.yale.edu/phpbb/viewtopic.php?f=2&t=3060). 
  # This part patches some code according to http://www.neuron.yale.edu/hg/neuron/nrn/rev/dce1de58303d.
  patch -p1 < $srcdir/patch.diff
	
  ./configure --prefix=/usr --libdir=/usr/lib --bindir=/usr/bin --with-paranrn --with-nrnpython=`which python`
  make 
}

package() {
  cd "$srcdir/nrn-$pkgver"
  DESTDIR="$pkgdir"
  sed -i "s_package\_dir\ =\ {'':instdir+'/share/nrn/lib/python'}\,_package\_dir\ =\ {'':'$pkgdir/usr/share/nrn/lib/python'}\,_g" src/nrnpython/setup.py
  make DESTDIR="$pkgdir" install
  #rm -f "$pkgdir/usr/lib/libnrnmpi.la"
  #rm -f "$pkgdir/usr/lib/libmeschach.la"
  #rm -f "$pkgdir/usr/lib/libivoc.la"
  #rm -f "$pkgdir/usr/lib/libscopmath.la"
  #rm -f "$pkgdir/usr/lib/libneuron_gnu.la"
  #rm -f "$pkgdir/usr/lib/libmemacs.la"
  #rm -f "$pkgdir/usr/lib/libnrnoc.la"
  #rm -f "$pkgdir/usr/lib/libnrnpython.la"
  #rm -f "$pkgdir/usr/lib/liboc.la"
  #rm -f "$pkgdir/usr/lib/libnrniv.la"
  #rm -f "$pkgdir/usr/lib/libsundials.la"
  #rm -f "$pkgdir/usr/lib/libsparse13.la"
  #rm -f "$pkgdir/usr/lib/libocxt.la"
  
  cd "src/nrnpython/"
  python setup.py install --root="$pkgdir/"
}
