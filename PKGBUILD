# Maintainer:	getzze[at]gmail[dot]com 
# Contributor:	Filippo Berto <berto.f at protonmail dot com>
# Contributor: Viktor Hundahl Strate <viktorstrate@gmail.com>

_gitname=tinyMediaManager
_pkgname=tinymediamanager
pkgname=tiny-media-manager-git
_pkgver=3.0
pkgver=3.0.r3690.41042a6b
pkgrel=1
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="https://www.tinymediamanager.org"
license=('Apache')
depends=('libmediainfo' 'java-environment>=8')
makedepends=('maven' 'git') # git for org.codehaus.mojo:buildnumber-maven-plugin
provides=('tiny-media-manager')
conflicts=('tiny-media-manager')

source=("git+https://github.com/$_gitname/$_gitname.git#branch=v3"
        "tinymediamanager.desktop"
        "tinymediamanager"
        "tinymediamanager-cli")
sha256sums=('SKIP'
            'e3d02ea65adf288daa76444957b6037281e752ab7eb4fef8c1797b866a3d407a'
            '7e26a713a1a7e2714c099106b42e3cbdcf6f7ee9a207d71247aa7a308ae2d622'
            'cace0ed459a0d77449060e9f753bfc1b26e9f43ded038495615be46a370c8d3b')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "3.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_gitname"

    ## File mispelled
    file="AppBundler/getdown.txt"
    filebis="AppBundler/getdown-nightly.txt"
    if [[ -f $filebis && ! -f $file ]]; then
        mv "$filebis" "$file"
    fi
}


build() {
    cd "$srcdir/$_gitname"
    mvn package
}

package() {
    cd "$srcdir/$_gitname/dist"

    mkdir -p "$pkgdir/usr/share/$_pkgname"
    tar -xf tmm_"${_pkgver}"*_linux.tar.gz
    #cp -r {lib/,plugins/,templates/,splashscreen.png,tmm.jar,tmm.png} "$pkgdir/usr/share/$_pkgname"
    rm tmm_"${_pkgver}"*
    cp -r * "$pkgdir/usr/share/$_pkgname"

    # Install desktop entry
    install -D "$srcdir/tinymediamanager.desktop" "$pkgdir/usr/share/applications/tinymediamanager.desktop"

    # Install launch scripts
    install -D "$srcdir/tinymediamanager-cli" "$pkgdir/usr/bin/tinymediamanager-cli"
    install -D "$srcdir/tinymediamanager" "$pkgdir/usr/bin/tinymediamanager"
}

