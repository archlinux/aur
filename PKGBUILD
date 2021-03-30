# Maintainer: Moviuro <moviuro+aur at gmail dot com>

pkgname=divinityoriginalsin-ee-gog
pkgver=2.0.119.430.ch.17075
pkgrel=1
pkgdesc="Divinity: Original Sin - Enhanced Edition is a much lauded Role-Playing-Game that blends deep customization and humor with dynamic turn based combat."
arch=("x86_64")
url="https://www.gog.com/game/divinity_original_sin_enhanced_edition"
license=("custom:commercial")
# We could use shared libraries, but some aren't even in the AUR.
# The depends here were found by ldd(1). If something is missing, send me an
# email or write an AUR comment.
depends=('zlib' 'libglvnd' 'glibc' 'gcc-libs' 'libx11' 'libxcb' 'libxau'
         'libxdmcp')
# The following is not absolutely necessary... but it speeds up decompression
# time by a factor ~87
makedepends=('binwalk')
# A file is used for language
backup=("opt/$pkgname/game/Data/Localization/language.lsx")
# requires aur/lgogdownloader or the game file directly next to the PKGBUILD
#DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
source=("${pkgname}_${pkgver//./_}.sh::gogdownloader://divinity_original_sin_enhanced_edition/en3installer0"
        "${pkgname}"
        "${pkgname}.desktop"
        "language_setup.md")
sha256sums=('1abff3dfb6321995c7b52031a0ff99a5313343fcd469596c76ef971d2685ea7d'
            'cdd06507dbb9561e2f63da495ddab649fd70988e4142d9fe2d40a14c7e0fba0c'
            '0e63ae80106ef02b646a71badd15a9c72ce664145b2b83ce2140507174af0edd'
            '33213d2d4ab54a04830c167ea854c0a31cce608b734c4aa4895b41024b3647f2')
options=('!strip')
# You may wish to disable compression of the package
#PKGEXT='.pkg.tar'

prepare() {
  binwalk -e "${pkgname}_${pkgver//./_}.sh"
  # We don't keep the zip file, because binwalk already unzipped it
  rm "_${pkgname}_${pkgver//./_}.sh.extracted/D7942.zip"

  # If binwalk is not an option, this is a slow alternative (10GB at ~1MB/s - 2h45min)
  # binwalk returns:
  # DECIMAL       HEXADECIMAL     DESCRIPTION
  # 883010        0xD7942         Zip archive data, at least v1.0 to extract, name: data/
  #dd if="${pkgname}_${pkgver//./_}.sh" bs=1 skip=883010 |
  # bsdtar xf -
}

package() {
  # Data
  # Reflink files to save the disk space and time spent copying them (they are large)
  install -m755 -d "$pkgdir/opt/$pkgname/game/"
  cp -Ra --reflink=auto -t "$pkgdir/opt/$pkgname/game/" \
   "$srcdir/_${pkgname}_${pkgver//./_}.sh.extracted/data/noarch/game/"*
  find "$pkgdir/opt/$pkgname/game/" -type d -print0 | xargs -0 chmod 755
  find "$pkgdir/opt/$pkgname/game/" -type f -print0 | xargs -0 chmod 644

  # Game binaries and libs
  chmod 755 "$pkgdir/opt/$pkgname/game/EoCApp"

  # We keep the libs. Some of them can be found in packages, some in AUR, some
  # not at all. It seems easier to just use what's shipped with the "official"
  # archive.
  #for _lib in ...; do
  #  rm "$pkgdir/opt/$pkgname/game/$_lib"
  #done
  #unset _lib

  # Fix language, hardcode in English here
  sed -i 's/id="Value" value=".*"/id="Value" value="English" type="20"/g' \
   "$pkgdir/opt/$pkgname/game/Data/Localization/language.lsx"

  # Docs
  install -m755 -d "$pkgdir/opt/$pkgname/docs/"
  cp -Ra --reflink=auto -t "$pkgdir/opt/$pkgname/docs/" \
   "$srcdir/_${pkgname}_${pkgver//./_}.sh.extracted/data/noarch/docs/"
  chmod 644 "$pkgdir/opt/$pkgname/docs/"*

  # Icon
  install -m755 -d "$pkgdir/opt/$pkgname/"
  install -m644 -t "$pkgdir/opt/$pkgname/" \
   "$srcdir/_${pkgname}_${pkgver//./_}.sh.extracted/data/noarch/support/icon.png"

  #
  # System integration
  #

  # /bin
  rm "$pkgdir/opt/$pkgname/game/runner.sh" # We have our own
  install -m755 -d "$pkgdir/usr/bin/"
  install -m755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"

  # License
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/opt/$pkgname/docs/End User License Agreement.txt" \
   "$pkgdir/usr/share/licenses/$pkgname/EULA"

  # Icon
  install -m755 -d "$pkgdir/usr/share/pixmaps/"
  ln -s "/opt/$pkgname/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

  # .desktop File
  install -m755 -d "$pkgdir/usr/share/applications/"
  install -m644 -t "$pkgdir/usr/share/applications/" \
   "$srcdir/${pkgname}.desktop"

  # Doc
  install -m755 -d "$pkgdir/usr/share/doc/"
  ln -s "/opt/$pkgname/docs" "$pkgdir/usr/share/doc/$pkgname"
  install -m644 -t "$pkgdir/usr/share/doc/" "${srcdir}/language_setup.md"
}

