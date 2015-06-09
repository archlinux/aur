# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname="pdf-xchange"
pkgver="5.5.313.1"
pkgrel="1"
pkgdesc="Perform simple editing of PDF files"
license=('Custom')
arch=('i686' 'x86_64')
depends=('wine' 'hicolor-icon-theme')
makedepends=('p7zip' 'imagemagick' 'gendesk')
install=pdf-xchange.install
url="http://www.tracker-software.com/product/pdf-xchange-editor"
_downloadsource="http://www.tracker-software.com/downloads"
_x86file="PDFXVE5.x86.msi"
_x64file="PDFXVE5.x64.msi"
_installdir="/usr/lib"

 source_x86_64+=($_downloadsource/$_x64file)
 md5sums_x86_64+=(09efa575d81dd578c6ee448eb22595d0)

 source_i686+=($_downloadsource/$_x86file)
 md5sums_i686+=(dc74d64d7c0e1881116b90369c828dfe)

prepare()
{

 if [ "$CARCH" == "x86_64" ]; then
	7z x "$srcdir/$_x64file" -o"$srcdir"
	7z x "$srcdir/PDFE_x64.cab" -o"$srcdir"		
 fi
 if [ "$CARCH" == "i686" ]; then	
	7z x "$srcdir/$_x86file" -o"$srcdir"
 fi

 7z x "$srcdir/PDFE_x86.cab" -o"$srcdir"
 7z x "$srcdir/PDFE_res.cab" -o"$srcdir"
 7z x "$srcdir/PDFXE.cab" -o"$srcdir"

}

package()
{  

 mkdir -p "$pkgdir${_installdir}/$pkgname"

 if [ "$CARCH" == "x86_64" ]; then
	install -Dm644 "$srcdir/FID_ViewerDLL64" "$pkgdir${_installdir}/$pkgname/PDFXEditCore.x64.dll"
 fi

 if [ "$CARCH" == "i686" ]; then
	install -Dm644 "$srcdir/FID_ViewerDLL32" "$pkgdir${_installdir}/$pkgname/PDFXEditCore.x86.dll"
 fi
 
 install -Dm755 "$srcdir/FID_ViewerEXE" "$pkgdir${_installdir}/$pkgname/PDFXEdit.exe" 
 install -Dm644 "$srcdir/FID_Resource" "$pkgdir${_installdir}/$pkgname/Resources.dat"
 install -Dm644 "$srcdir/FID_ViewerLicense" "$pkgdir/usr/share/licenses/$pkgname/PDF_VE_.pdf"

 mv "$srcdir/Icon.AppIco" "$srcdir/Icon.AppIco.ico"
 convert "$srcdir/Icon.AppIco.ico" "$srcdir/out.png"

 _num=0 
 for _size in 128 64 48 32 24 16; do
 	install -Dm644 "$srcdir/out-${_num}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
        _num=$((_num + 1))
 done

 gendesk -n -f \
          --pkgname="${pkgname}" \
          --pkgdesc="${pkgdesk}" \
          --name="PDF-XChange" \
          --categories="Utility" \
          --startupnotify=true \
          --comment="$pkgdesc" \
          --mimetypes="application/pdf" \
          --custom="StartupWMClass=PDFXEdit.exe"


 sed -i "s/Exec=${pkgname}/Exec=${pkgname} \%f/" "$srcdir/$pkgname.desktop"

 install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

 mkdir -p "$pkgdir${_installdir}/$pkgname/Languages"
 cp  "$srcdir"/Strings.*.xcl "$pkgdir${_installdir}/$pkgname/Languages"
 chmod 0644 "$pkgdir${_installdir}/$pkgname/Languages/"Strings.*.xcl
 
 mkdir -p "$pkgdir/usr/bin"

 echo '#!/bin/bash' > "$pkgdir/usr/bin/$pkgname"
 echo "program=\"${pkgname}\"" >> "$pkgdir/usr/bin/$pkgname"
 echo 'if [ ! -d "$HOME/.$program/wine" ] ; then' >> "$pkgdir/usr/bin/$pkgname"
 echo '   mkdir -p "$HOME/.$program/wine"' >> "$pkgdir/usr/bin/$pkgname"
 echo 'fi' >> "$pkgdir/usr/bin/$pkgname"
 echo 'document=$(WINEPREFIX="$HOME/.$program/wine" /usr/bin/winepath -w "$1")' >> "$pkgdir/usr/bin/$pkgname"
 echo 'WINEPREFIX="$HOME/.$program/wine" /usr/bin/wine '\"${_installdir}'/$program/PDFXEdit.exe" "$document"' >> "$pkgdir/usr/bin/$pkgname"

 chmod 0755 "$pkgdir/usr/bin/$pkgname"

}
