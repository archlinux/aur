# Maintainer: Markus Kannisto <m.kannisto01@gmail.com>

pkgname=scribbit
pkgver=2021.1105.1
pkgrel=1

dotnet_version=5.0

pkgdesc="Scribbit is a simple, lightweight, and minimal text editor for Linux."
arch=('x86_64')
license=('GLP')
url='https://github.com/Marakusa/Scribbit/'

depends=("dotnet-runtime>=$dotnet_version.0")
makedepends=(git "dotnet-sdk>=$dotnet_version.5.sdk202")

source=(
    "scribbit::git+https://github.com/Marakusa/Scribbit.git#tag=$pkgver"
    'scribbit-launcher'
    'scribbit.desktop'
    'scribbit.png'
)

sha256sums=('SKIP'
            '6f4d77dce547ca1b8ba376a6fb1d5d7acf513f61f54d3e834504c6d835a3bd25'
            'bf58390696dd90c27e036b20bfbe29adce0256f468412960599355490edff9d7'
            'be938063dacac19788e0fb5ea2aebf1c63170639a8154d6dfbbc5b0aed8d190a')

build()
{
    cd "scribbit"
    output="./scribbit/bin/Release/net$dotnet_version/linux-x64"

    dotnet publish          Scribbit                    \
        --framework         net$dotnet_version          \
        --configuration     Release                     \
        --runtime           linux-x64                   \
        --output            $output                     \
        --no-self-contained                             \
        /property:Version=$pkgver
}

package()
{
    # Launcher script
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 'scribbit-launcher' "$pkgdir/usr/bin/scribbit"

    # Add .desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    install -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Application icon
    mkdir -p "$pkgdir/usr/share/pixmaps"
    install -m644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Compiled binaries
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cd "$srcdir/scribbit/Scribbit/bin/Release/net$dotnet_version/"
    cp -r "linux-x64"/* "$pkgdir/usr/lib/$pkgname/"
}
