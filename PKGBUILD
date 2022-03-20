# Maintainer: nezbednik <nezbedniklmao@gmail.com>
pkgname=customizemii
pkgver=3.11
pkgrel=1
pkgdesc="a custom channel creator for the wii"
arch=("any")
url="https://code.google.com/archive/p/customizemii/"
license=("GPL3")
depends=("mono")
conflicts=("customizemii-bin")
source=("https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/customizemii/source-archive.zip" "https://wiibrew.org/w/images/0/0d/CustomizeMii_Icon.png" "ByteConv.cs" "Instructions_patch.diff" "Resources_patch.diff" "Designer_patch.diff" "Loaders_patch.diff")
sha256sums=("81ddba3a401e1360249da5b0d9988f58f47105fc4130237072e82a8929f997e6" "8e54152ac9c14192f02a6659183aa7c6196df88f5d2072fecba5d1fed5a0e458" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

prepare() {
    mcs ByteConv.cs
    cd customizemii/trunk/CustomizeMii
    mono ../../../ByteConv.exe Instructions.txt text > Instructions_txt.cs
    patch -i ../../../Instructions_patch.diff CustomizeMii_Main.cs
    patch -i ../../../Loaders_patch.diff CustomizeMii_BackgroundWorkers.cs
    patch -i ../../../Designer_patch.diff CustomizeMii.csproj
    cd Properties
    patch -i ../../../../Resources_patch.diff Resources.resx
    cd ../Resources
    mono ../../../../ByteConv.exe comex.app binary > ../Comex_app.cs
    mono ../../../../ByteConv.exe Waninkoko.app binary > ../Waninkoko_app.cs
}

build() {
    cd customizemii/trunk/CustomizeMii
    xbuild /p:Configuration=Release
}

package() {
    cd customizemii/trunk/CustomizeMii/bin
    mv Release customizemii
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    mkdir "$pkgdir/opt"
    mv "customizemii" "$pkgdir/opt"
    echo -e "#!/bin/sh
cd /opt/customizemii
mono CustomizeMii.exe" > "$pkgdir/usr/bin/customizemii"
    chmod 755 "$pkgdir/usr/bin/customizemii"
    echo -e "[Desktop Entry]
Encoding=UTF-8
Version=3.11
Type=Application
Terminal=false
Exec=/usr/bin/customizemii
Name=CustomizeMii
Comment=a custom channel creator for the wii
Icon=customizemii
Categories=AudioVideo;" > "$pkgdir/usr/share/applications/CustomizeMii.desktop"
    mv "../../../../CustomizeMii_Icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/customizemii.png"
}
