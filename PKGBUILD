# Maintainer: eirikr <151315375+Oichkatzelesfrettschen@users.noreply.github.com>
#
# WHY this package exists and why it is pinned to 6.7.80.0:
#   Epson's download-center CDN returns HTTP 403 for the epsonscan2 6.7.82.0
#   source tarball (https://download-center.epson.com/...).  No User-Agent or
#   Referer header bypasses the block.  The binary bundle hosted at
#   download3.ebz.epson.net for 6.7.80.0 remains accessible and ships the same
#   scanner libraries.  This package extracts that bundle rather than building
#   from source, and should be replaced by epsonscan2 once Epson restores source
#   access or publishes a bundle for a newer version.
#
# WHY -bin suffix:
#   Arch AUR convention: packages installed from pre-compiled binaries rather
#   than built from source carry a -bin suffix so users can distinguish them
#   from source builds and understand they carry Debian-era RPATH (patched here
#   via patchelf to match Arch layout).

pkgname=epsonscan2-bin
pkgver=6.7.80.0
_pkgver="$pkgver-1"
pkgrel=1
pkgdesc="Epson Scan 2 - binary bundle install (epsonscan2 6.7.82.0 source blocked by Epson CDN 403)"
arch=('armv7h' 'i686' 'x86_64')
url="https://support.epson.net/linux/en/epsonscan2.php"
license=('GPL-3.0-or-later')
depends=('libjpeg-turbo' 'libpng' 'libtiff' 'libusb' 'qt5-base' 'sane' 'zlib')
makedepends=('patchelf')
optdepends=('epsonscan2-non-free-plugin: OCR support and wireless scanning')
provides=('epsonscan2')
conflicts=('epsonscan2')

source_armv7h=("https://download3.ebz.epson.net/dsc/f/03/00/17/08/16/ec9aaa15e4cc6ae6bb906ce999595644426ad2c8/epsonscan2-bundle-${pkgver}.armv7l.deb.tar.gz")
source_i686=("https://download3.ebz.epson.net/dsc/f/03/00/17/08/13/322979d7491bf5a2fd0ef05aaba0226f6e2023f8/epsonscan2-bundle-${pkgver}.i686.deb.tar.gz")
source_x86_64=("https://download3.ebz.epson.net/dsc/f/03/00/17/08/12/9f3fec0ae80aa5c36f5170377ebcc38c93251e23/epsonscan2-bundle-${pkgver}.x86_64.deb.tar.gz")
b2sums_armv7h=('c95eb6396410eea82c7fbb29317172e5a0b38e6b45f207625a2fa97431d118f4b0ce468dc9b245437c49a2a387f7cb94716a19b6bcb1a7c5266b6010fa6d6b63')
b2sums_i686=('7a41ab04ee13fb9a22465cd80a8af4ec3099366f6af2d3f1911fe491b67444c3520ceb165730c72bc751cdefc606c303a62809ff292597c0ed086a860c900e15')
b2sums_x86_64=('cb27c9554d1c11fa67484a3b5012693e6469aec18221192134512cde305e377b52681e4f91bbf4d77573c8e87fa35743f24dcac994f8f688abafcf7b7947bd11')

prepare() {
  # Extract the main epsonscan2 deb from the bundle core/
  ar x "epsonscan2-bundle-${pkgver}."*".deb/core/epsonscan2_${_pkgver}_"*".deb"
  tar -xJf data.tar.xz -C "$srcdir"
}

package() {
  case $CARCH in
    armv7h)  _debarch="arm-linux-gnueabihf" ;;
    i686)    _debarch="i386-linux-gnu" ;;
    x86_64)  _debarch="x86_64-linux-gnu" ;;
  esac

  install -d "$pkgdir/usr/lib" "$pkgdir/usr/bin" \
             "$pkgdir/usr/share" "$pkgdir/usr/lib/sane" \
             "$pkgdir/usr/lib/udev/rules.d" "$pkgdir/etc/sane.d/dll.d"

  # Main library tree: Debian multiarch path -> Arch flat path
  mv "$srcdir/usr/lib/$_debarch/epsonscan2" "$pkgdir/usr/lib/epsonscan2"

  # SANE backend: move Debian copies, add Arch-canonical symlinks
  mv "$srcdir/usr/lib/$_debarch/sane/"* "$pkgdir/usr/lib/sane/"
  cd "$pkgdir/usr/lib/sane"
  ln -sf ../epsonscan2/libsane-epsonscan2.so  libsane-epsonscan2.so
  ln -sf ../epsonscan2/libsane-epsonscan2.so  libsane-epsonscan2.so.1
  ln -sf ../epsonscan2/libsane-epsonscan2.so  libsane-epsonscan2.so.1.0.0
  cd "$srcdir"

  # udev rules (Debian /lib -> Arch /usr/lib)
  install -Dm644 "$srcdir/lib/udev/rules.d/60-epsonscan2.rules" \
                 "$pkgdir/usr/lib/udev/rules.d/60-epsonscan2.rules"

  # SANE dll snippet
  install -Dm644 "$srcdir/etc/sane.d/dll.d/epsonscan2" \
                 "$pkgdir/etc/sane.d/dll.d/epsonscan2"

  # Main binary and data
  install -Dm755 "$srcdir/usr/bin/epsonscan2" "$pkgdir/usr/bin/epsonscan2"
  cp -r "$srcdir/usr/share" "$pkgdir/usr/"

  # WHY patchelf: the Debian binary and all bundled .so files encode RPATH
  # /usr/lib/$_debarch/epsonscan2/ which does not exist on Arch.  Rewrite to
  # the flat /usr/lib/epsonscan2/ path used above.
  local _rpath="/usr/lib/epsonscan2"
  patchelf --set-rpath "$_rpath" "$pkgdir/usr/bin/epsonscan2"
  for _lib in "$pkgdir/usr/lib/epsonscan2/"*.so*; do
    [[ -f "$_lib" && ! -L "$_lib" ]] && patchelf --set-rpath "$_rpath" "$_lib"
  done

  install -Dm644 "$srcdir/usr/share/doc/epsonscan2-${_pkgver}/LICENSE" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
