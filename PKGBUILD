# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-git
_pkgname=pot-translation
reponame=pot-desktop
prjname=pot
pkgver=0.3.0.r1.g63980f2
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')
makedepends=('nodejs' 'pnpm' 'rust')

source=(git+$url.git)

sha512sums=('SKIP')

pkgver() {
    cd $srcdir/${reponame}
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd $srcdir/${reponame}
    sed -i "s/\"version\":.*/\"version\": \"$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' |sed 's/.\(r[0-9]\)/\-\1/')\"/g" src-tauri/tauri.conf.json
}
build(){
    cd $srcdir/${reponame}
    pnpm i
    pnpm tauri build -b deb
}
package() {
    cd $srcdir/${reponame}
    tar xpf src-tauri/target/release/bundle/deb/${prjname}_$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' |sed 's/.\(r[0-9]\)/\-\1/')_amd64/data.tar.gz -C ${pkgdir}
}
