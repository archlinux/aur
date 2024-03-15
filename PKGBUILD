# Maintainer: Crazybrain <crazy+aur at crazy dot biscuitmafia dot xyz>

pkgname=ss14.launcher
pkgver=0.26.0
pkgrel=3
pkgdesc="Space Station 14 launcher"
arch=('x86_64')
url='https://spacestation14.io'
license=('MIT')
depends=('gtk3' 'dotnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0')
optdepends=('fluidsynth: for in-game MIDI instruments')
source=(
    "${pkgname}.v${pkgver}.tar.gz::https://github.com/space-wizards/SS14.Launcher/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/space-wizards/Robust.LoaderApi/archive/99a2f4b88077629f69fb66f74f50e88dbe43e0e8.zip"
    'spacestation14.svg'::'https://raw.githubusercontent.com/space-wizards/asset-dump/master/icon.svg'
    'ss14.launcher.desktop')
sha256sums=(
    '8784bdcdf2b48b9cecd44dc6a16f74e82b8260495f8c1de42cd41bbe07629840'
    'eff77547bbdfe9d9bb633926b6763ca72793bad58adeda2cc33c15defe593ad3'
    'a047c810a26088cc1fd1df73036bd5b4cfb441c0697a2cbd583733d08474f37e'
    '4d68643cccbbb78dd92a14b37edf5476eaa48d5d523ef0d3fbf78f591b1f9ac2')
options=('!debug')

prepare() {
    # link the submodule
    rm -rf "$srcdir/SS14.Launcher-$pkgver/Robust.LoaderApi"
    ln -sf "$srcdir/Robust.LoaderApi-$(basename -- "${source[1]}" .zip)" "$srcdir/SS14.Launcher-$pkgver/Robust.LoaderApi"

    # workaround for animation using 100% CPU by making the dung spinner never run
    sed -i 's/INFINITE/0/' "$srcdir/SS14.Launcher-$pkgver/SS14.Launcher/Theme/ThemeDungSpinner.xaml"
}

build() {
    cd "$srcdir/SS14.Launcher-$pkgver"

    dotnet publish SS14.Launcher/SS14.Launcher.csproj /p:FullRelease=True -c Release --no-self-contained -r linux-x64 /nologo /p:RobustILLink=true
    dotnet publish SS14.Loader/SS14.Loader.csproj -c Release --no-self-contained -r linux-x64 /nologo
}

package() {
    # make sure LICENCE.txt links to licence
    install -Dm644 "$srcdir/SS14.Launcher-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "$pkgdir/usr/lib/$pkgname/loader"
    install -Dm644 "$srcdir/SS14.Launcher-$pkgver/SS14.Launcher/bin/Release/net8.0/linux-x64/publish/"* "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 "$srcdir/SS14.Launcher-$pkgver/SS14.Loader/bin/Release/net8.0/linux-x64/publish/"* "$pkgdir/usr/lib/$pkgname/loader/"
    chmod +x "$pkgdir/usr/lib/$pkgname/SS14.Launcher" "$pkgdir/usr/lib/$pkgname/loader/SS14.Loader"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/SS14.Launcher" "$pkgdir/usr/bin/ss14.launcher"

    mkdir -p "$pkgdir/usr/share/applications"
    sed "s/<VERSION>/$pkgver/" "$srcdir/ss14.launcher.desktop" > "$pkgdir/usr/share/applications/ss14.launcher.desktop"

    mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    install -Dm644 "$srcdir/spacestation14.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
