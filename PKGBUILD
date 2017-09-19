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
pkgver=5.3.12
_pkgrel_i686=10
_pkgrel_x86_64=10
_pkgrel_armv6h=3
_pkgrel_armv7h=1
_pkgrel_armv8h=1
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'armv8h')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash' 'openssh')
sha512sums_x86_64=('8cb7470b41beb215a43be19f493e415726795618c9af1e63c2d16b8026ec133b65599e1c3eba77aa7d08b019939676e3773085b668fdbd081a079fa2572d2e9e')
sha512sums_i686=('7ce0b77da438132acab4e05562f676c30054ef38242d418ad69e9caf371a47ab624be89634cc105023be51d1aa822b743fb629114caa2c4d461bae8dabb0965d')
sha512sums_armv6h=('38c3aefb753a432d209193eb419ae60cf18661d661f6bc398bb518973b13ef268457a91100dbc63ca82b5d9fa801af5da283e3722a669b1cafc0efcd64322c7b')
sha512sums_armv7h=('c758e802c1752f563027e0ca14f2443404b5a1dca6538273e89f9de05be0c850b60e662c9f654ca155ef7c8c6a1c752cc14d162e66b042fac5bcdcb50bad1aba')
sha512sums_armv8h=('2ff365c4f96baa9a2bab64e76c6c0bb17361394f036b797463143525268c7a8ad9fb1911b1ee796993ae54882f7ba1ce902c9dc3e4bb1732b9257990d977d203')
source_x86_64=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${_pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${_pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${_pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${_pkgrel_armv7h}_armv7hl.tar.gz")
source_armv8h=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${_pkgrel_armv8h}_aarch64.tar.gz")
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

