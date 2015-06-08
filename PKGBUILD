# Maintainer: Ruthger Gubbels <aur@ruthger.nl>

pkgname='archipel-central-agent-git'
_realname=Archipel
pkgver=beta6.r389.gc7f7fa6
pkgrel=1
pkgdesc='A solution to manage and supervise virtual machines. (Central Agent)'
arch=('any')
url='http://archipelproject.org/'
license=('AGPL')
depends=('archipel-agent')
makedepends=('python2-setuptools>=3.4' 'git')
optdepends=('ejabberd: An XMPP Server used by archipel for communication with VMs')
provides=('archipel-central-agent')
conflicts=('archipel-central-agent')
backup=('etc/archipel/archipel-central-agent.conf' 
        'etc/archipel/central-agent-modules.d/centraldb.conf' 
        'etc/archipel/central-agent-modules.d/platformrequest.conf'
        'etc/archipel/central-agent-modules.d/xmppserver.conf'
)
options=(!strip !emptydirs)
install='install'
source=('git://github.com/ArchipelProject/Archipel.git'
        'git://github.com/ArchipelProject/xmpppy.git'
)
sha512sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_realname" 
  git describe --tags | sed 's/^@//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$srcdir"/"$_realname"
  git submodule init >> /dev/null
  git config submodule.ArchipelAgent/archipel-core/archipelcore/xmpp.url "$srcdir"/xmpppy >> /dev/null
  git submodule update "$srcdir"/Archipel/ArchipelAgent/archipel-core/archipelcore/xmpp >> /dev/null
}

build() {
  cd "$srcdir"/Archipel/ArchipelAgent/archipel-central-agent
  python2 setup.py install --root="$srcdir/$pkgname" --optimize=1 egg_info -b beta 1>/dev/null

  cd "$srcdir"/Archipel/ArchipelAgent/archipel-central-agent-platformrequest
  python2 setup.py install --root="$srcdir/$pkgname" --optimize=1 egg_info -b beta 1>/dev/null

  # Replace python with python2
  sed -i 's/\/usr\/bin\/python /\/usr\/bin\/python2 /' $srcdir/"$pkgname"/usr/bin/*

  # Copy modules.d conf files
  install -Dm600 "$srcdir"/Archipel/ArchipelAgent/archipel-agent-xmppserver/archipelagentxmppserver/configuration/plugin.conf "$srcdir"/"$pkgname"/usr/install/etc/archipel/central-agent-modules.d/xmppserver.conf
  install -Dm644 "$srcdir"/Archipel/ArchipelAgent/archipel-agent-centraldb/archipelagentcentraldb/configuration/plugin.conf "$srcdir"/"$pkgname"/usr/install/etc/archipel/central-agent-modules.d/centraldb.conf
  _list=$(find "$srcdir"/"$pkgname"/usr/lib/ -type d -name '*.egg-info')
  for _pack in $_list; do
    _conf=$(cat "$_pack"/SOURCES.txt | sed -nr '/plugin.conf/p')
    if [ -n "$_conf" ]; then
      _name=$(cat "$_pack"/PKG-INFO | sed -n '/Name:/p' | sed -n -e 's/^.*\(agent-\)\(.*\)$/\2/p')
      install -Dm644 "$_pack"/../"$_conf" "$srcdir"/"$pkgname"/usr/install/etc/archipel/central-agent-modules.d/"$_name".conf
    fi
  done;

  # Remove old init.d
  rm "$srcdir"/"$pkgname"/usr/install/etc/init.d -r
}

package() {
  # Copy Archipel packages and executables
  cp "$srcdir"/"$pkgname"/usr "$pkgdir"/usr -r

  # Install systemd service
  install -Dm644 "$srcdir"/Archipel/ArchipelAgent/archipel-central-agent/install/usr/lib/systemd/system/archipel-central-agent.service "$pkgdir"/usr/lib/systemd/system/archipel-central-agent.service

  # Create the target configuration and data directories
  install -dm0755 "$pkgdir"/etc/archipel "$pkgdir"/var/lib/archipel

  # Copy the configuration and data files
  cp "$srcdir"/"$pkgname"/usr/install/etc/archipel/* "$pkgdir"/etc/archipel -r
  cp "$srcdir"/"$pkgname"/usr/install/var/lib/archipel/* "$pkgdir"/var/lib/archipel -r
}
