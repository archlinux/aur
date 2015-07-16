# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Shanto <shanto@hotmail.com>

pkgname=archipel-agent
_pkgver=beta6
pkgver=0.6.0.beta
pkgrel=4
pkgdesc="A solution to manage and supervise virtual machines. (Agent)"
arch=(any)
url="http://archipelproject.org/"
license=('AGPL')
depends=(
  python2 python2-apscheduler python2-sqlalchemy python2-numpy python2-magic
  python2-ctypes python2-pubsub python2-imaging libvirt libvirt-python qemu
  xmpppy dnsmasq
)
makedepends=('python2-distribute')
optdepends=('ejabberd: An XMPP Server used by archipel for communication with VMs')
options=(!strip !emptydirs)
backup=("etc/archipel/archipel.conf")
install=$pkgname.install
source=("https://github.com/ArchipelProject/Archipel/zipball/@$_pkgver"
        "systemd.fix728.patch"
        "initinstall.patch")
md5sums=('d54db88eddeba782b52a8f1a55709325'
         '806b4169371ba03f36e0ac21b76bd944'
         '5be3048be2978421705b65f3e04e7768')

package() {
  cd `find "$srcdir" -type d -name ArchipelAgent -print -quit`
  # Backport of the fix for the bug
  # https://github.com/ArchipelProject/Archipel/issues/729
  patch -p1 < "$srcdir"/systemd.fix728.patch

  for mod in archipel-core archipel-agent-* archipel-agent; do
    pushd $mod 1>/dev/null
    python2 setup.py install --root="$pkgdir/" --optimize=1
    popd 1>/dev/null
  done;

  mkdir -p "$pkgdir/etc/systemd"
  mkdir -p "$pkgdir/usr/lib/systemd/system"

  cd "$pkgdir"
  patch -p1 < "$srcdir"/initinstall.patch
  "$pkgdir"/usr/bin/archipel-initinstall -p "$pkgdir" > /dev/null 2>&1
  rm -rf "$pkgdir/usr/install"
}

# vim:set ts=2 sw=2 et:
