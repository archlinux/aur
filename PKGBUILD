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
pkgver=8.7.1
_pkgvermain=8.7
_pkgrel_i686=1
_pkgrel_x86_64=1
_pkgrel_armv6h=1
_pkgrel_armv7h=1
_pkgrel_armv8h=1
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
depends=('bash' 'openssh' 'nawk' 'polkit' 'rpm-tools' 'dkms')
optdepends=('xorg-xauth: allows logging into a headless machine')
sha512sums_x86_64=('6ddd39d9ab3f27ccc0d926251ee12466724287d896f0303d30fd3145c7e8829f45aa5a60760b0a70e5936d7b19182b814ddb572b0f44fb17e283ef11ce2d1942')
sha512sums_i686=('87363071003d05dc760a8b1dbfc556d4b0162d40df7f20266ea9a27daeed33e2f3f7b788ba596e143f2096479253f2b8cc477191da2363a6d9266ed25bbb98c9')
sha512sums_armv6h=('27f3ccf5cab98ea29763c0af6de31139bb0880ad7ae1b462ad407f8069234576aff68bbc57d511c19cc3920001fed473f1a0db0f5b1d121e229be09f00e71411')
sha512sums_armv7h=('7763f3b00317a5db74e9c8145b473f28f5f6b5dea8df2ddaeba99364a0355eaa666681e325eef5e8fca442932c7c5e999d5b90cb523a2c6e7dba091a79cc9f02')
sha512sums_armv8h=('6713afa635a3488c90f10d9d0e6ef876e1913801138bc4431a15d4fdea30eac30d23acff0639d8c3c786f954d391d019921cdfa72f90299cca2c841cd7210a8f')
sha512sums_aarch64=('6713afa635a3488c90f10d9d0e6ef876e1913801138bc4431a15d4fdea30eac30d23acff0639d8c3c786f954d391d019921cdfa72f90299cca2c841cd7210a8f')
sha512sums_pentium4=('87363071003d05dc760a8b1dbfc556d4b0162d40df7f20266ea9a27daeed33e2f3f7b788ba596e143f2096479253f2b8cc477191da2363a6d9266ed25bbb98c9')
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
tar -zxf "$srcdir/NX/etc/NX/server/packages/nxrunner.tar.gz" NX/scripts/setup/nxrunner
sed -i 's/    majorFedoraVersion.*/    majorFedoraVersion=23/' "$srcdir/NX/scripts/setup/nxrunner"
tar -zxf "$srcdir/NX/etc/NX/server/packages/nxrunner.tar.gz" "NX/lib/"
for _libstdc in "$srcdir/NX/lib/"libstdc++.*; do
mv "${_libstdc}" ${_libstdc}.nomachine
done
gzip -d "$srcdir/NX/etc/NX/server/packages/nxrunner.tar.gz"
tar -rf "$srcdir/NX/etc/NX/server/packages/nxrunner.tar" NX/scripts/setup/nxrunner -C "$srcdir/NX/scripts/setup/nxrunner"
tar --delete -f "$srcdir/NX/etc/NX/server/packages/nxrunner.tar" "NX/lib/"
tar -rf "$srcdir/NX/etc/NX/server/packages/nxrunner.tar" "NX/lib/" -C "$srcdir/NX/lib/"
gzip "$srcdir/NX/etc/NX/server/packages/nxrunner.tar"
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

