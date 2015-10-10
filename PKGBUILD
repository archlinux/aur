# Maintainer:  Stefan Husmann <stefan-husmann@t-online.de>
pkgname=minionpro
pkgver=2.015
pkgrel=10
pkgdesc="Myriad and Minion for LaTeX (the not-xeLaTeX way)"
url="http://lglinux.blogspot.com/2007/09/myriad-and-minion-for-latex.html"
arch=('any')
license=('unknown')
depends=('texlive-core')
install=minionpro.install
source=(http://mirrors.ctan.org/fonts/minionpro/scripts.zip \
  http://mirrors.ctan.org/fonts/minionpro/enc-2.000.zip \
  http://mirrors.ctan.org/fonts/minionpro/metrics-base.zip \
http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.3/deu/AdobeReader_deu-8.1.3-1.i486.tar.bz2 \
    http://faq.ktug.or.kr/wiki/pds/MyriadProAR7.pdf \
    http://faq.ktug.or.kr/wiki/pds/MyriadProAR7.zip \
http://www.adobe.com/products/eulas/pdfs/Reader_Player_AIR_WWEULA-Combined-20080204_1313.pdf#page=78 \
$pkgname.maps)
md5sums=('ec2cf45336fe2bdbc63e404c72f4eb6e'
         'ac1e22a5f484b93e60bd84951bab7527'
         'cf1ba13d39085ae58a7e96a5466bd66e'
         'c56ad633db07b8a21d222f6d38455940'
         '24fae0babc3d07eea2c84ddd32ddf1ef'
         'a183b5a604e7bc4004de9ed9eaba5ce7'
         '1636037610ee2aa35c5fb736a697b7e0'
         '78e393b25c0dd803684cebc2ffcf588a')
noextract=('enc-2.000.zip' 'metrics-base.zip' 'MyriadProAR7.zip')

package() {
  install -m755 -d $pkgdir/var/lib/texmf/arch/installedpkgs
  install -m644 $pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs/
  cd $srcdir/AdobeReader 
  bsdtar -xf COMMON.TAR 
  mv Adobe/Reader8/Resource/Font/M*.otf $srcdir/otf
  cd $srcdir
  ./convert.sh
  install -d $pkgdir/usr/share/texmf/fonts/type1/adobe/MinionPro
  install -d $pkgdir/usr/share/texmf/fonts/type1/adobe/MyriadPro
  cp pfb/Min*.pfb \
    $pkgdir/usr/share/texmf/fonts/type1/adobe/MinionPro
  cp pfb/Myr*.pfb \
    $pkgdir/usr/share/texmf/fonts/type1/adobe/MyriadPro
  bsdtar -C $pkgdir/usr/share/texmf -xf enc-2.000.zip
  bsdtar -C $pkgdir/usr/share/texmf -xf metrics-base.zip 
  [ -d myriad ] || mkdir myriad
  cd myriad
  bsdtar -xf $srcdir/MyriadProAR7.zip 
  [ -d fonts/tfm/adobe ] && rm -r fonts/tfm/adobe
  mv fonts/tfm/Adobe fonts/tfm/adobe
  [ -d fonts/type1/adobe ] && rm -r fonts/type1/adobe
  mv fonts/type1/Adobe fonts/type1/adobe
  [ -d fonts/enc ] || mkdir fonts/enc
  cp -r dvips fonts/enc/
  rm -r dvips
  sed -i 's+\[++' fonts/enc/dvips/MyriadPro/MyriadPro.map 
  install -d $pkgdir/usr/share/texmf/fonts/map/dvips/MyriadPro
  tr -d "\r" < fonts/enc/dvips/MyriadPro/MyriadPro.map > \
    $pkgdir/usr/share/texmf/fonts/map/dvips/MyriadPro/MyriadPro.map
  rm fonts/enc/dvips/MyriadPro/MyriadPro.map 
  cp -R * $pkgdir/usr/share/texmf 
  install -Dm644 $srcdir/MyriadProAR7.pdf \
    $pkgdir/usr/share/texmf/doc/latex/MyriadPro/MyriadPro.pdf
  sed -i 's+\[++' \
   $pkgdir/usr/share/texmf/fonts/map/dvips/MinionPro/MinionPro.map
  chmod o+r $pkgdir/usr/share/texmf/doc/latex/MinionPro/tabfigures.pdf \
    $pkgdir/usr/share/texmf/doc/latex/MinionPro/fontaxes.pdf \
    $pkgdir/usr/share/texmf/doc/latex/MinionPro/otfontdef.pdf
  install -Dm644 \
    $srcdir/Reader_Player_AIR_WWEULA-Combined-20080204_1313.pdf#page=78 \
    "$pkgdir/usr/share/licenses/$pkgname/license.pdf" 
  echo done
}
