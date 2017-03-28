# Maintainer: Nikos Fytilis ( n-fit at live.com )

pkgname=mgltools2
pkgver=1.1
pkgrel=1
pkgdesc="Visualization and analysis of molecular structures; includes AutoDockTools, Vision and\
 PythonMoleculeViewer"
arch=('x86_64')
url="http://mgltools.scripps.edu/"
license=('custom')
depends=('swig' 'tk' 'python2-numpy' 'python2-imaging' 'python2-pmw' 'glut' 'python2-zsi' 
        'python2-simpy' 'libxmu' 'python2-backports.ssl' 'python2-colorama' 'python2-dateutil'
        'ipython2' 'python2-apache-libcloud' 'python2-matplotlib' 'python2-pygments'
        'python2-pyside' 'python2-pytz' 'python2-pyzmq')
optdepends=('autodocksuite')
source=("http://mgltools.scripps.edu/downloads/tars/releases/nightly/${pkgver}/REL\
/${pkgname}_x86_64Linux2_${pkgver}.tar.gz")

options=('!emptydirs')
md5sums=('db291ec19231c4b6d90a20efd34906be')


package() {
  cd "$srcdir/${pkgname}_x86_64Linux2_$pkgver"
  yes y| ./install.sh -d "$pkgdir/opt"
  cd "$pkgdir/"
  asd=( `find "./opt/bin/" -type f`)
  mkdir -p usr/bin/
  for i in ${asd[@]}
    do echo "LD_PRELOAD='/usr/lib/libstdc++.so.6 /usr/lib/libgcc_s.so.1 /usr/lib/libxcb.so.1'" $(echo $i | sed 's/^.//g') > ./usr/bin/$(basename $i)-mg
    if [ "$(grep MGL_ROOT\= $i 2> /dev/null)" ]
      then sed '/MGL_ROOT\=/c\MGL_ROOT="/opt/"' -i $i
    fi
  done
  chmod +x ./usr/bin/*
}
