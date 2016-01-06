# Maintainer: Ashwin Vishnu <ashuwish+arch at gmail dot com>

pkgname=sendanywhere
pkgver=1.12.18
pkgrel=2
pkgdesc="Direct file sharing across all platforms/devices. Send Anywhere is a multi-platform file sharing service where users can directly share digital content in real time."
arch=('i686' 'x86_64')
url="https://www.send-anywhere.com"
license=('custom:sendanywhere_eula')
provides=('sendanywhere')
makedepends=('binutils' 'tar' 'xdg-utils' 'desktop-file-utils')
install=$pkgname.install
depends_i686=('lib32-gtk2' 'lib32-libsm')
depends_x86_64=('gcc-libs>=4.6.3' 'glibc>=2.15' 'postgresql-libs' 'qt5-svg' 'gtk2')

if [[ $CARCH = i686 ]];then
    _filename="sendanywhere_latest_i386.deb"
    source_i686=("https://update.send-anywhere.com/linux_downloads/${_filename}")
    sha256sums_i686=('ffdac92b5cce6e48af1c6cde2d2917ac6432089e7c327ccb2be1f7800609a974')
else
    _filename="sendanywhere_latest_amd64.deb"
    source_x86_64=("https://update.send-anywhere.com/linux_downloads/${_filename}")
    sha256sums_x86_64=('ad0168f85fbc2f3051a630dbd1621d5c48b2f2d32cfd76c961da391b57a10122')
fi

_dpkg_x_alternative() {
   # Instead of 
   # dpkg -x "$srcdir/$_filename" "$pkgdir"
   cd $srcdir
   ar xv "$_filename"
   tar xJf data.tar.xz
   tar xzf control.tar.gz
   mv usr opt "$pkgdir"
}

package() {
   echo '==> Extracting debian package.'
   _dpkg_x_alternative

   echo '==> Verify MD5 checksums'
   cd ${pkgdir}
   md5sum -c ${srcdir}/md5sums

   echo '==> Copying license.'
   install -Dm644 "$pkgdir/usr/share/doc/sendanywhere/copyright"\
       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

