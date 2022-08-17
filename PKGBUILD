# Maintainer: Gleb Liutsko <gleb@liutsko.ru>

pkgname=sqltoolsservice
pkgver=4.3.0.3
pkgrel=1
pkgdesc='SQL Tools API service that provides SQL Server data management capabilities.'
url='https://github.com/microsoft/sqltoolsservice'
license=('MIT')

arch=('any')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk')

source=("https://github.com/microsoft/${pkgname}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2c19b9d307decbe0e8d5dfab9d60e893026ecd9377e560958690aed87805bbf5')

fixLocaleName() {
    oldName=$1
    newName=$2

    grep -il $oldName -R . | xargs -I FILE sed -i -e "s/$oldName/$newName/gI" FILE

    find . -iname "*$oldName*" | while read filename; do
        newFilename=$(sed "s/$oldName/$newName/gI" <<< $filename)
        if [ "$newFilename" != "$filename" ]; then
            mv -v "$filename" "$newFilename"
        fi
    done

    mkdir -v -p "bin/"{Debug,Release}"/net6.0/$newName"
}

prepare() {
    cd "$pkgname-$pkgver"

    # Fix case localization files
    #
    # https://github.com/r-k-b/sqltoolsservice/commit/1a949aff0e5bc28dd8b7200cf806c2812b1f7d86
    # https://github.com/microsoft/sqltoolsservice/issues/886
    # Thanks https://github.com/r-k-b
    fixLocaleName pt-br pt-BR
    fixLocaleName zh-hans zh-Hans
    fixLocaleName zh-hant zh-Hant

    # Fix version dotnet
    newGlobal=$(jq ".sdk.version = \"$(cd /; dotnet --version)\"" global.json)
    echo $newGlobal > global.json
}

build() {
    cd "$pkgname-$pkgver"

    dotnet publish src/Microsoft.SqlTools.ServiceLayer -c Release -f net6.0 -r linux-x64 --no-self-contained /p:DebugType=None /p:DebugSymbols=false -o ../publish
}

package() {
    mkdir -p "$pkgdir/usr/lib/"

    cp -r publish "$pkgdir/usr/lib/$pkgname"
    find "$pkgdir" -type f -exec chmod 644 {} \;
    find "$pkgdir" -iname '*.dll' -type f -exec chmod 755 {} \;
    find "$pkgdir" -type d -exec chmod 755 {} \;
    chmod +x "$pkgdir/usr/lib/$pkgname/"{MicrosoftSqlToolsCredentials,MicrosoftSqlToolsServiceLayer}
}
