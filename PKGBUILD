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
pkgver=5.3.9
pkgrel_i686=5
pkgrel_x86_64=6
pkgrel_armv6h=3
pkgrel_armv7h=1
pkgrel_armv8h=3
pkgrel=2
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
sha512sums_x86_64=('dca7d519f6c0d62625f2c6b78c0df1fb07019f09c40e60e6662e6af82348bc82abc92162bcaaa7c170556e15b5e8b177f1b563015f14c66081904708d24cc9b0')
sha512sums_i686=('00a53f377c0f17910d374ba7121c1eb895f26821b6aae15e188c8e654b81b7e3b37744dc9a50a0356277134004a54a5aa9ad45e3d8273a7dcfa4e46bccf8fd24')
sha512sums_armv6h=('5493228bc567f9bf52b9efb223479f05d4665b4c64c39a4b3a500555b3dcba2a069fdfc46b763c083bc93e8650f4f1479c42105bd2bd762f553ee28176f8c7ee')
sha512sums_armv7h=('f62d5c6e25c49fe92045e8c54075e2abea46950d411d9311f507596e36677d61cbde84416828d58b84bf9935877290089de7a1ee1d32e886e4e076b0c8a43037')
sha512sums_armv8h=('a3ec737d7e9a0fc0b3b368ef4674d4515863b2e90fa87eb75ec364e9bc8f9dbf183f65d248828e988fc63494f9a2c9035ff2b2836a8b529a13d4d7826e86c497')
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

