pkgname=skeditor-git
pkgver=0.0.0.r1.gabcdef0  # zostanie automatycznie nadpisany
pkgrel=1
pkgdesc="SkEditor"
arch=('x86_64')
url="https://github.com/SkEditorTeam/SkEditor"
license=('MIT')
depends=('dotnet-runtime>=8.0')
makedepends=('dotnet-sdk')
source=("git+https://github.com/SkEditorTeam/SkEditor#branch=main")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/SkEditor"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

prepare() {
    cd "$srcdir/SkEditor/SkEditor"
    dotnet restore
}

build() {
    cd "$srcdir/SkEditor/SkEditor"
    dotnet publish -c Release -r linux-x64 -p:PublishSingleFile=false -p:PublishReadyToRun=true --no-self-contained --nologo -v q --property WarningLevel=0 /clp:ErrorsOnly /p:DebugType=None /p:DebugSymbols=false
}

package() {
    cd "$srcdir/SkEditor/SkEditor"
    
    mkdir -p "$pkgdir/opt/SkEditor"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"

    cp -fr SkEditor.ico "$pkgdir/opt/SkEditor"
    cp -fr bin/Release/net8.0/linux-x64/publish/* "$pkgdir/opt/SkEditor"

    chmod +x "$pkgdir/opt/SkEditor/SkEditor"

    ln -sf "/opt/SkEditor/SkEditor" "$pkgdir/usr/bin/SkEditor"

    wget -q https://gist.github.com/FixeQyt/d1dfa9b3bb6e49eb017908c009cc78cd/raw -O SkEditor.desktop 

    version=$(grep -oP '(?<=<Version>)[0-9.]+(?=</Version>)' SkEditor.csproj)
    sed -i "s/^Version=.*/Version=${version}/" "SkEditor.desktop"

    install -Dm644 SkEditor.desktop "$pkgdir/usr/share/applications/SkEditor.desktop"
}
