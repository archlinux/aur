# Maintainer: Giorgio Gilestro <giorgio at gilest.ro>

pkgname=ethoscope-node
pkgver=r1969.g0521648
pkgrel=5
pkgdesc="A platform for monitoring animal behaviour in real time from a raspberry pi"
arch=('any')
url="http://lab.gilest.ro/ethoscope"
license=('GPL3')
makedepends=('git' 'gcc-fortran' 'rsync' 'wget' 'fping' ) 
depends=('ntp' 'cronie' 'openssh' 'mariadb' 'dnsmasq' 'avahi' 'python-setuptools' 'python-pip' 'python-ifaddr' 'python-numpy' 'python-bottle' 'python-pyserial' 'python-mysql-connector' 'python-netifaces' 'python-cherrypy' 'python-eventlet' 'python-gitpython'  'python-dnspython' 'python-greenlet' 'python-monotonic' 'python-zeroconf' 'python-cheroot' 'python-opencv')
provides=('ethoscope')
install="ethoscope-node.install"
source=("$pkgname::git+https://github.com/gilestrolab/ethoscope.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  #creating packaging directories
  install -dm0755 $pkgdir/opt
  install -dm0755 $pkgdir/srv/git
  install -dm0755 $pkgdir/usr/lib/systemd/system
  install -dm0755 $pkgdir/ethoscope_data/{results,videos,tmp}
  
  #create bare repo
  git clone --bare https://github.com/gilestrolab/ethoscope.git "${pkgdir}/srv/git/ethoscope.git"
  
  #setting python3 branch
  cd "${srcdir}/${pkgname}"
  git checkout dev

  #cp node server and node updater
  cd "${srcdir}"
  cp -R --no-dereference --preserve=mode,links -v * "${pkgdir}/opt/${pkgname}"
  ln -s /opt/ethoscope-node/scripts/ethoscope_updater "${pkgdir}/opt/"
  
  #changing the remote GIT source to local BARE created during installation
  cd "${pkgdir}/opt/${pkgname}"
  git remote set-url origin /srv/git/ethoscope.git
  
  #install python service
  #cd "${srcdir}/${pkgname}/node_src"
  #pip install -e . --install-option="--prefix=${pkgdir}" --no-deps
  #python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # Install service files as symbolic links
  cd "${pkgdir}/usr/lib/systemd/system/"
  ln -s /opt/${pkgname}/scripts/ethoscope_node.service ethoscope_node.service
  ln -s /opt/${pkgname}/scripts/ethoscope_backup.service ethoscope_backup.service
  ln -s /opt/${pkgname}/scripts/ethoscope_video_backup.service ethososcope_video_backup.service
  ln -s /opt/${pkgname}/scripts/ethoscope_updater/ethoscope_update_node.service ethoscope_update_node.service

}


