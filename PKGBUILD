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
pkgver=5.2.11
pkgrel_i686=1
pkgrel_x86_64=1
pkgrel_armv6h=1
pkgrel_armv7h=1
pkgrel_armv8h=1
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'armv8h')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash' 'openssh')
sha512sums_x86_64=('375146a0cb61203df22c5b8077c71d7c6113ceb9c622ec52ecb367db0f1cadd09b18d99b5ca1df07f0c4ae9d97d3d142fa2bc2cbcddb8977696eafd061e44ed8')
sha512sums_i686=('052713b07640fbb4930a72904833bed963c241ddc3b0d1714295290424a50af1b370f22db28330a798dcd237878a6dc68102df84f46321c0bc39ca3c21d03470')
sha512sums_armv6h=('a7299dae94dd0df9060331a5176cf2c22ce5d3384f697375034c379ef33f4efaaa5ed4d7a999366229f1b1083c3345119b3927f3a6cec92602047e8fe0ac4268')
sha512sums_armv7h=('18f03f927d993c2ff66540f0dcb53cb3cd8ceb628307fa2a335951d988e731c1f09d524d61864b57ec6a240f1acbbf12e8c0a78d9ef3e699a7185a72f6e07810')
sha512sums_armv8h=('c07251568619de8a09982e12b832a88df6f94c579af67385b915cb1bbc031832f675086d6636fbd01f84cf696817d800c772a1904f8e2490c653565f64f1867a')
source_x86_64=("http://download.nomachine.com/download/5.2/Linux/${pkgname}_${pkgver}_${pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/5.2/Linux/${pkgname}_${pkgver}_${pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/5.2/Linux/${pkgname}_${pkgver}_${pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/5.2/Linux/${pkgname}_${pkgver}_${pkgrel_armv7h}_armv7hl.tar.gz")
source_armv8h=("http://download.nomachine.com/download/5.2/Linux/${pkgname}_${pkgver}_${pkgrel_armv8h}_aarch64.tar.gz")
install=nomachine.install

prepare()
{
#Fix Fedora Version Var
tar -zxf $srcdir/NX/etc/NX/server/packages/nxclient.tar.gz NX/scripts/setup/nxclient
sed -i 's/    majorFedoraVersion.*/    majorFedoraVersion=23/' $srcdir/NX/scripts/setup/nxclient
gzip -d $srcdir/NX/etc/NX/server/packages/nxclient.tar.gz
tar -rf $srcdir/NX/etc/NX/server/packages/nxclient.tar NX/scripts/setup/nxclient  -C $srcdir/NX/scripts/setup/nxclient
gzip $srcdir/NX/etc/NX/server/packages/nxclient.tar
rm -fr $srcdir/NX/scripts*
#Change Automatic Service Start And/Or Firewall Automatic Rules If Apply
if [ $_autoservice = y ] && [ $_autofirewall = y ]; then
echo "####################################################################"
echo "#No Changes To Automatic Service Start And Firewall Automatic Rules#"
echo "####################################################################"
else
tar -zxf $srcdir/NX/etc/NX/server/packages/nxserver.tar.gz NX/etc/server-fedora.cfg.sample
if [ $_autoservice = n ] && [ $_autofirewall = n ]; then
sed -i 's/#EnableFirewallConfiguration 1/EnableFirewallConfiguration 0/' NX/etc/server-fedora.cfg.sample
sed -i 's/#StartNXDaemon Automatic/StartNXDaemon Manual/' NX/etc/server-fedora.cfg.sample
elif [ $_autoservice = y ] && [ $_autofirewall = n ]; then
sed -i 's/#EnableFirewallConfiguration 1/EnableFirewallConfiguration 0/' NX/etc/server-fedora.cfg.sample
elif [ $_autoservice = n ] && [ $_autofirewall = y ]; then
sed -i 's/#StartNXDaemon Automatic/StartNXDaemon Manual/' NX/etc/server-fedora.cfg.sample
fi
gzip -d $srcdir/NX/etc/NX/server/packages/nxserver.tar.gz
tar -rf $srcdir/NX/etc/NX/server/packages/nxserver.tar NX/etc/server-fedora.cfg.sample -C $srcdir/NX/etc/server-fedora.cfg.sample
gzip $srcdir/NX/etc/NX/server/packages/nxserver.tar
rm -fr $srcdir/NX/etc/server-fedora.cfg.sample
fi
}

package()
{
cd "$srcdir"
mkdir "$srcdir/NX/etc" -p
install -d "$pkgdir/usr/"
cp -a NX "$pkgdir/usr/NX"
}

