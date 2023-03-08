# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-git
_pkgname=pot-translation
prjname=pot
pkgver=0.0.6.r0.g873fc5a
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xsel')
makedepends=('nodejs' 'pnpm' 'rust')

source=(git+$url.git)

sha512sums=('SKIP')

pkgver() {
    cd $srcdir/${prjname}
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd $srcdir/${prjname}
    sed -i "s/\"version\":.*/\"version\": \"$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' |sed 's/.\(r[0-9]\)/\-\1/')\"/g" src-tauri/tauri.conf.json
}
build(){
    cd $srcdir/${prjname}
    pnpm i
    pnpm tauri build -b deb
}
package() {
    cd $srcdir/${prjname}
    tar xpf src-tauri/target/release/bundle/deb/${prjname}_$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' |sed 's/.\(r[0-9]\)/\-\1/')_amd64/data.tar.gz -C ${pkgdir}
}
