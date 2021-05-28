# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

### BUILD OPTIONS
# Set to y to enable nomachine service autostart
_autoservice=n
# Set to y to enable firewall autorules
_autofirewall=n
### END BUILD OPTIONS

pkgname=nomachine
pkgver=7.6.2
_pkgvermain=7.6
_pkgrel_i686=1
_pkgrel_x86_64=4
_pkgrel_armv6h=3
_pkgrel_armv7h=3
_pkgrel_armv8h=3
_pkgrel_aarch64=${_pkgrel_armv8h}
_pkgrel_pentium4=${_pkgrel_i686}
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'armv8h' 'aarch64' 'pentium4')
options=('!strip')
conflicts=('nxmanager' 'nxwebplayer' 'nxserver' 'nxnode' 'nxclient')
depends=('bash' 'openssh' 'nawk')
optdepends=('xorg-xauth: allows logging into a headless machine')
sha512sums_x86_64=('3fbf67ab36b0105d65338e3d04a7427ef0c1ad56b8139835410aa6dedf21542a23203c3dafe45677a327ea17e688c71bb6f6c557ecc48e08c2652cf84484fafb')
sha512sums_i686=('82c9a1776320213f5c647132342c11e4451cc98d149883bedbd84d9a3cbc515702e8b71f69a7c29cb92feaa9383f2be798d125dad9ef8da136f5ffa33f9a3889')
sha512sums_armv6h=('22b5ede5438564f6010230fb24757302628e628d31649af0e951009482b651b92c48aaee36b2eb0d0010e19bf8c64ba7f062c606137584675f761c7269086099')
sha512sums_armv7h=('68b176a09b84d9fab934ae8ff3df932fd7dfa4906e044fbf5dd4108f49b0469d452b7c757c770765798f3afef1d2f5a1a81dc41b1678a550c0dce1d2311ac68c')
sha512sums_armv8h=('561a30d251ee8c39f1e9e7c47bf84ab0270e4df5f9ef520d9fe2a48c68e671d3c859e188e4ca7f8780df08f73fc6b28d20b6dd234f927a06b20443e8c87ce041')
sha512sums_aarch64=('561a30d251ee8c39f1e9e7c47bf84ab0270e4df5f9ef520d9fe2a48c68e671d3c859e188e4ca7f8780df08f73fc6b28d20b6dd234f927a06b20443e8c87ce041')
sha512sums_pentium4=('82c9a1776320213f5c647132342c11e4451cc98d149883bedbd84d9a3cbc515702e8b71f69a7c29cb92feaa9383f2be798d125dad9ef8da136f5ffa33f9a3889')
source_x86_64=("http://download.nomachine.com/download/${_pkgvermain}/Linux/${pkgname}_${pkgver}_${_pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/${_pkgvermain}/Linux/${pkgname}_${pkgver}_${_pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/${_pkgvermain}/Raspberry/${pkgname}_${pkgver}_${_pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/${_pkgvermain}/Raspberry/${pkgname}_${pkgver}_${_pkgrel_armv7h}_armv7hl.tar.gz")
source_armv8h=("http://download.nomachine.com/download/${_pkgvermain}/Raspberry/${pkgname}_${pkgver}_${_pkgrel_armv8h}_aarch64.tar.gz")
source_aarch64=("${source_armv8h[@]}")
source_pentium4=("${source_i686[@]}")
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
echo "##################################################################"
echo "#Enabling Automatic Service Start And Firewall Automatic Rules#"
echo "##################################################################"
elif [ $_autoservice = y ] && [ $_autofirewall = n ]; then
echo "#####################################"
echo "#Enabling Automatic Service Start#"
echo "#####################################"
tar -zxf "$srcdir/NX/etc/NX/server/packages/nxserver.tar.gz" NX/etc/server-fedora.cfg.sample
sed -i 's/#EnableFirewallConfiguration 1/EnableFirewallConfiguration 0/' NX/etc/server-fedora.cfg.sample
gzip -d "$srcdir/NX/etc/NX/server/packages/nxserver.tar.gz"
tar -rf "$srcdir/NX/etc/NX/server/packages/nxserver.tar" NX/etc/server-fedora.cfg.sample -C "$srcdir/NX/etc/server-fedora.cfg.sample"
gzip "$srcdir/NX/etc/NX/server/packages/nxserver.tar"
rm -fr "$srcdir/NX/etc/server-fedora.cfg.sample"
elif [ $_autoservice = n ] && [ $_autofirewall = y ]; then
echo "######################################"
echo "#Enabling Firewall Automatic Rules#"
echo "######################################"
tar -zxf "$srcdir/NX/etc/NX/server/packages/nxserver.tar.gz" NX/etc/server-fedora.cfg.sample
sed -i 's/#StartNXDaemon Automatic/StartNXDaemon Manual/' NX/etc/server-fedora.cfg.sample
gzip -d "$srcdir/NX/etc/NX/server/packages/nxserver.tar.gz"
tar -rf "$srcdir/NX/etc/NX/server/packages/nxserver.tar" NX/etc/server-fedora.cfg.sample -C "$srcdir/NX/etc/server-fedora.cfg.sample"
gzip "$srcdir/NX/etc/NX/server/packages/nxserver.tar"
rm -fr "$srcdir/NX/etc/server-fedora.cfg.sample"
elif [ $_autoservice = n ] && [ $_autofirewall = n ]; then
echo "###################################################################"
echo "#Disabling Automatic Service Start And Firewall Automatic Rules#"
echo "###################################################################"
tar -zxf "$srcdir/NX/etc/NX/server/packages/nxserver.tar.gz" NX/etc/server-fedora.cfg.sample
sed -i 's/#EnableFirewallConfiguration 1/EnableFirewallConfiguration 0/' NX/etc/server-fedora.cfg.sample
sed -i 's/#StartNXDaemon Automatic/StartNXDaemon Manual/' NX/etc/server-fedora.cfg.sample
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

