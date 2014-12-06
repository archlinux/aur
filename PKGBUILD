# Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=eee-control
pkgver=0.9.7.2
pkgrel=2
pkgdesc="A utility for the EeePC family which allows the user to modify the FSB, toggle hardware on and off and more."
arch=('i686' 'x86_64')
url="http://launchpad.net/eee-control/"
license=('BSDL')
backup=('etc/eee-control.conf')
depends=('python2' 'dbus-python' 'gconf' 'python-wnck' 'pygtk' 'python-notify' 'acpid' 'consolekit' 'python2-gconf')
makedepends=('bzr')

source=(eee-control-daemon.rc
	eee-control-daemon.conf.diff
	eee-control-daemon.diff)

_bzrtrunk="lp:eee-control"
_bzrmod="eee-control"

build() {
  echo $startdir
  cd "${srcdir}"

  msg "Connecting to the server...."

  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${_bzrmod}-build"
  cp -r "${_bzrmod}" "${_bzrmod}-build"
  cd "${_bzrmod}-build"
  
  python2 setup.py install --prefix=$pkgdir/usr

  # Some patches for compatibility in arch
  cd $pkgdir
  patch -Np1 < $srcdir/../eee-control-daemon.diff
  patch -Np1 < $srcdir/../eee-control-daemon.conf.diff
  cd $srcdir
  # Now python 2.7 is called python2 (not needed when building from source)
  #for i in eee-control-daemon eee-control-tray ; do
    #sed -i -e "s|/usr/bin/python|/usr/bin/python2|g" $pkgdir/usr/bin/$i
  #done 

  #Remove some conflicting lines
  sed -i '329d' $pkgdir/usr/lib/python2.7/site-packages/EeeControl/tray.py
  sed -i '329d' $pkgdir/usr/lib/python2.7/site-packages/EeeControl/tray.py
  
  install -D -m 755 $pkgdir/usr/share/eee-control/eee-control.conf $pkgdir/etc/eee-control.conf
  install -D -m 755 $startdir/eee-control-daemon.rc $pkgdir/etc/rc.d/eee-control-daemon 
}
md5sums=('f66a56858f0e9ee4b274c55df5fcf7fc'
         '9a03658a5c1d358fc4d0a12fd95305ea'
         'b22072d36fb4febae53698d841115112')
