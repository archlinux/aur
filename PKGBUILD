# Maintainer: sfs <sfslinux@gmail.com>

pkgname=brushshe
pkgver=r442.80893e0
pkgrel=1
pkgdesc="Simple and user-friendly raster graphics editor with add-on support"
arch=('any')
url="https://github.com/limafresh/Brushshe"
license=('MPL-2.0')
depends=('python' 'python-pillow' 'python-customtkinter')
makedepends=('git')
optdepends=(
    'xclip: clipboard support on X11'
    'wl-clipboard: clipboard support on Wayland'
)
provides=('brushshe')
conflicts=('brushshe')
source=("${pkgname}::git+https://github.com/limafresh/Brushshe.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname}"
    
    # Install application files
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r Brushshe/* "$pkgdir/usr/share/$pkgname/"
    
    # Install executable wrapper
    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/brushshe" << 'EOF'
#!/bin/sh
exec python /usr/share/brushshe/main.py "$@"
EOF
    chmod +x "$pkgdir/usr/bin/brushshe"
    
    # Install desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/brushshe.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=Brushshe
Comment=Painting app
GenericName=Drawing Application
GenericName[uk]=Програма для малювання
GenericName[ru]=Программа для рисования
GenericName[en]=Drawing Application
GenericName[es]=Aplicación de Dibujo
GenericName[fr]=Application de Dessin
GenericName[de]=Zeichenanwendung
GenericName[it]=Applicazione di Disegno
GenericName[pt]=Aplicativo de Desenho
GenericName[ja]=描画アプリケーション
GenericName[zh_CN]=绘图应用
GenericName[zh_TW]=繪圖應用
GenericName[ar]=تطبيق الرسم
GenericName[hi]=ड्राइंग एप्लिकेशन
GenericName[ko]=그리기 애플리케이션
GenericName[pl]=Aplikacja do Rysowania
GenericName[tr]=Çizim Uygulaması
GenericName[nl]=Tekentoepassing
GenericName[sv]=Ritapplikation
GenericName[cs]=Kreslicí Aplikace
GenericName[sk]=Kresliaca Aplikácia
Comment=Painting app
Comment[uk]=Програма для малювання
Comment[ru]=Программа для рисования
Comment[en]=Painting application
Comment[es]=Aplicación de pintura
Comment[fr]=Application de peinture
Comment[de]=Mal-App
Comment[it]=Applicazione di pittura
Comment[pt]=Aplicativo de pintura
Comment[ja]=ペイントアプリ
Comment[zh_CN]=绘画应用
Comment[zh_TW]=繪畫應用
Comment[ar]=تطبيق الرسم
Comment[hi]=पेंटिंग ऐप
Comment[ko]=페인팅 앱
Comment[pl]=Aplikacja do malowania
Comment[tr]=Boyama uygulaması
Comment[nl]=Schilder-app
Comment[sv]=Målapp
Comment[cs]=Malířská aplikace
Comment[sk]=Maľovacia aplikácia
Exec=brushshe %f
Icon=brushshe
Terminal=false
Categories=Graphics;
StartupWMClass=Brushshe
MimeType=image/png;image/jpeg;image/gif;image/bmp;image/vnd.ms-dds;image/x-bmp;image/x-eps;image/x-icns;image/x-icon;image/im;image/mpo;image/x-pcx;image/x-portable-pixmap;image/x-sgi;image/x-tga;image/tiff;image/webp;
EOF
    
    # Install icon
    mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    cp Brushshe/assets/icons/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/brushshe.svg"
    
    # Install documentation
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    cp README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
