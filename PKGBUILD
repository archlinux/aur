# Maintainer: Cihan Alkan <cihanalk@gmail.com>
pkgname=uyap
pkgver=4.1.10
pkgrel=2
pkgdesc='Uyap Belge Düzenleyici'
url='http://www.uyap.gov.tr/'
arch=('x86_64')
license=('GPL2')
makedepends=('innoextract')
depends=('opensc')
source=("http://www.uyap.gov.tr/destek/uyap.zip"
        "uyap-editor.png"
        "product_logo_32.xpm")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')



build() {

innoextract UKI_V$pkgver/UKI_V$pkgver.exe

}

package() {
mkdir -p $pkgdir/opt/uki
cp -r app/*.jar /$pkgdir/opt/uki/

# Başlatıcı 
mkdir -pv $pkgdir/usr/share/applications &&
cat > $pkgdir/usr/share/applications/$pkgname.desktop << "EOF" &&
[Desktop Entry]
Version=1.0
Type=Application
Name=Uyap Document Editor
Name[tr]=Uyap Belge Düzenleyici
Comment=Uyap Document Editor
Comment[tr]=Uyap Belge Düzenleyici
GenericName=Metin Düzenleyici
TryExec=uyap
Exec=uyap %U
Terminal=false
Icon=uyap-editor
Categories=TextEditor;Office;
StartupNotify=true
Actions=Window;Document;
MimeType=application/udf;
EOF

# Bin Dosyası 
mkdir -pv $pkgdir/usr/bin &&
cat > $pkgdir/usr/bin/$pkgname << "EOF" &&
java -Xmx512m -Duser.language=tr -Duser.region=TR -cp .:/opt/uki/editor_lib2.jar:/opt/uki/editor_lib.jar:/opt/uki/editor_laf.jar:/opt/uki/jai_hvl.jar:/opt/uki/editor_utility.jar:/opt/uki/jdom.jar:/opt/uki/updater.jar tr.com.havelsan.uyap.system.editor.common.WPAppManager "getNewWPInstance" "EDITOR_TYPE_DOCUMENT" "$1" "$2"
EOF

# Uyap Menü 
mkdir -pv $pkgdir/usr/share/menu &&
cat > $pkgdir/usr/share/menu/$pkgname.menu << "EOF" &&
?package(uyap):needs="x11" \
  section="Office" \
  hints="Metin Düzenleyici" \
  title="Uyap Belge Düzenleyici" \
  icon="/opt/uki/product_logo_32.xpm" \
  command="/usr/bin/uyap"
EOF

# Uyap Mime 
mkdir -pv $pkgdir/usr/share/mime/packages &&
cat > $pkgdir/usr/share/mime/packages/udf.xml << "EOF" &&
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
	<mime-type type="application/udf">
		<comment>Uyap Document File</comment>
  		<comment xml:lang="tr">Uyap Belge Dosyası</comment>
  		<acronym>UDF</acronym>
  		<expanded-acronym>Uyap Document File</expanded-acronym>
  		<generic-icon name="uyap-editor"/>
  		<glob pattern="*.udf"/>
	</mime-type>

	<mime-type type="application/usf">
		<comment>Uyap Template File</comment>
  		<comment xml:lang="tr">Uyap Şablon Dosyası</comment>
  		<acronym>USF</acronym>
  		<expanded-acronym>Uyap Template File</expanded-acronym>
  		<generic-icon name="uyap-editor"/>
  		<glob pattern="*.usf"/>
	</mime-type>
</mime-info>
EOF

	# Icon Stuff
	srcdir_LOC="$srcdir/"
	DEST_LOC="$pkgdir/usr/share/icons/hicolor"
	for i in 16 32 48 128 256
	do
		install -Dm644 "$srcdir_LOC"/uyap-editor.png "$DEST_LOC/${i}x${i}/apps/uyap-editor.png"
	done
	install -m644 "$srcdir/product_logo_32.xpm" "$pkgdir/opt/uki/product_logo_32.xpm"
chmod +x $pkgdir/usr/bin/uyap
}
