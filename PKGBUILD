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
pkgver=6.2.4
_pkgrel_i686=1
_pkgrel_x86_64=1
_pkgrel_armv6h=1
_pkgrel_armv7h=1
_pkgrel_armv8h=1
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'armv8h')
options=('!strip')
conflicts=('nxmanager' 'nxwebplayer' 'nxserver' 'nxnode' 'nxclient')
depends=('bash' 'openssh')
sha512sums_x86_64=('a6468143273723fb16cbc360b6da63bdf27b87038f561dc6444149409a471fa65805054b2bcbb3d31aac5353e671fd837706651e1832c9d579426dd88338975f')
sha512sums_i686=('498a6bac3be7cd4d58a7337a8926a8a12baf7e8bbbb11506a3fb1f8a93b2683a9ad62e9dce9a605df12e4cf7ac3a4802e97224eb381949c41675da163df3faff')
sha512sums_armv6h=('ea2484ff5ff333a066e72d4db34c1980e426a1b926f6299f67d091dec6abc9d0d75acf14245a11c301133f3b7fa33c332fc7198ec45851a3e53c9bc5bc73801e')
sha512sums_armv7h=('8619e8dbc5fc88040dcc5cb14a1a640aa1f50e7c0454e7e6a3a6f1bc544fb0067619f3c20b8d0a645559158a87f387d9968900efe43db6eb1c9a2184bce823d7')
sha512sums_armv8h=('a52dd546402aab86b361ff4ea4ea38355708859b9b1cd4ee2409e8263bea892f6322f43fa07015b1e26a9dd177ff6b5e834111e7d651898cd724e735d847b977')
source_x86_64=("http://download.nomachine.com/download/6.2/Linux/${pkgname}_${pkgver}_${_pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/6.2/Linux/${pkgname}_${pkgver}_${_pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/6.2/Raspberry/${pkgname}_${pkgver}_${_pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/6.2/Raspberry/${pkgname}_${pkgver}_${_pkgrel_armv7h}_armv7hl.tar.gz")
source_armv8h=("http://download.nomachine.com/download/6.2/Raspberry/${pkgname}_${pkgver}_${_pkgrel_armv8h}_aarch64.tar.gz")
install=nomachine.install

prepare()
{
#Fix Fedora Version Var And Libstdc++ Rename
tar -zxf "$srcdir/NX/etc/NX/server/packages/nxclient.tar.gz" NX/scripts/setup/nxclient
sed -i 's/    majorFedoraVersion.*/    majorFedoraVersion=23/' "$srcdir/NX/scripts/setup/nxclient"
tar -zxf "$srcdir/NX/etc/NX/server/packages/nxclient.tar.gz" "NX/lib/"
for _libstdc in "$srcdir/NX/lib/"libstdc++.*; do
mv "${_libstdc}" ${_libstdc}.nomachine
done
gzip -d "$srcdir/NX/etc/NX/server/packages/nxclient.tar.gz"
tar -rf "$srcdir/NX/etc/NX/server/packages/nxclient.tar" NX/scripts/setup/nxclient -C "$srcdir/NX/scripts/setup/nxclient"
tar --delete -f "$srcdir/NX/etc/NX/server/packages/nxclient.tar" "NX/lib/"
tar -rf "$srcdir/NX/etc/NX/server/packages/nxclient.tar" "NX/lib/" -C "$srcdir/NX/lib/"
gzip "$srcdir/NX/etc/NX/server/packages/nxclient.tar"
rm -fr "$srcdir/NX/scripts"*
rm -fr "$srcdir/NX/lib"*
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

