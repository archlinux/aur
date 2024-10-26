
pkgname=skeditor
pkgver=2.8.1  # Wartość początkowa; zostanie nadpisana automatycznie
pkgrel=1
pkgdesc="SkEditor"
arch=('x86_64')
url="https://github.com/SkEditorTeam/SkEditor"
license=('MIT')
depends=('dotnet-runtime>=8.0')

source=("git+https://github.com/SkEditorTeam/SkEditor#branch=main")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/SkEditor/SkEditor"
    grep -oP '(?<=<Version>)[0-9.]+(?=</Version>)' SkEditor.csproj
}

build() {
    cd "$srcdir/SkEditor/SkEditor"
    dotnet publish -c Release -r linux-x64 -p:PublishSingleFile=false -p:PublishReadyToRun=true --no-self-contained --nologo -v q --property WarningLevel=0 /clp:ErrorsOnly /p:DebugType=None /p:DebugSymbols=false
}

package() {
    cd "$srcdir/SkEditor/SkEditor"
    
    mkdir -pv $pkgdir/opt/SkEditor
    mkdir -pv $pkgdir/usr/bin

    cp -fr bin/Release/net8.0/linux-x64/publish/* "$pkgdir/opt/SkEditor"

    chmod +x $pkgdir/opt/SkEditor/SkEditor

    ln -sf "$pkgdir/opt/SkEditor/SkEditor" "$pkgdir/usr/bin/SkEditor"
}