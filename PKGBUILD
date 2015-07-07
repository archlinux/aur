# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: EpocSquadron <crimsonmage a gmail>
pkgname=libreoffice-extension-writer2latex-devel
_javaname=writer2latex
_exts=( writer2latex writer2xhtml writer4latex )
pkgver=1.3.2
pkgrel=1
_verflag="alpha"
pkgdesc="A java program and collection of LibreOffice extensions for converting to and working with LaTeX in LibreOffice (develop release)"
arch=('any')
url="http://writer2latex.sourceforge.net"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice-common' 'java-runtime-headless')
makedepends=('libreoffice-writer')
provides=('libreoffice-extension-writer2latex')
conflicts=('libreoffice-extension-writer2latex' 'libreoffice-extension-writer2latex-svn')

_smallver=${pkgver%.*}
_srcname="${_javaname}${_smallver//.}"
_dlpath="http://downloads.sourceforge.net/project/writer2latex/writer2latex/Writer2LaTeX%20${pkgver%.*}"
source=("${_dlpath}/${_javaname}${pkgver//.}${_verflag}.zip"
        'writer2latex.sh')
sha256sums=('702358b568897482d8b13f4c309ee02aacb3ea196ef9a8ca9307bf846586c975'
            '964cf8f79d1087e62eff7a93d2e1733cc26941ecc0e7238e49ac5dfbc6b21c8e')

build() {
    cd "$srcdir/$_srcname/doc"
    libreoffice --headless --convert-to pdf user-manual.odt
}

package() {
    cd "$srcdir/$_srcname"

    #Install the extensions
    for _ext in "${_exts[@]}"; do
	install -dm755  "$pkgdir/usr/lib/libreoffice/share/extensions/$_ext"
	bsdtar -xf "$_ext.oxt" -C "$pkgdir/usr/lib/libreoffice/share/extensions/$_ext"
    done
    
    #Install the java converter
    install -D -m644 "$_javaname.jar" "$pkgdir/usr/share/java/$_javaname/$_javaname.jar"
    
    #Install shell script to execute java program
    install -D -m755 "$srcdir/$_javaname.sh" "$pkgdir/usr/bin/$_javaname"
    
    #Install documentation
    _docpath="$pkgdir/usr/share/doc/$pkgname"
    install -D -m644 Readme.txt "${_docpath}/Readme.txt"
    install -D -m644 changelog.txt "${_docpath}/changelog.txt"
    install -D -m644 History.txt "${_docpath}/History.txt"
    install -D -m644 doc/* "${_docpath}/"
}
