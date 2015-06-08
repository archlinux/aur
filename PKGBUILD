# Contributor: ReNoM <renom@list.ru>
pkgname=vmware-vsphere-web-client-plugin
pkgver=5.5.0.1896274
pkgrel=2
pkgdesc="Firefox and Chromium plugin, to access virtual machines console from vSphere Web Client. For make package, place VMware-ClientIntegrationPlugin-5.5.0.{your_arch}.bundle to PKGBUILD directory."
arch=('i686' 'x86_64')
url="http://www.vmware.com/"
license=('custom:vmware')
depends=(mozilla-common)
optdepends=(
'chromium-npapi: for Chromium support'
'chromium-pepper-flash: for Chromium PPAPI based Flash Player support'
'pipelight: for Mozilla Firefox Wine based Flash Player support'
'freshplayerplugin-git: for Mozilla Firefox PPAPI based Flash Player support'
)
majverf=5.5.0
majver=5.5
minver=1896274

[ "$CARCH" == "i686" ] && source=(VMware-ClientIntegrationPlugin-${majverf}.i386.bundle) && bundle_arch=i386 && larch=32
[ "$CARCH" == "x86_64" ] && source=(VMware-ClientIntegrationPlugin-${majverf}.x86_64.bundle) && bundle_arch=x86_64 && larch=64

[ "$CARCH" == "i686" ] && sha256sums=('a174a1c7a3e0c46d92c44e3aa23a232d44cacdfd2201bd96876a8972824fb095')
[ "$CARCH" == "x86_64" ] && sha256sums=('6f09173699c2e4ba30d101df55e8cfb89b9f73fff4e942b25fe5801f4778ed93')

build() {
  cd "$srcdir"
  sh ../VMware-ClientIntegrationPlugin-${majverf}.${bundle_arch}.bundle -x files

  ##### Ported from files/vmware-installer/.installer/2.1.0/vmware-installer.py around line 186
  SRC="$srcdir/files/vmware-vmrc-$majver"
  DEST="/usr/lib/vmware-vmrc/$majver"
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
        mkdir -p usr/lib/vmware-cip/${majver}/
        mkdir -p usr/lib/vmware-vmrc/${majver}/
        mkdir -p usr/lib/mozilla/plugins
        mkdir -p etc/vmware-vmrc/${majver}
        echo "libdir = \"/usr/lib/vmware-vmrc/$majver\"" > etc/vmware-vmrc/${majver}/config
        # install cip
        install ${srcdir}/files/vmware-cip-55/npVMwareClientSupportPlugin-5-5-0.so "usr/lib/vmware-cip/$majver/"
        mv "$srcdir/files/vmware-cip-55/artwork" "usr/lib/vmware-cip/$majver/"
        mv "$srcdir/files/vmware-cip-55/filetransfer" "usr/lib/vmware-cip/$majver/"
        chmod +x "usr/lib/vmware-cip/$majver/filetransfer/fileTransfer"
        mv "$srcdir/files/vmware-cip-55/ovftool" "usr/lib/vmware-cip/$majver/"
        chmod +x "usr/lib/vmware-cip/$majver/ovftool/ovftool"
        chmod +x "usr/lib/vmware-cip/$majver/ovftool/ovftool.bin"
        ln -s "/usr/lib/vmware-cip/$majver/npVMwareClientSupportPlugin-5-5-0.so" "usr/lib/mozilla/plugins/npVMwareClientSupportPlugin-5-5-0.so"
        # install vmrc
        install "$srcdir/files/vmware-vmrc-$majver/np-vmware-vmrc-$majverf-$minver-32.so" "usr/lib/vmware-vmrc/$majver/"
        install "$srcdir/files/vmware-vmrc-$majver/np-vmware-vmrc-$majverf-$minver-64.so" "usr/lib/vmware-vmrc/$majver/"
        install "$srcdir/files/vmware-vmrc-$majver/np-vmware-vmrc.so" "usr/lib/vmware-vmrc/$majver/"
        install "$srcdir/files/vmware-vmrc-$majver/open_source_licenses.txt" "usr/lib/vmware-vmrc/$majver/"
        install "$srcdir/files/vmware-vmrc-$majver/version.txt" "usr/lib/vmware-vmrc/$majver/"
        install "$srcdir/files/vmware-vmrc-$majver/vmware-desktop-entry-creator" "usr/lib/vmware-vmrc/$majver/"
        mv "$srcdir/files/vmware-vmrc-$majver/bin" "usr/lib/vmware-vmrc/$majver/"
        chmod -R +x "usr/lib/vmware-vmrc/$majver/bin/"
        mv "$srcdir/files/vmware-vmrc-$majver/lib" "usr/lib/vmware-vmrc/$majver/"
        mv "$srcdir/files/vmware-vmrc-$majver/libconf" "usr/lib/vmware-vmrc/$majver/"
        mv "$srcdir/files/vmware-vmrc-$majver/share" "usr/lib/vmware-vmrc/$majver/"
        mv "$srcdir/files/vmware-vmrc-$majver/xkeymap" "usr/lib/vmware-vmrc/$majver/"
        ln -s /usr/lib/vmware-vmrc/${majver}/np-vmware-vmrc-${majverf}-$minver-${larch}.so usr/lib/mozilla/plugins/np-vmware-vmrc-${majverf}-1601065-${larch}.so
        ln -s /usr/lib/vmware-vmrc/${majver}/bin/appLoader usr/lib/vmware-vmrc/${majver}/bin/vmware-deviceMgr
        ln -s /usr/lib/vmware-vmrc/${majver}/bin/appLoader usr/lib/vmware-vmrc/${majver}/bin/vmware-vmrc
        ln -s /usr/lib/vmware-vmrc/${majver}/bin/appLoader usr/lib/vmware-vmrc/${majver}/bin/vmware-vmrc-daemon
        ln -s /usr/lib/vmware-vmrc/${majver}/bin/vmware-deviceMgr usr/lib/vmware-vmrc/${majver}/vmware-deviceMgr
        ln -s /usr/lib/vmware-vmrc/${majver}/bin/vmware-vmrc usr/lib/vmware-vmrc/${majver}/vmware-vmrc
        ln -s /usr/lib/vmware-vmrc/${majver}/bin/vmware-vmrc-daemon usr/lib/vmware-vmrc/${majver}/vmware-vmrc-daemon
}
