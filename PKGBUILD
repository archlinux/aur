# Maintainer: Giorgio Gilestro <giorgio at gilest.ro>

pkgname=ethoscope-node
pkgver=r2899.gb7d417eb
pkgrel=1
pkgdesc="A platform for monitoring animal behaviour in real time from a raspberry pi"
arch=('any')
url="http://lab.gilest.ro/ethoscope"
license=('GPL3')
makedepends=('base-devel' 'git' 'gcc-fortran' 'wget' 'fping' )
depends=('ntp' 'cronie' 'openssh' 'mariadb' 'dnsmasq' 'avahi' 'python-setuptools' 'python-wheel' 'python-pip' 'sshpass' 'cloudflared' 'gcc' 'git' 'rsync'
         'python-bottle' 'python-cherrypy' 'python-mysql-connector' 'python-netifaces'
         'python-gitpython' 'python-zeroconf' 'python-numpy' 'python-opencv' 'python-pyserial'
         'python-psutil' 'python-requests' 'python-scipy' 'python-dateutil' 'python-mattermostdriver')
optdepends=('python-picamera2: Raspberry Pi camera support for ethoscope devices')
provides=('ethoscope')
install="ethoscope-node.install"
source=("$pkgname::git+https://github.com/gilestrolab/ethoscope.git"
        "ssh-handler.desktop")
md5sums=('SKIP' 'SKIP')
_git_branch="dev"

pkgver() {
  cd "$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  #creating packaging directories
  install -dm0755 $pkgdir/usr/lib/systemd/system
  install -dm0755 $pkgdir/usr/share/${pkgname}
  install -dm0755 $pkgdir/ethoscope_data/{results,videos,cache,sensors}

  # Reason: nodes update /opt/ethoscope and /srv/git/ethoscope.git themselves (Update System, the
  # mirror timer), so the package ships the history as a git bundle and ethoscope-node.install makes
  # both trees from it. Shipped as package files, the trees clashed on every later upgrade with the
  # files a self-updated node had gained ("exists in filesystem").
  git clone --mirror https://github.com/gilestrolab/ethoscope.git "${srcdir}/ethoscope-mirror.git"
  git -C "${srcdir}/ethoscope-mirror.git" bundle create "${pkgdir}/usr/share/${pkgname}/ethoscope.bundle" --branches --tags

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
  ln -s /opt/ethoscope/services/ethoscope_virtuascope.service ./
  ln -s /opt/ethoscope/services/ethoscope_mirror_fetch.service ./
  ln -s /opt/ethoscope/services/ethoscope_mirror_fetch.timer ./

  # Install ssh:// protocol handler so SSH links in the web UI are clickable
  install -Dm644 "${srcdir}/ssh-handler.desktop" "${pkgdir}/usr/share/applications/ssh-handler.desktop"

  # Note: Python packages are installed via pip in the .install script
  # This generates .egg-info metadata and registers console script entry points
  # Dependencies are provided by pacman packages

}


