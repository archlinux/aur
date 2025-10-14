# Maintainer: Giorgio Gilestro <giorgio at gilest.ro>

pkgname=ethoscope-node
pkgver=r2231.gbf320832
pkgrel=8
pkgdesc="A platform for monitoring animal behaviour in real time from a raspberry pi"
arch=('any')
url="http://lab.gilest.ro/ethoscope"
license=('GPL3')
makedepends=('base-devel' 'git' 'gcc-fortran' 'rsync' 'wget' 'fping' )
depends=('ntp' 'cronie' 'openssh' 'mariadb' 'dnsmasq' 'avahi' 'python-setuptools' 'python-wheel' 'python-pip' 'sshpass' 'cloudflared' 'gcc'
         'python-bottle' 'python-cherrypy' 'python-mysql-connector' 'python-netifaces'
         'python-gitpython' 'python-zeroconf' 'python-numpy' 'python-opencv' 'python-pyserial'
         'python-psutil' 'python-requests' 'python-scipy' 'python-dateutil' 'python-mattermostdriver')
optdepends=('python-picamera2: Raspberry Pi camera support for ethoscope devices')
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
  
  #clone working copy from bare repo (avoids git alternates issues)
  cd "${pkgdir}/opt"
  git clone "${pkgdir}/srv/git/ethoscope.git" ethoscope

  #setting python3 branch
  cd "${pkgdir}/opt/ethoscope"
  git checkout ${_git_branch}

  #set remote to local bare repo and clean logs with pkgdir references
  git remote set-url origin /srv/git/ethoscope.git

  #remove git logs that contain pkgdir references
  rm -rf .git/logs
  
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

  # Note: Python packages are installed via pip in the .install script
  # This generates .egg-info metadata and registers console script entry points
  # Dependencies are provided by pacman packages

}


