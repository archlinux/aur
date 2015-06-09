# Maintainer: shad0w73 <shad0w73@maills.de>
# Contributor: suppaman2 <suppaman2@gmail.com>
#

pkgname=clonk_rage
_orig=cr_full_linux
pkgver=4.9.10.7
pkgrel=1
pkgdesc="An entertaining, action-packed game of strategy, tactics, and skill."
arch=('i686' 'x86_64')
url="http://clonk.de"
license=('ISC' 'CCPL:by-nc' 'custom:trademark')
groups=('games')
md5sums=('a8bb948f02ac9d7950266c2ffbb7692a'
         'fca7370f1e9cb612edfc90b0f7d9d5ed'
         '56b7e0903752a933a94dd3038b50fc56'
         'bbeed581309eac14697d030f6ac295ab')
install=${pkgname}.install
changelog=ChangeLog

depends=('glu' 'libxpm' 'sdl_mixer' 'gtk2' 'libpng12'
         'libjpeg6-turbo' 'desktop-file-utils' 'timidity++')

source=("http://www.clonkx.de/rage/cr_full_linux.tar.bz2" \
        "clonk_rage.desktop" \
        "de_clonk.xml" \
        "clonk_rage.sh")

package() {

  # remove unneeded files
  rm "$srcdir"/$_orig/install.sh
  rm "$srcdir"/$_orig/uninstall.sh
  rm "$srcdir"/$_orig/OpenSSL.txt
  rm "$srcdir"/$_orig/LGPL.txt

  # create directories
  install -d "$pkgdir"/usr/share/licenses/clonk_rage
  install -d "$pkgdir"/usr/share/icons/hicolor/48x48/mimetypes
  install -d "$pkgdir"/opt

  # install licenses
  install -Dm644 "$srcdir"/$_orig/clonk_{content,trademark}_license.txt "$pkgdir"/usr/share/licenses/clonk_rage/
  rm "$srcdir"/$_orig/clonk_{content,trademark}_license.txt
  
  # install icons
  install -Dm644 "$srcdir"/$_orig/icons/cr.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/clonk_rage.png
  install -Dm644 "$srcdir"/$_orig/icons/c4{d,f,g,k,p,s,u}.png "$pkgdir"/usr/share/icons/hicolor/48x48/mimetypes/
  
  # choose binaries
  if [ "$CARCH" == "x86_64" ]; then
    mv -f "$srcdir"/$_orig/clonk64 "$srcdir"/$_orig/clonk
    mv -f "$srcdir"/$_orig/c4group64 "$srcdir"/$_orig/c4group
  else
    rm "$srcdir"/$_orig/clonk64
    rm "$srcdir"/$_orig/c4group64
  fi
  
  # move everything else (its about 100mb, so moving saves a lot of resources)
  rm -R "$srcdir"/$_orig/icons
  mv "$srcdir"/$_orig "$pkgdir"/opt/$pkgname
  chgrp -R games "$pkgdir"/opt/$pkgname
  chmod -R g+w "$pkgdir"/opt/$pkgname
  
  # chmod exec's
  chmod 774 "$pkgdir"/opt/$pkgname/clonk
  chmod 774 "$pkgdir"/opt/$pkgname/c4group
  
  # launch script
  install -Dm755 "$srcdir"/clonk_rage.sh "$pkgdir"/usr/bin/clonk_rage
  
  # c4group link
  ln -s /opt/clonk_rage/c4group "$pkgdir"/usr/bin/
  
  # desktop launcher
  install -Dm644 "$srcdir"/clonk_rage.desktop "$pkgdir"/usr/share/applications/clonk_rage.desktop
  
  # mime types
  install -Dm644 "$srcdir"/de_clonk.xml "$pkgdir"/usr/share/mime/packages/clonk_rage.xml

}
