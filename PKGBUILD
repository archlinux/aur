# Maintainer: Markus Kannisto <m.kannisto01@gmail.com>

pkgname=scribbit
pkgver=2021.1105.3
pkgrel=1

dotnet_version=5.0

pkgdesc="Scribbit is a simple, lightweight, and minimal text editor for Linux."
arch=('x86_64')
license=('GLP')
url='https://github.com/Marakusa/Scribbit/'

depends=("dotnet-runtime" "gtk3")
makedepends=("git" "dotnet-sdk")

source=(
    "scribbit::git+https://github.com/Marakusa/Scribbit.git#tag=$pkgver"
    'scribbit-launcher'
    'scribbit.desktop'
    'scribbit.svg'
)

sha256sums=('SKIP'
            '6f4d77dce547ca1b8ba376a6fb1d5d7acf513f61f54d3e834504c6d835a3bd25'
            'd07bdbf14069bbe3306b8b8738484153c00360c54ea2bf10f33d20f30709cffc'
            'a4765db17d47dcbba05762b5f7652f2c5380923d696eb66cc573f574949a4421')

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
    install -m644 "$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"

    # Compiled binaries
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cd "$srcdir/scribbit/Scribbit/bin/Release/net$dotnet_version/"
    cp -r "linux-x64"/* "$pkgdir/usr/lib/$pkgname/"
}
