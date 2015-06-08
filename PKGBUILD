# Maintainer: Ruthger Gubbels <aur@ruthger.nl>
# Contributor: Damian Nowak <spam@nowaker.net>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Shanto <shanto@hotmail.com>

pkgname='archipel-agent-git'
pkgver=beta6.r389.gc7f7fa6
pkgrel=1
pkgdesc='A solution to manage and supervise virtual machines. (Agent)'
arch=('any')
url='http://archipelproject.org/'
license=('AGPL')
depends=(
  'python2' 'python2-apscheduler' 'python2-sqlalchemy'
  'python2-numpy' 'python2-magic' 'python2-ctypes'
  'python-imaging' 'dnsmasq'
  'libvirt' 'libvirt-python' 'qemu'
)
makedepends=('python2-setuptools>=3.4' 'git')
optdepends=('ejabberd: An XMPP Server used by archipel for communication with VMs')
provides=('archipel-agent')
conflicts=('archipel-agent')
backup=('etc/archipel/archipel.conf' 'etc/archipel/vnc.pem'
        'etc/archipel/modules.d/action-scheduler.conf' 'etc/archipel/modules.d/centraldb.conf'
        'etc/archipel/modules.d/hypervisor-geolocalization.conf' 'etc/archipel/modules.d/hypervisor-health.conf'
        'etc/archipel/modules.d/hypervisor-network.conf' 'etc/archipel/modules.d/iphone-notification.conf'
        'etc/archipel/modules.d/virtualmachine-oomkiller.conf' 'etc/archipel/modules.d/virtualmachine-snapshoting.conf'
        'etc/archipel/modules.d/virtualmachine-storage.conf' 'etc/archipel/modules.d/virtualmachine-vnc.conf'
        'etc/archipel/modules.d/vmcasting.conf' 'etc/archipel/modules.d/vmparking.conf'
        'etc/archipel/modules.d/xmppserver.conf'
)
options=(!strip !emptydirs)
install='install'
source=('git://github.com/ArchipelProject/Archipel.git'
        'git://github.com/ArchipelProject/xmpppy.git'
        'git://github.com/ArchipelProject/Node.git'
)
sha512sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd Archipel 
  git describe --tags | sed 's/^@//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$srcdir"/Archipel
  git submodule init
  git config submodule.ArchipelAgent/archipel-core/archipelcore/xmpp.url "$srcdir"/xmpppy
#  git config submodule.ArchipelAgent/ANSOS.url "$srcdir"/Node
  git submodule update "$srcdir"/Archipel/ArchipelAgent/archipel-core/archipelcore/xmpp
#  git submodule update "$srcdir"/Archipel/ArchipelAgent/ANSOS
}

build() {
  # Remove central agent python packages
  rm "$srcdir"/Archipel/ArchipelAgent/archipel-central-agent* -r 2>/dev/null

  _list=$(find "$srcdir"/Archipel/ArchipelAgent -type d -name "archipel-*")
  for _dir in $_list; do
    msg "Building $_dir"
    pushd $_dir 1>/dev/null
    if [ -f 'setup.py' ]; then
      python2 setup.py install --root="$srcdir/$pkgname" --optimize=1 1>/dev/null
    fi
    popd 1>/dev/null
  done;

  # Replace python with python2
  sed -i 's/\/usr\/bin\/python /\/usr\/bin\/python2 /' "$srcdir"/"$pkgname"/usr/bin/*

  # Copy modules.d conf files
  _list=$(find "$srcdir"/"$pkgname"/usr/lib/ -type d -name '*.egg-info')
  for _pack in $_list; do
    _conf=$(cat "$_pack"/SOURCES.txt | sed -nr '/plugin.conf/p')
    if [ -n "$_conf" ]; then
      _name=$(cat "$_pack"/PKG-INFO | sed -n '/Name:/p' | sed -n -e 's/^.*\(agent-\)\(.*\)$/\2/p')
      install -Dm644 "$_pack"/../"$_conf" "$srcdir"/"$pkgname"/usr/install/etc/archipel/modules.d/"$_name".conf
    fi
  done;

  # Remove old init.d
  rm "$srcdir"/"$pkgname"/usr/install/etc/init.d -r
}

package() {
  # Copy Archipel packages and executables
  cp "$srcdir"/"$pkgname"/usr "$pkgdir"/usr -r

  # Install systemd service
  install -Dm644 "$srcdir"/Archipel/ArchipelAgent/archipel-agent/install/usr/lib/systemd/system/archipel-agent.service "$pkgdir"/usr/lib/systemd/system/archipel-agent.service

  # Create the target configuration and data directories
  install -dm0755 "$pkgdir"/etc/archipel "$pkgdir"/var/lib/archipel

  # Copy the configuration and data files
  cp "$srcdir"/"$pkgname"/usr/install/etc/archipel/* "$pkgdir"/etc/archipel -r

  cp "$srcdir"/"$pkgname"/usr/install/var/lib/archipel/* "$pkgdir"/var/lib/archipel -r
}
