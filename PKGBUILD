# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgbase=nx
pkgname=('libxcomp' 'nxproxy' 'nx-x11' 'nxagent' 'nx-headers')
pkgver=3.5.99.26
pkgrel=1
arch=('x86_64')
url="https://arctica-project.org"
#url="https://wiki.x2go.org/doku.php"
license=('GPL')
# https://github.com/ArcticaProject/nx-libs/blob/3.6.x/nx-libs.spec
makedepends=(# runtime dependencies from subpackages
             'libjpeg-turbo' 'libpng' 'gcc-libs'
             'libxml2' 'xkeyboard-config' 'xorg-xkbcomp'
             'xorg-xkbcomp' 'libxfont2' 'libxinerama'
             'xorg-font-util'  'pixman'
             'libxrandr' 'libxtst' 'libxcomposite' 'libxpm' 'libxdamage'
             # make dependencies
             'xorgproto' 'imake'
)
source=(https://github.com/ArcticaProject/nx-libs/archive/$pkgver/nx-libs-$pkgver.tar.gz
        0001-nx-libs-ar.patch)
sha256sums=('3ce7ca4e6b57b3a2d7588b2d0f4009036d2566a8925ca2c62f08a8dc0df50357'
            '0a93a18591376cae1e4f0e9358c14cb905e5da9a7ec0c68ef4e2ad2c3741c306')
validpgpkeys=('1AD23D1B8F087A35AB74BDE9F4A7678C9C6B0B2B' # X2go Git Administrator <git-admin@x2go.org>
              '9BFBAEE86C0AA5FFBF2207829AF46B3025771B31') # Mike Gabriel <mike.gabriel@das-netzwerkteam.de>

prepare() {
  cd "${srcdir}/nx-libs-$pkgver"
  # binutils 2.36 buildfix 
  patch -Np1 -i ../0001-nx-libs-ar.patch
}

build() {
  cd "${srcdir}/nx-libs-$pkgver"
  
  # let makepkg zip the man files
  sed -i "s:gzip:#gzip:g" Makefile

  make \
    PREFIX=/usr \
    CONFIGURE="./configure --prefix=/usr --libdir=/usr/lib --libexecdir=/usr/lib --includedir=/usr/include" \
    IMAKE_DEFINES="-DUseTIRPC=YES"
    
  # fake install
  mkdir $srcdir/fakeinstall
  make install \
       PREFIX=/usr \
       DESTDIR="$srcdir/fakeinstall" \
       LIBDIR=/usr/lib \
       SHLIBDIR=/usr/lib \
       INSTALL_DIR="install -dm0755" \
       INSTALL_FILE="install -pm0644" \
       INSTALL_PROGRAM="install -pm0755"
}

package_libxcomp() {
  
  pkgdesc="NX X compression library"
  depends=('libjpeg-turbo' 'libpng' 'gcc-libs')
	
  install -dm755 ${pkgdir}/usr/lib
  cp -a ${srcdir}/fakeinstall/usr/lib/libXcomp.so* ${pkgdir}/usr/lib
}

package_nxproxy() {

  pkgdesc="NX proxy"
  depends=('libxcomp' )
  
  install -dm755 ${pkgdir}/usr/{bin,share/man/man1}
  cp -a ${srcdir}/fakeinstall/usr/share/man/man1/nxproxy.1 ${pkgdir}/usr/share/man/man1
  # the wrapper
  cp -a ${srcdir}/fakeinstall/usr/bin/nxproxy ${pkgdir}/usr/bin
}

package_nx-x11() {
 
  pkgdesc="NX-X11 lib for the NX framework"
  depends=('libxcomp')
	
  install -dm755 ${pkgdir}/usr/{lib/nx/X11,share/nx}
  cp -aR ${srcdir}/fakeinstall/usr/lib/nx/X11/* ${pkgdir}/usr/lib/nx/X11
  cp -aR ${srcdir}/fakeinstall/usr/lib/libNX* ${pkgdir}/usr/lib
  
  # fonts symlink
  ln -vsf /usr/share/fonts ${pkgdir}/usr/share/nx/fonts
}

package_nxagent() {
  
  pkgdesc="NX X server based on Xnest"
  backup=(etc/nxagent/keystrokes.cfg)
  depends=('nx-x11' 'libxcomp' 'libxml2' 'xkeyboard-config' 'xorg-xkbcomp'
           'xorg-xkbcomp' 'libxfont2' 'libxinerama'
           'xorg-font-util'  'libxfont2' 'libxinerama' 'pixman'
           'libxrandr' 'libxtst' 'libxcomposite' 'libxpm' 'libxdamage'
           'libtirpc')
  conflicts=('nx-xcompext')
	
  install -dm755 ${pkgdir}/usr/{bin,lib/nx/bin,share/nx,share/man/man1,share/pixmaps}
  cp -a ${srcdir}/fakeinstall/usr/lib/nx/bin/nxagent ${pkgdir}/usr/lib/nx/bin
  cp -a ${srcdir}/fakeinstall/usr/share/man/man1/nxagent.1 ${pkgdir}/usr/share/man/man1

  # the wrapper
  cp -a ${srcdir}/fakeinstall/usr/bin/nxagent ${pkgdir}/usr/bin
  
  # additional files for documentation
  cp -a ${srcdir}/fakeinstall/usr/share/nx/SecurityPolicy ${pkgdir}/usr/share/nx
  
  cp -a ${srcdir}/fakeinstall/usr/lib/libXcompshad.so* ${pkgdir}/usr/lib
  
  # Needed for nxagent to find the keymap directory
  install -dm755 ${pkgdir}/usr/lib/X11/xkb
  touch ${pkgdir}/usr/lib/X11/xkb/keymap.dir
  
  install -dm755 ${pkgdir}/etc/nxagent
  cp -a ${srcdir}/fakeinstall/etc/nxagent/keystrokes.cfg ${pkgdir}/etc/nxagent

  # add symlinks required for proper Xinerama support # FS#41037
  install -dm755 ${pkgdir}/usr/lib/nx/X11/Xinerama
  cd ${pkgdir}/usr/lib/nx/X11/Xinerama
  ln -sv /usr/lib/libX11.so.6 libNX_X11.so.6
  ln -sv /usr/lib/libXext.so.6 libNX_Xext.so.6
  ln -sv /usr/lib/libNX_Xinerama.so.1 libNX_Xinerama.so.1
}

package_nx-headers() {

  pkgdesc="NX headers"
  
  install -dm755 ${pkgdir}/usr/include
  cp -aR ${srcdir}/fakeinstall/usr/include/* ${pkgdir}/usr/include

  # drop unneeded headers
  rm -rf ${pkgdir}/usr/include/GL
  rm -rf ${pkgdir}/usr/include/nx-X11/{extensions/XK*.h,nx-X11/extensions/*Xv*.h,nx-X11/Xtrans}
}
