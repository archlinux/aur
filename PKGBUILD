# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=dot-git
pkgver=0.1
pkgrel=0
pkgdesc="Dot Browser is a privacy-conscious web browser based on Firefox. (Built from source)"
arch=("x86_64")
url="https://github.com/dothq/browser"
license=('MPL-2.0')
depends=()
provides=('dot')
makedepends=('yarn' 'nodejs' 'git' 'sccache' 'cbindgen')

firefox_version="87.0"
source=("$pkgname-$pkgver"::"git+https://github.com/dothq/browser-ff.git"
"firefox-source-$firefox_version"::"https://archive.mozilla.org/pub/firefox/releases/$firefox_version/source/firefox-$firefox_version.source.tar.xz")
sha256sums=('SKIP' 'SKIP')

prepare() {
    orange='[33m'
    blue='[34m'
    reset='[0m'

    echo -e "${orange}WARNING${reset} You are compiling Dot from source! This will take up to an hour depending on your hardware."
    echo -e "${blue}INFO${reset} You should install \`dot-bin\` if you do not want to compile from source."

    cd firefox-$firefox_version
    git init
    git config core.autocrlf false
    git checkout --orphan ff
    git add . -v > /dev/null
    git commit -am "Firefox" > /dev/null
    git checkout -b dot
    cd ..
    
    cd $pkgname-$pkgver
    mv ../firefox-$firefox_version src
}

build() {
    export MACH_USE_SYSTEM_PYTHON=true
    cd $pkgname-$pkgver
    ./melon import --minimal
    ./melon build
    ./melon package
}

package() {
    mkdir -p $pkgdir/opt
    cd $pkgdir/opt
    tar -xjf $srcdir/firefox-$firefox_version/obj-*/dist/dot-$firefox_version.en-US.linux-x86_64.tar.bz2
}
