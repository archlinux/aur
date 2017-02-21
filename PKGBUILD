# Maintainer: Tom Moore <t.moore01@gmail.com>
# Contributor: ReNoM <renom@list.ru>

# If you need the bundle, google VMware-ClientIntegrationPlugin-6.0.0.x86_64.bundle
#
# PS - This is suck a hack

pkgname=vmware-vsphere-web-client-plugin
pkgver=6.0.0
pkgrel=2
pkgdesc="Firefox and Chromium plugin, to access virtual machines console from vSphere Web Client. For make package, place VMware-ClientIntegrationPlugin-6.0.0.{your_arch}.bundle to PKGBUILD directory."
arch=('i686' 'x86_64')
url="http://www.vmware.com/"
license=('custom:vmware')
depends=(mozilla-common)
optdepends=(
'pipelight: for Mozilla Firefox Wine based Flash Player support'
'freshplayerplugin-git: for Mozilla Firefox PPAPI based Flash Player support'
'flash'
)
majverf=6.0.0
majver=60
majverdot=6.0
minvmrcver=1886719
vmrcver=5.5
vmrcverdot=5.5.0

[ "$CARCH" == "i686" ] && source=(VMware-ClientIntegrationPlugin-${majverf}.i386.bundle) && bundle_arch=i386 && larch=32
[ "$CARCH" == "x86_64" ] && source=(VMware-ClientIntegrationPlugin-${majverf}.x86_64.bundle) && bundle_arch=x86_64 && larch=64

[ "$CARCH" == "i686" ] && sha256sums=('a174a1c7a3e0c46d92c44e3aa23a232d44cacdfd2201bd96876a8972824fb095')
[ "$CARCH" == "x86_64" ] && sha256sums=('6f09173699c2e4ba30d101df55e8cfb89b9f73fff4e942b25fe5801f4778ed93')

build() {
  cd "$srcdir"
  sh ../VMware-ClientIntegrationPlugin-${majverf}.${bundle_arch}.bundle -x files

  ##### Ported from files/vmware-installer/.installer/2.1.0/vmware-installer.py around line 186
  ### Thanks vmware for not updating vmrc to 6.0
  SRC="$srcdir/files/vmware-vmrc-${vmrcver}"
  DEST="/usr/lib/vmware-vmrc/${vmrcver}"
  libconf=$DEST/'libconf'
  replace=('etc/pango/pangorc' 'etc/pango/pango.modules' 'etc/pango/pangox.aliases'
                 'etc/gtk-2.0/gdk-pixbuf.loaders' 'etc/gtk-2.0/gtk.immodules')
  templates=('@@LIBCONF_DIR@@')

  for i in "${replace[@]}"; do
    i="$SRC/libconf/$i"
    for template in "${templates[@]}"; do
       sed -e s,"$template","$libconf",g -i "$i"
    done
  done
}

package ()
{
        cd "$pkgdir"
        mkdir -p usr/lib/vmware-cip/${majverdot}/
        mkdir -p usr/lib/vmware-vmrc/${vmrcver}/
        mkdir -p usr/lib/mozilla/plugins
        mkdir -p etc/vmware-vmrc/${vmrcver}
        echo "libdir = \"/usr/lib/vmware-vmrc/${vmrcver}\"" > etc/vmware-vmrc/${vmrcver}/config
        # install cip
        install ${srcdir}/files/vmware-cip-60/npVMwareClientSupportPlugin-6-0-0.so "usr/lib/vmware-cip/${majverdot}/"
        mv "$srcdir/files/vmware-cip-${majver}/artwork" "usr/lib/vmware-cip/${majverdot}/"
        mv "$srcdir/files/vmware-cip-${majver}/filetransfer" "usr/lib/vmware-cip/${majverdot}/"
        chmod +x "usr/lib/vmware-cip/${majverdot}/filetransfer/fileTransfer"
        mv "$srcdir/files/vmware-cip-${majver}/ovftool" "usr/lib/vmware-cip/${majverdot}/"
        chmod +x "usr/lib/vmware-cip/${majverdot}/ovftool/ovftool"
        chmod +x "usr/lib/vmware-cip/${majverdot}/ovftool/ovftool.bin"
        ln -s "/usr/lib/vmware-cip/${majverdot}/npVMwareClientSupportPlugin-6-0-0.so" "usr/lib/mozilla/plugins/npVMwareClientSupportPlugin-6-0-0.so"
        # install vmrc
        install "$srcdir/files/vmware-vmrc-${vmrcver}/np-vmware-vmrc-${vmrcverdot}-${minvmrcver}-32.so" "usr/lib/vmware-vmrc/${vmrcver}/"
        install "$srcdir/files/vmware-vmrc-${vmrcver}/np-vmware-vmrc-${vmrcverdot}-${minvmrcver}-64.so" "usr/lib/vmware-vmrc/${vmrcver}/"
        install "$srcdir/files/vmware-vmrc-${vmrcver}/np-vmware-vmrc.so" "usr/lib/vmware-vmrc/${vmrcver}/"
        install "$srcdir/files/vmware-vmrc-${vmrcver}/open_source_licenses.txt" "usr/lib/vmware-vmrc/${vmrcver}/"
        install "$srcdir/files/vmware-vmrc-${vmrcver}/version.txt" "usr/lib/vmware-vmrc/${vmrcver}/"
        install "$srcdir/files/vmware-vmrc-${vmrcver}/vmware-desktop-entry-creator" "usr/lib/vmware-vmrc/${vmrcver}/"
        mv "$srcdir/files/vmware-vmrc-${vmrcver}/bin" "usr/lib/vmware-vmrc/${vmrcver}/"
        chmod -R +x "usr/lib/vmware-vmrc/${vmrcver}/bin/"
        mv "$srcdir/files/vmware-vmrc-${vmrcver}/lib" "usr/lib/vmware-vmrc/${vmrcver}/"
        mv "$srcdir/files/vmware-vmrc-${vmrcver}/libconf" "usr/lib/vmware-vmrc/${vmrcver}/"
        mv "$srcdir/files/vmware-vmrc-${vmrcver}/share" "usr/lib/vmware-vmrc/${vmrcver}/"
        mv "$srcdir/files/vmware-vmrc-${vmrcver}/xkeymap" "usr/lib/vmware-vmrc/${vmrcver}/"
        ln -s /usr/lib/vmware-vmrc/${vmrcver}/np-vmware-vmrc-${vmrcver}-${larch}.so usr/lib/mozilla/plugins/np-vmware-vmrc-${vmrcver}-${larch}.so
        ln -s /usr/lib/vmware-vmrc/${vmrcver}/bin/appLoader usr/lib/vmware-vmrc/${vmrcver}/bin/vmware-deviceMgr
        ln -s /usr/lib/vmware-vmrc//bin/appLoader usr/lib/vmware-vmrc/${vmrcver}/bin/vmware-vmrc
        ln -s /usr/lib/vmware-vmrc/${vmrcver}/bin/appLoader usr/lib/vmware-vmrc/${vmrcver}/bin/vmware-vmrc-daemon
        ln -s /usr/lib/vmware-vmrc/${vmrcver}/bin/vmware-deviceMgr usr/lib/vmware-vmrc/${vmrcver}/vmware-deviceMgr
        ln -s /usr/lib/vmware-vmrc/${vmrcver}/bin/vmware-vmrc usr/lib/vmware-vmrc/${vmrcver}/vmware-vmrc
        ln -s /usr/lib/vmware-vmrc/${vmrcver}/bin/vmware-vmrc-daemon usr/lib/vmware-vmrc/${vmrcver}/vmware-vmrc-daemon
}
sha256sums=('7ebec5d79aa9006c1aacf5413dce96ffb61154823b4700e132f044a80fc374c8')
