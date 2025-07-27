# Maintainer: Giorgio Gilestro <giorgio at gilest.ro>

pkgname=ethoscope-node
pkgver=r2231.gbf320832
pkgrel=2
pkgdesc="A platform for monitoring animal behaviour in real time from a raspberry pi"
arch=('any')
url="http://lab.gilest.ro/ethoscope"
license=('GPL3')
makedepends=('git' 'gcc-fortran' 'rsync' 'wget' 'fping' ) 
depends=('ntp' 'cronie' 'openssh' 'mariadb' 'dnsmasq' 'avahi' 'python-setuptools' 'python-pip' 'sshpass' 'cloudflared')
provides=('ethoscope')
install="ethoscope-node.install"
source=("$pkgname::git+https://github.com/gilestrolab/ethoscope.git")
md5sums=('SKIP')
_git_branch="dev"

pkgver() {
  cd "$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  #creating packaging directories
  install -dm0755 $pkgdir/opt
  install -dm0755 $pkgdir/srv/git
  install -dm0755 $pkgdir/usr/lib/systemd/system
  install -dm0755 $pkgdir/ethoscope_data/{results,videos,cache,sensors}
  
  #create bare repo
  git clone --mirror https://github.com/gilestrolab/ethoscope.git "${pkgdir}/srv/git/ethoscope.git"
  
  #configure proper fetch refspec for bare repository
  cd "${pkgdir}/srv/git/ethoscope.git"
  git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
  git fetch origin
  
  #setting python3 branch
  cd "${srcdir}/${pkgname}"
  git checkout ${_git_branch}

  #cp node server and node updater
  cd "${srcdir}"
  cp -R --no-dereference --preserve=mode,links -v * "${pkgdir}/opt/ethoscope"
  
  #changing the remote GIT source to local BARE created during installation
  cd "${pkgdir}/opt/ethoscope"
  git remote set-url origin /srv/git/ethoscope.git
  
  # Install service files as symbolic links
  cd "${pkgdir}/usr/lib/systemd/system/"
  ln -s /opt/ethoscope/services/ethoscope_node.service ./
  ln -s /opt/ethoscope/services/ethoscope_update_node.service ./
  ln -s /opt/ethoscope/services/ethoscope_tunnel.service ./
  ln -s /opt/ethoscope/services/ethoscope_sensor_virtual.service ./
  ln -s /opt/ethoscope/services/ethoscope_backup_mysql.service ./
  ln -s /opt/ethoscope/services/ethoscope_backup_sqlite.service ./
  ln -s /opt/ethoscope/services/ethoscope_backup_unified.service ./
  ln -s /opt/ethoscope/services/ethoscope_backup_video.service ./
  ln -s /opt/ethoscope/services/virtuascope.service ./

}


