# Maintainer Adrian Tymorek <adrian.tymorek@protonmil.com>
# Contributor: Brett Gilio <mail@brettgilio.com>
pkgname=neuron
pkgver=7.7.2
_pkgver=7.7
pkgrel=1
pkgdesc="A flexible and powerful simulator of neurons and networks NEURON is a simulation environment for developing and exercising models of neurons and networks of neurons."
arch=('x86_64')
url="https://neuron.yale.edu/neuron/"
license=('GPL')
groups=('')
depends=('aarch64-linux-gnu-gcc>=5.2' 'ncurses' 'libx11' 'openmpi' 'python' 'python-numpy' 'python-scipy')
# makedepends=()
options=('!strip' '!emptydirs')
#source_x86_64=("https://neuron.yale.edu/ftp/neuron/versions/v7.7.2/nrn-7.7.2.tar.gz")
source_x86_64=("https://neuron.yale.edu/ftp/neuron/versions/v7.7/7.7.2/nrn-7.7.2.tar.gz")
sha512sums_x86_64=('6e60ab43829cc0fedc0eb300e0c0eb1675b41e34f5870807baf5ae57235599a1ba096715d62415ddcea6f5885c1b0f396a3c1f42cf569d30ca518303ae40d557')

build() {
  cd "$srcdir/nrn-$_pkgver"

  # We do this so the python libraries actually get installed in the package prefix
  sed -i "s|ac\_pysetup='--home=\$(prefix)'|ac\_pysetup='--home=$pkgdir/usr'|g" "$srcdir/nrn-$_pkgver/configure"
  sed -i 's|exec\_prefix="${prefix}/${host\_cpu}"|exec\_prefix="${prefix}"|g' "$srcdir/nrn-$_pkgver/configure"

  ./configure --prefix=/usr --libdir=/usr/lib --bindir=/usr/bin --with-paranrn --with-nrnpython=`which python` --without-iv
  make
}

package() {
  cd "$srcdir/nrn-$_pkgver"
  DESTDIR="$pkgdir"
  sed -i "s|package\_dir\ =\ {'':instdir+'/share/nrn/lib/python'}\,|package\_dir\ =\ {'':'$pkgdir/usr/share/nrn/lib/python'}\,|g" src/nrnpython/setup.py
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
