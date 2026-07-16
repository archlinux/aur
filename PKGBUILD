# Maintainer: Peter Theobald <dev@petertheobald.de>
# Co-maintainer: Kristopher James Kent <kris@kjkent.dev>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgbase='xsane'
pkgname=('xsane' 'xsane-gimp')
pkgver='0.999'
pkgrel='9'
arch=('x86_64')
url='https://gitlab.com/sane-project/frontend/xsane'
license=('GPL2')
makedepends=('gtk2' 'lcms2' 'sane' 'zlib' 'libjpeg-turbo' 'gimp')
source=(
  "http://http.debian.net/debian/pool/main/x/$pkgname/${pkgname}_$pkgver.orig.tar.gz"
  'xsane-0.995-xdg-open.patch'
  '0165-xsane-0.999-lcms2.patch'
  '0001-lcms2_configure.patch'
  'xsane-preview-selection.patch'
  'configure-add-stdlib-to-conftest.patch'
  'fix-func_arg_mismatch.patch'
)
sha512sums=(
  '73ec961fce1a86b5d6f5bac0995d222785eb4b077dc8e72492b092d2bf4500455426e80e4d27233721cd38ec84f77fb9f92190a6afe45bdaf7ffd1ee50b431ed'
  'ed1c1b0fab10b456f7dc6befd6f91eb8d3e1bae0f1be3abf71d334d4a2ae8f8335ba37fdd73f336f7c5f45916df917dc77fd792e6b849a87bde95babc698bf39'
  '557913adab90b2ba051a2988bdbfc600ca6a33f099810f5f867c8d8b2c5a45b0468dd8a1a1593ff33d149b4a5917b24d716b54ae2605b3a2e19053e02e5b64c6'
  'a8b5e0466c1306b8df68d814a3f02bc74e4d470aa42b9e0eebad41d2e274ff74328a837dd9a0b5ca59e4df63ecbb53b268f6d4948a690d9346c5399bb5b3d1e4'
  '001b021ddf0f92e2bbab0211cfe92c54b785e94e7c92102caedd8d4ce34c833847157174a4d800d8859ba8d05300db74b8af352e5347d2883e17bca57454e96d'
  '04ea857a34a9400bc7c030563a942309d106893c6314dd099bf053227672fca9879314015be912538a7f89a414d3f0a24e7f45bfc51a0b621ed27dcc1c91a4e8'
  'ebf917385e180434167b45db0f31f967158548dd60624b1412f1ec40e4895284aa420e76c96c82f5cf9d198b306a06b27e65b548d117032521e5dd2c09df8b38'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # Fix: use "xdg-open" instead of "netscape" to launch help browser - taken from Fedora
  patch -Np1 -i "$srcdir/xsane-0.995-xdg-open.patch"
  sed -i -e 's:png_ptr->jmpbuf:png_jmpbuf(png_ptr):' src/xsane-save.c
  patch -Np1 -i "$srcdir/0165-xsane-0.999-lcms2.patch"
  patch -Np1 -i "$srcdir/0001-lcms2_configure.patch"
  patch -p1 -i "$srcdir/xsane-preview-selection.patch" # Fix selection preview
  patch -p1 -i "$srcdir/configure-add-stdlib-to-conftest.patch" # Fix failing build of conftest by adding stdlib.h to test program
  patch -p1 -i "$srcdir/fix-func_arg_mismatch.patch" # Fixes build failure, patch provided by AUR user jprjr
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-gimp
  make
  mv src/xsane src/xsane-gimp

  # Build again with GIMP disabled
  make clean
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --mandir=/usr/share/man \
    --disable-gimp
  make
}

package_xsane() {
  pkgdesc='A GTK-based X11 frontend for SANE and plugin for GIMP.'
  install="$pkgname.install"
  depends=('gtk2' 'lcms2' 'sane' 'zlib' 'libjpeg-turbo')  
  optdepends=('xsane-gimp: for GIMP plugin support')
  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
}

package_xsane-gimp() {
  pkgdesc='XSane GIMP plugin.'
  depends=('xsane' 'gimp')
  cd "$srcdir/$pkgbase-$pkgver"
  install -D -m755 src/xsane-gimp "$pkgdir/usr/bin/xsane-gimp"

  # For making GIMP plugin available
  mkdir -p "$pkgdir/usr/lib/gimp/2.0/plug-ins"
  ln -sf /usr/bin/xsane-gimp "$pkgdir/usr/lib/gimp/2.0/plug-ins/xsane"

  ## TODO: Is the below still relevant? How come it's commented? If not useful, let's remove?
  # http://cvs.fedoraproject.org/viewvc/rpms/xsane/devel/xsane.spec?revision=1.80&view=markup
  # when makepkg will allow splitted pkg install file support we might change add a xsane-gimp.install file with the commands that are used by fedora,
  # gentoo has something similar
  #%post gimp
  #107 	if [ -x "%{_sbindir}/gimp-plugin-mgr" ]; then
  #108 	%{_sbindir}/gimp-plugin-mgr --install xsane
  #109 	fi
  #110 	
  #111 	%preun gimp
  #112 	if [ $1 = 0 ]; then
  #113 	if [ -x "%{_sbindir}/gimp-plugin-mgr" ]; then
  #114 	%{_sbindir}/gimp-plugin-mgr --uninstall xsane
  #115 	fi
  #116 	fi
}
