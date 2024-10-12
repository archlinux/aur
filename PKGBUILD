# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=mii_emu
pkgname=mii_emu-git
pkgver=1.9.5.g683dbe6
pkgrel=1
pkgdesc="Apple //e Emulator for Linux"
arch=('any')
url="https://github.com/buserror/mii_emu"
license=('MIT')
depends=(alsa-lib libglvnd glu libx11 pixman mold)
makedepends=(base-devel)
optdepends=('alsa-lib: needed for sound')
provides=('mii_emu')
conflicts=('mii_emu')
source=(
  "git+https://github.com/buserror/mii_emu.git"
  "mii_emu.desktop")
sha256sums=('SKIP'
            '30ed9a8f75daf97aad8933d0409dd6dc0933e1b4ec4f077a8121eff14e53f951')

pkgver() {
  cd "${pkgname%-*}"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

build() {
  cd "${pkgname%-*}"
  #echo CFLAGS are $CFLAGS
  #export CFLAGS=`echo $CFLAGS | sed -e 's/-flto=auto//' -e 's/-fno-omit-frame-pointer//'`
  #echo after update CFLAGS are $CFLAGS
  make clean; make
}

package() {
  # prep desktop file and .desktop
  sed -e "s/^Version=.*/Version=${pkgver}/" mii_emu.desktop > "$srcdir/${pkgname%-*}/mii_emu.desktop"

  cd "$srcdir/${pkgname%-*}"
  make DESTDIR=${srcdir}/${pkgname%-*}/dist install
  install -Dm644 "mii_emu.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "contrib/mii-icon-64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mii_emu.png"
  install -Dm 755 dist/bin/mii_emu_gl "${pkgdir}"/usr/bin/mii_emu_gl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
  install -Dm 644 docs/Compiling.md -t "${pkgdir}"/usr/share/doc/${pkgname}
  install -Dm 644 docs/mui_emulator.drawio.png -t "${pkgdir}"/usr/share/doc/${pkgname}
  install -Dm 644 docs/screen/screen_color.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/screen_config.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/screen_green.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/screen_mish.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/screen_total.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/v17heatmap.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/v18colorapple.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/v18new_display.gif -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/v18ssc_dialog.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/v19artifacts.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/v19mega2.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/v19ntsc.png -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 docs/screen/video_main.gif -t "${pkgdir}"/usr/share/doc/${pkgname}/screen
  install -Dm 644 disks/dos33master.nib -t "${pkgdir}"/usr/share/${pkgname}/disks
  install -Dm 644 disks/prodos242.dsk -t "${pkgdir}"/usr/share/${pkgname}/disks

  cd "${pkgdir}"/usr/bin
  ln -s mii_emu_gl mii_emu
  cd -
}

