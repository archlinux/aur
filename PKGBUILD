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
pkgver=5.3.10
pkgrel_i686=7
pkgrel_x86_64=6
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
source=('fixnxusb.patch')
sha512sums=('3680f376ae603fcbe8ad2c68c8f3c8c19798b914fd7fd29c6d57e03dae8f0a09b832c5886ad24fd3c33ad680c5975235665c55cc4908552178c731d475095195')
sha512sums_x86_64=('d2f39cc514fcf33d9993832c432e7d2fe2a55fb5dfec67f57c830a2878f9a12a9b4431be00ad6f5c5eeda7badba0a68042400fbfe810300df603a853940b8373')
sha512sums_i686=('da8d80d7aeea0edc5e719fd8fd4eec501605d09baaef0ac1ac8fbfac8dc324653a11e751bc93f4d6c01af2077e663c9a36b425a9d979d1774860355397be4af3')
sha512sums_armv6h=('623f7aed249219dcb006568d61062b6c1fe1bf99a135dac23901635a0e5c6261c8bbdd5807b0421402a7185c051f3bedfe5b14194567f77f2e2e686efdfe3ed7')
sha512sums_armv7h=('424fb5bc196e79db32b61c32d0da55d7cdb0b0854e0080713a039db2f3d6fd7f2f291db6aadb08a1368fc4d4dd57d93b4cb8ebf00b2b95d5a278f67420f61265')
sha512sums_armv8h=('6c0777083bcb2e4972ea99b2d289c8a7f02b216d2ebcbedeaa82553a691d0ae6eb01a9ae7974147420638735b0602d802a97c7e361e1beb1ace9df5a737305aa')
source_x86_64=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${pkgrel_armv7h}_armv7hl.tar.gz")
source_armv8h=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${pkgrel_armv8h}_aarch64.tar.gz")
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
#Fix nxusb share
tar -zxf $srcdir/NX/etc/NX/server/packages/nxclient.tar.gz NX/share/src/nxusb/message_queue.c
tar -zxf $srcdir/NX/etc/NX/server/packages/nxclient.tar.gz NX/share/src/nxusb/utils.h
cd ${srcdir}/NX/share/src/nxusb
patch -Np1 -i $srcdir/fixnxusb.patch
cd ${srcdir}
gzip -d $srcdir/NX/etc/NX/server/packages/nxclient.tar.gz
tar -rf $srcdir/NX/etc/NX/server/packages/nxclient.tar NX/share/src/nxusb/message_queue.c -C $srcdir/NX/share/src/nxusb/message_queue.c
tar -rf $srcdir/NX/etc/NX/server/packages/nxclient.tar NX/share/src/nxusb/utils.h -C $srcdir/NX/share/src/nxusb/utils.h
gzip $srcdir/NX/etc/NX/server/packages/nxclient.tar
rm -fr $srcdir/NX/share*
}

package()
{
cd "$srcdir"
mkdir "$srcdir/NX/etc" -p
install -d "$pkgdir/usr/"
cp -a NX "$pkgdir/usr/NX"
}

