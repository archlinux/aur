# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

### BUILD OPTIONS
# Set to n to disable nomachine service autostart
_autoservice=y
# Set to n to disable firewall autorules
_autofirewall=y
### END BUILD OPTIONS

pkgname=nomachine
pkgver=6.0.62
_pkgrel_i686=6
_pkgrel_x86_64=6
_pkgrel_armv6h=5
_pkgrel_armv7h=5
_pkgrel_armv8h=4
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'armv8h')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash' 'openssh')
sha512sums_x86_64=('5a9eb15cd4571ba018aff125a474e254a4993babaab6b1543407bfa6eb231cc92eb2bdf676c257692ffd900e6a25649529e98c7853ccb6694a18e2faea8078b6')
sha512sums_i686=('38d598162fb4ae68128ed04a5903973a969840e400cf0b78f93f8b99e6f1ada9d1df5408dedf82dbcf2a48c09baa3bea66c9a22bdc395282b49aafe4564e8b32')
sha512sums_armv6h=('5ffd2e6efa50566e9053ab9a33e52efd287f22bc7266e5240a8b8b4476d5cf35e80e927fc654a3bc70f5c9153adc9c936d4ace652f591ea6695fd675472805e8')
sha512sums_armv7h=('5a8e9e7519047dc82a337ac7826b8eafc00b4c323acb663e8955797fb32e7ebac0c90d1f5f71ea1e175ef0d8b5c9455a082507d3cec39c22eb37d2541a0d97fe')
sha512sums_armv8h=('fb421870286ed37ae4e3f87d7bab4da20ffd595157f4c23cbcc8e12437a04149bdff08f9e864726471d8975c9fc525143cfd2ec63a1289bc7b4f2d3ee61ac5b0')
source_x86_64=("http://download.nomachine.com/download/6.0/Linux/${pkgname}_${pkgver}_${_pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/6.0/Linux/${pkgname}_${pkgver}_${_pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/6.0/Linux/${pkgname}_${pkgver}_${_pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/6.0/Linux/${pkgname}_${pkgver}_${_pkgrel_armv7h}_armv7hl.tar.gz")
source_armv8h=("http://download.nomachine.com/download/6.0/Linux/${pkgname}_${pkgver}_${_pkgrel_armv8h}_aarch64.tar.gz")
install=nomachine.install

prepare()
{
#Fix Fedora Version Var
tar -zxf "$srcdir/NX/etc/NX/server/packages/nxclient.tar.gz" NX/scripts/setup/nxclient
sed -i 's/    majorFedoraVersion.*/    majorFedoraVersion=23/' "$srcdir/NX/scripts/setup/nxclient"
gzip -d "$srcdir/NX/etc/NX/server/packages/nxclient.tar.gz"
tar -rf "$srcdir/NX/etc/NX/server/packages/nxclient.tar" NX/scripts/setup/nxclient  -C "$srcdir/NX/scripts/setup/nxclient"
gzip "$srcdir/NX/etc/NX/server/packages/nxclient.tar"
rm -fr "$srcdir/NX/scripts"*
#Change Automatic Service Start And/Or Firewall Automatic Rules If Apply
if [ $_autoservice = y ] && [ $_autofirewall = y ]; then
echo "####################################################################"
echo "#No Changes To Automatic Service Start And Firewall Automatic Rules#"
echo "####################################################################"
else
tar -zxf "$srcdir/NX/etc/NX/server/packages/nxserver.tar.gz" NX/etc/server-fedora.cfg.sample
if [ $_autoservice = n ] && [ $_autofirewall = n ]; then
sed -i 's/#EnableFirewallConfiguration 1/EnableFirewallConfiguration 0/' NX/etc/server-fedora.cfg.sample
sed -i 's/#StartNXDaemon Automatic/StartNXDaemon Manual/' NX/etc/server-fedora.cfg.sample
elif [ $_autoservice = y ] && [ $_autofirewall = n ]; then
sed -i 's/#EnableFirewallConfiguration 1/EnableFirewallConfiguration 0/' NX/etc/server-fedora.cfg.sample
elif [ $_autoservice = n ] && [ $_autofirewall = y ]; then
sed -i 's/#StartNXDaemon Automatic/StartNXDaemon Manual/' NX/etc/server-fedora.cfg.sample
fi
gzip -d "$srcdir/NX/etc/NX/server/packages/nxserver.tar.gz"
tar -rf "$srcdir/NX/etc/NX/server/packages/nxserver.tar" NX/etc/server-fedora.cfg.sample -C "$srcdir/NX/etc/server-fedora.cfg.sample"
gzip "$srcdir/NX/etc/NX/server/packages/nxserver.tar"
rm -fr "$srcdir/NX/etc/server-fedora.cfg.sample"
fi
}

package()
{
cd "$srcdir"
mkdir "$srcdir/NX/etc" -p
install -d "$pkgdir/usr/"
cp -a NX "$pkgdir/usr/NX"
}

