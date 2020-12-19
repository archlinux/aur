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
pkgver=7.0
_pkgver_arm=208
_pkgver_pc=209
_pkgrel_i686=6
_pkgrel_x86_64=9
_pkgrel_armv6h=1
_pkgrel_armv7h=2
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
sha512sums_x86_64=('352872c94bb82a70d2226da62294a9f773370a58de59b8e88e5626ee97a4a8a972ac5763c3378da962dc9b8b586b7c8634b0cbd19b808b3d03199d3293ba1a09')
sha512sums_i686=('9693b0e9a8eee73a75943ec97d4bc7269e34d2479035029c56fd2314b2a14e844a52f480341357d27d7dc20572490c120af5aa826b1ff9666c774e3ef702dd9c')
sha512sums_armv6h=('2f04275c8e1252293f6b2e18bfdea13fa7a43cfabb80cd4334b37d490a0d26c598ab829ac13781fc2b381f10ecb10039d30c9334f61c5c0fd94f27c166a457cd')
sha512sums_armv7h=('b35f52c8eaa4def119ec3ca7160eea7771fe758019ef8db8e8f79464114cafe7cdc8700fad234ba6cd1c2078c2be61102223904fe88a5ce47ff16074522287dc')
sha512sums_armv8h=('c18cfecae05ba9117117a27c4cd544ef73bbabb88af1f69473d6ff606ba50676ab59ec229a83a3e55bfd6ba9275bd9bb92037a813cde733cc9e6d55e2639f79e')
sha512sums_aarch64=('c18cfecae05ba9117117a27c4cd544ef73bbabb88af1f69473d6ff606ba50676ab59ec229a83a3e55bfd6ba9275bd9bb92037a813cde733cc9e6d55e2639f79e')
sha512sums_pentium4=('9693b0e9a8eee73a75943ec97d4bc7269e34d2479035029c56fd2314b2a14e844a52f480341357d27d7dc20572490c120af5aa826b1ff9666c774e3ef702dd9c')
source_x86_64=("http://download.nomachine.com/download/${pkgver}/Linux/${pkgname}_${pkgver}.${_pkgver_pc}_${_pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/${pkgver}/Linux/${pkgname}_${pkgver}.${_pkgver_pc}_${_pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/${pkgver}/Raspberry/${pkgname}_${pkgver}.${_pkgver_arm}_${_pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/${pkgver}/Raspberry/${pkgname}_${pkgver}.${_pkgver_arm}_${_pkgrel_armv7h}_armv7hl.tar.gz")
source_armv8h=("http://download.nomachine.com/download/${pkgver}/Raspberry/${pkgname}_${pkgver}.${_pkgver_arm}_${_pkgrel_armv8h}_aarch64.tar.gz")
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

