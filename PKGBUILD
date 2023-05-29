# Author: Dieter Steffmann (Mediengestaltung) <https://www.1001fonts.com/users/steffmann/>
# Maintainer: Stephan Peters <speters33w аt gmail dоt cоm>
# Contributor: Riedler <dev@riedler.wien>
# Contributor: xNN <xNNism@gmail.com>

_fontname=tannenberg

_include_webfonts=false
# true to include webfonts with ttf or type1 installation.
# explicitly installing the webfonts-$_fontname package overrides this value to true.

_webfontdir=$HOME/www/fonts
# Directory for woff and woff2 files.
# Change to install webfonts in an alternate location, example: "/www/webfonts/.

_pfmdir=/usr/share/fonts/type1/
# Directory for postscript type 1 .pfm and .pfb files.
# Change to install in an alternate location, example: "/psfonts/$_fontname/"

_afmdir=/usr/share/fonts/type1/
# Directory for postscript type 1 .afm files.
# Change to install in an alternate location, example: "/psfonts/$_fontname/afm"

# Postscript Type 1 fonts are only installed if explicitly installing the type1-$_fontname package.
# This is a largely obsolete format, and would only be needeed for specialized applications.
# Only the original files from TypeOasis are installed, this package does not include TeX .tfm files.
# TeX .tfm files can be generated from the included Type 1 files with a utility.

#pkgname=("ttf-$_fontname" "type1-$_fontname" "webfonts-$_fontname")
pkgname=("ttf-$_fontname")  # use to install a single package locally.
_licensefile="ffc.html"
pkgver=1.002
pkgrel=2
# name=""
pkgdesc="Tannenberg is a Fraktur-family blackletter typeface, developed in Germany between 1933 and 1935 digitized by Dieter Steffmann."
arch=(any)
url="https://github.com/speters33w/tannenberg-font"
license=("custom:1001Fonts Free For Commercial Use License (FFC)") 
  # This is the current license for Dieter Steffmann's fonts. 
  # See http://www.steffmann.de/wordpress/test-2/typoasis/ , https://www.1001fonts.com/users/steffmann/ , and https://www.1001fonts.com/tannenberg-font.html .
depends=()
makedepends=()
optdepends=()
conflicts=()
source=("https://github.com/speters33w/tannenberg-font/raw/main/tannenberg-font.tar.gz")
sha256sums=("e5261b8ccac3aa18a1f8715f329708164a45816913e86c0da8f8e69aa1fe8a5d")
  # Compiled from source files at https://www.1001fonts.com/tannenberg-font.html , http://moorstation.org/typoasis/designers/steffmann/samples/t/tannenbg.htm 
  # and generated webfonts using https://www.fontsquirrel.com/tools/webfont-generator .

prepare(){
  bsdtar xvf "$_fontname-font.tar.gz"
}

install_license(){
  if [ ! -f "/usr/share/licenses/$_fontname-font/$_licensefile" ] ; then
    install -Dm644 -t "$pkgdir"/"usr/share/licenses"/"$_fontname-font" "$srcdir"/"usr/share/licenses"/"$_fontname-font"/*.*
  fi
}

install_fonts(){
  #install -Dm644 -t "$pkgdir"/usr/share/fonts/"$_fontname" "$srcdir"/usr/share/fonts/"${1^^}"/*."$1"
  install -Dm644 -t "$pkgdir"/usr/share/fonts/"${1^^}" "$srcdir"/usr/share/fonts/"${1^^}"/*."$1"
}

install_postscript(){
  install -Dm644 -t "$pkgdir"/"$_pfmdir" "$srcdir"/usr/share/fonts/type1/*.pf? 
  install -Dm644 -t "$pkgdir"/"$_afmdir" "$srcdir"/usr/share/fonts/type1/*.afm 
}

install_webfonts(){
  if [ "$_include_webfonts" = true ] ; then
    mkdir -p "$pkgdir"/"$_webfontdir"
    if [ ! -f "$_webfontdir"/"$_fontname.bold.woff" ] ; then 
      install -Dm644 -t "$pkgdir"/"$_webfontdir" "$srcdir"/www/fonts/*.woff
    fi
    if [ ! -f "$_webfontdir/$_fontname.bold.woff2" ] ; then
      install -Dm644 -t "$pkgdir"/"$_webfontdir" "$srcdir"/www/fonts/*.woff2
      echo -e "\e[32mWebfonts will be installed in ${_webfontdir}.\e[0m"
    fi
    if [ ! -f "$_webfontdir/$_fontname-stylesheet.css" ] ; then
      install -Dm644 -t "$pkgdir"/"$_webfontdir" "$srcdir"/www/fonts/"$_fontname-stylesheet.css"
    fi 
  fi	
}

package_ttf-tannenberg() {
  #conflicts+=("otf-$_fontname")
  install_license
  install_fonts ttf
  install_webfonts
}

package_type1-tannenberg() {
  install_license
  install_postscript
  install_webfonts
}

package_webfonts-tannenberg() {
  _include_webfonts=true
  install_license
  install_webfonts
}
