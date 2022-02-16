# Maintainer: Jonathan Dönszelmann <jonabent@gmail.com>
pkgname=webdsl-eclipse-git
pkgver=r478.994489b
pkgrel=1
pkgdesc=""
arch=(x86_64)
url=""
license=('Apache License 2.0')
groups=()
depends=('java-runtime')
makedepends=('jdk8-openjdk' 'python' 'python-pip' 'tar' 'desktop-file-utils')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('webdsl-eclipse::git+https://github.com/webdsl/webdsl-editor#branch=master' 'webdsl-git::git+https://aur.archlinux.org/webdsl-git#branch=master')
noextract=()
md5sums=('SKIP' 'SKIP') 

pkgver() {
    cd "webdsl-eclipse"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    python -m pip install https://github.com/Gohla/eclipsegen_cli/archive/master.zip --upgrade --user
}

build() {

    if pacman -Qs "webdsl-git" > /dev/null ; then
        echo "webdsl is already installed, skipping..."
    else
        cd "webdsl-git"
        makepkg -si --noconfirm
        cd ..
    fi

    export PATH="/usr/lib/jvm/java-8-openjdk/bin/:$PATH"
    java -version

    rm -rf "$srcdir"/build/eclipse
    cd "webdsl-eclipse"
    eclipsegen create "$srcdir"/build/eclipse -o linux -h x64 \
        --install webdsl.editor.feature.feature.group \
        --repo http://webdsl.org/update -a --archive-jre-separately \
        -p platform -p java

    desktopfile="[Desktop Entry]
Type=Application
Name=Webdsl Eclipse
Comment=An editor for webdsl programs
Path=/opt/webdsl-eclipse
Exec=/opt/webdsl-eclipse/eclipse
Terminal=false
Categories=Education;Languages;Java
Name[en_US]=Webdsl Eclipse"

    echo -n "$desktopfile" > "$srcdir"/webdsl-eclipse.desktop 

}

package() {
    cd "webdsl-eclipse"

    cd "$srcdir"/build/eclipse/
    tar -xf "$srcdir"/build/eclipse/*.tar.gz

    mkdir -p $pkgdir/opt/webdsl-eclipse
    cp -r "$srcdir"/build/eclipse/Eclipse/* $pkgdir/opt/webdsl-eclipse
    chmod +x $pkgdir/opt/webdsl-eclipse/eclipse

    mkdir -p "$pkgdir"/usr/share/applications
    
    install -Dm644 "$srcdir"/webdsl-eclipse.desktop "$pkgdir"/usr/share/applications/webdsl-eclipse.desktop 
}
