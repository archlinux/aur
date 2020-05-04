# Maintainer: Anatoly Smaznov <mrjavum at gmail dot com>

_original_name=SeaToolsSSD
pkgname=seatools-ssd-gui
pkgver=4.1.81
pkgrel=1
pkgdesc="Graphical dashboard and diagnostic tools optimized for Seagate Solid State Drives (SSD)."
arch=(x86_64)
url=https://www.seagate.com/support/downloads/seatools/
license=('custom:Seagate EULA')
depends=(gcc-libs)
makedepends=(sdx tclkit)
optdepends=('polkit: to run SeaToolsSSD GUI directly from menu')

options=(!strip)
source=(https://www.seagate.com/files/old-support-files/seatools/${_original_name}-GUI.zip
        bitrock-unpacker.tcl
        LICENSE
        icon{16,32,48,64,128,256}.png
        $pkgname.desktop
        $pkgname
        $pkgname-hidpi.desktop
        $pkgname-hidpi
        org.archlinux.pkexec.$pkgname.policy)

md5sums=('3873967b56ef74a83d35bc4f1a71cfad'
         'd92ae37baa475b2d7b8cddd0e862f85a'
         '090c762796dccd4db8103e2f62a5210e'
         'a336e165fc8d9fc6a04bcff50de3f0b7'
         '0078bc12d4e0f0b0598734a555213016'
         '5f10d7c074b2d8aae6768307f0392da3'
         '0dd4702d5ba3a42878d11fe515466f85'
         '40bdce39aa3598cae21aea34307173a1'
         '729e82f9296c501b7e2a21b2ef0b882b'
         'f5f8b1715864405a4022561a6ab5028a'
         '0489d5e2f04cd5e4e19dbe28edc100cf'
         '5f61883de9b5f29a254be29586c85893'
         'cf630a96ea6c96f1dc7baba416133875'
         '4693684f78e1c2d81876d37200a37dd6'
         )

build() {
  msg2 "Unpacking files from installer"
  chmod 755 ./bitrock-unpacker.tcl
  cd $srcdir
  ./bitrock-unpacker.tcl $srcdir/Linux/$_original_name-$pkgver-linux-x64-installer.run $srcdir/unpacked.vfs
}

package() {
  msg2 "The package installs HiDPI launcher by default."
  msg2 "To install non-HiDPI version please comment/ucomment "
  msg2 "appropriate lines in PKGBUILD's package() block following by comments."
  msg2 ""
  msg2 "Continuing build in 5 seconds..."; sleep 5
  # Install program
  install -dm755 "${pkgdir}/opt/$pkgname"
  cp -a $srcdir/unpacked.vfs/default/programfileslinux/* ${pkgdir}/opt/$pkgname/

  # Comment next line to disable non-hidpi launcher
  #install -m755 -t "$pkgdir/opt/$pkgname/" $pkgname

  # Comment next line to disable hidpi launcher
  install -m755 -t "$pkgdir/opt/$pkgname/" $pkgname-hidpi

  # Install documentation files
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/SeaToolsSSD-GUI_100837824_E.pdf"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Desktop launcher
  install -Dm644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # Comment next line to disable non-hidpi launcher
  #install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Comment next line to disable hidpi launcher
  install -Dm644 "$srcdir/$pkgname-hidpi.desktop" "$pkgdir/usr/share/applications/$pkgname-hidpi.desktop"

  # Icons
  local icon_size icon_dir
  for icon_size in 16 32 48 64 128 256; do
    icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -d "$icon_dir"
    install -m644 "$srcdir/icon${icon_size}.png" "$icon_dir/$pkgname.png"
  done

  # Install policy file
  install -dm755 "$pkgdir/usr/share/polkit-1/actions"
  install -m644 -t "$pkgdir/usr/share/polkit-1/actions" "org.archlinux.pkexec.$pkgname.policy"

  # Add ti PATH
  install -dm755 "$pkgdir/etc/profile.d"
  echo "export PATH=\"\$PATH\":/opt/$pkgname" > "$pkgdir/etc/profile.d/${pkgname}.sh"
  source "$pkgdir/etc/profile.d/${pkgname}.sh"
}
