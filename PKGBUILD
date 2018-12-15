# Maintainer: Nikos Fytilis ( n-fit at live.com )

_pkgname=mgltools
pkgname=mgltools-bin
pkgver=2015.01.22
pkgrel=2
pkgdesc="Visualization and analysis of molecular structures; includes AutoDockTools, Vision, AutoDock 4.2.6 and\
 PythonMoleculeViewer (includes Python 2.7)"
arch=('x86_64')
url="http://mgltools.scripps.edu/"
license=('custom')
source=(http://mgltools.scripps.edu/downloads/tars/releases/nightly/latest/REL/mgltools_x86_64Linux2_latest.tar.gz
'remove_licence_popup.patch')
md5sums=('SKIP'
'7f2e0c303999deffe2879e466ae28be7')
options=('!emptydirs')
depends=('libpng12')
#"http://mgltools.scripps.edu/downloads/tars/releases/nightly/${pkgver}/REL\${_pkgname}_x86_64Linux2_${pkgver}.tar.gz")
#depends=('swig' 'tk' 'python2-numpy' 'python2-imaging' 'python2-pmw' 'glut' 'python2-zsi' 
#        'python2-simpy' 'libxmu' 'python2-backports.ssl' 'python2-colorama' 'python2-dateutil'
#        'ipython2' 'python2-apache-libcloud' 'python2-matplotlib' 'python2-pygments'
#        'python2-pyside' 'python2-pytz' 'python2-pyzmq')
#optdepends=('autodocksuite')

pkgver() {
  curl_output="$(curl http://mgltools.scripps.edu/downloads/tars/releases/nightly/latest/REL/)"
  echo "$curl_output" | grep -A 1 'mgltools_x86_64Linux2_latest.tar.gz">mgl'\
 | tail -n1 | tr -d '[a-z]:<>+;&=' | sed 's/\/\///g' | tr -s ' ' | tr '/' '.' | cut -d ' ' -f 3
}

prepare() {
  patch -p1 -i $srcdir/remove_licence_popup.patch
}

package() {
  cd "$srcdir/${_pkgname}_x86_64Linux2_latest"
  mkdir -p $pkgdir/usr/bin/ $pkgdir/opt/$_pkgname/AutoDockTools_for_pymol
  ./install.sh -d "$pkgdir/opt/$_pkgname" &> /dev/null
  cd "$pkgdir/"
  i="./opt/$_pkgname/bin/pythonsh"
  echo "LD_PRELOAD='/usr/lib/libstdc++.so.6 /usr/lib/libgcc_s.so.1 /usr/lib/libxcb.so.1'" $(echo $i | sed 's/^.//g') '$@' > ./usr/bin/$(basename $i)-mg
  asd=( `find "./opt/$_pkgname/bin/"  -type f`)
  dasd=( `find "./opt/$_pkgname/MGLToolsPckgs/AutoDockTools/Utilities24" -name '*.py' `)
  for i in ${asd[@]}
    do 
    if [ "$(grep MGL_ROOT\= $i 2> /dev/null)" ]
      then sed "/MGL_ROOT\=/c\MGL_ROOT=\"/opt/$_pkgname\"" -i $i
    fi
  done
  for i in ${dasd[@]}
    do echo /usr/bin/pythonsh-mg $(echo $i | sed 's/^.//g') '$@' > ./opt/$_pkgname/AutoDockTools_for_pymol/$(basename $i)
  done
  chmod 755 ./usr/bin/* ./opt/$_pkgname/AutoDockTools_for_pymol/*
  ln -sf /opt/mgltools/MGLToolsPckgs/binaries/autodock4 ./usr/bin/
  ln -sf /opt/mgltools/MGLToolsPckgs/binaries/autogrid4 ./usr/bin/
}
