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
pkgver=6.9.2
_pkgrel_i686=1
_pkgrel_x86_64=1
_pkgrel_armv6h=1
_pkgrel_armv7h=3
_pkgrel_armv8h=1
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'armv8h')
options=('!strip')
conflicts=('nxmanager' 'nxwebplayer' 'nxserver' 'nxnode' 'nxclient')
depends=('bash' 'openssh' 'nawk')
optdepends=('xorg-xauth: allows logging into a headless machine')
sha512sums_x86_64=('ce9bb3543c47af91dc88183ca1a86e23a7c816aaaa5849806fc933470e70fa8b7a49fdb4a3aa1e707d77ada00c6fc7b6a6a9f7cecf06abffbc184828a17f3868')
sha512sums_i686=('5300349693013274812069d45689642cf0418df75607feb7540b9db01c64a722cb31f755409aa823179a23ac24ad8dd586d647cca961d990065dfc9cdb10a502')
sha512sums_armv6h=('6fcaf13e47502928b02e1293f9831518197e920f95521d0caf5528e236321df30f9a8ea5dab639dfa0e4c465311295ce4d30e9348fb376da20940ee64f1e9fe0')
sha512sums_armv7h=('ed4979fb9111d1ba448beca3d0c407378ef6df50b7dac924f87bb2b9ffd26c8cbe75125b65e53fc21b85cf0f70e89857e20f74ad20657142d2adea77a2b0266a')
sha512sums_armv8h=('c36ab5ea5f51809b303d3d9bf440ada961d029a2188a7806649c2d326859620b863c23d5691d4cb1375f458b7ef5bf859c23537766870c557a2f397ccaf43e0d')
source_x86_64=("http://download.nomachine.com/download/6.9/Linux/${pkgname}_${pkgver}_${_pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/6.9/Linux/${pkgname}_${pkgver}_${_pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/6.9/Raspberry/${pkgname}_${pkgver}_${_pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/6.9/Raspberry/${pkgname}_${pkgver}_${_pkgrel_armv7h}_armv7hl.tar.gz")
source_armv8h=("http://download.nomachine.com/download/6.9/Raspberry/${pkgname}_${pkgver}_${_pkgrel_armv8h}_aarch64.tar.gz")
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

