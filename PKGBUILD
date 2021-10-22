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
pkgver=7.7.4
_pkgvermain=7.7
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
depends=('bash' 'openssh' 'nawk')
optdepends=('xorg-xauth: allows logging into a headless machine')
sha512sums_x86_64=('b710f0bcc68723ccfb305da988afdf70c6dc591142990399c68149b7d8908301e97aad44343945404b0384d9691282eac7e16a3217f807e24a8eb0926895ab43')
sha512sums_i686=('2c431f6a388740a21821bafaaed2deb91bfeac13514765b6ee069245ccf50a2035343279301c8129ad9e40dec58db5ff65689312dfc64ea352ee3342632d74d4')
sha512sums_armv6h=('2975a1c67c55f53e7cfa78e80da590ec324287993f76aa425606d06019cdb1a62d7b83615a8b1b24f5196eac3f6e1b1969b2b6013d389c662f71f0faf6dd7017')
sha512sums_armv7h=('4ae8d1773f8f2b83757aeba8482b03b42a8d4c45609332d733eca87c7bb6cd5ab59ef6de6e95d97304da56299140c4a1cdd057b929e08bc268feb1c67ee9df68')
sha512sums_armv8h=('7546f597b80afebbb1d8a052c7d8267a87989d8cd6907d7000a157aba69020e30a0466fed83f0ae6b82e69332182fc7ee0605ebab33c263ae6f4efbbd1ce6698')
sha512sums_aarch64=('7546f597b80afebbb1d8a052c7d8267a87989d8cd6907d7000a157aba69020e30a0466fed83f0ae6b82e69332182fc7ee0605ebab33c263ae6f4efbbd1ce6698')
sha512sums_pentium4=('2c431f6a388740a21821bafaaed2deb91bfeac13514765b6ee069245ccf50a2035343279301c8129ad9e40dec58db5ff65689312dfc64ea352ee3342632d74d4')
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

