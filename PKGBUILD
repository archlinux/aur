# Maintainer: Miepee <janbidler00 at tutanota dot com>
pkgname=am2rlauncher-git
pkgver=2.1.0.r2.e97d335
pkgrel=1
pkgdesc="Application for installing the latest Community Updates, APKs and Mods for AM2R."
arch=(x86_64)
url="https://github.com/AM2R-Community-Developers/AM2RLauncher"
license=('GPL3')
depends=('dotnet-runtime' 'gtk3' 'libappindicator-gtk3' 'webkit2gtk' 'openssl' 'icu' 'xdelta3' 'fuse2')
makedepends=('git' 'dotnet-runtime>=5' 'dotnet-sdk>=5')
optdepends=('jre-openjdk: Creating APKs')
conflicts=('am2rlauncher')
source=("git+$url")
md5sums=(SKIP)
options=(!strip)
# ^ doesn't correctly publish without

pkgver() {
    cd "AM2RLauncher"
    printf %s "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
}

build() {
    cd "AM2RLauncher/AM2RLauncher/"
    dotnet publish AM2RLauncher.Gtk -p:PublishSingleFile=true -c release -r ubuntu.18.04-x64 --no-self-contained
}

package() {

    # remame files properly
    mv -f AM2RLauncher/AM2RLauncher/AM2RLauncher.Gtk/bin/release/net5.0/ubuntu.18.04-x64/publish/AM2RLauncher.Gtk AM2RLauncher/AM2RLauncher/AM2RLauncher.Gtk/bin/release/net5.0/ubuntu.18.04-x64/publish/AM2RLauncher
    mv -f AM2RLauncher/AM2RLauncher/AM2RLauncher.Gtk/bin/release/net5.0/ubuntu.18.04-x64/publish/AM2RLauncher.Gtk.pdb AM2RLauncher/AM2RLauncher/AM2RLauncher.Gtk/bin/release/net5.0/ubuntu.18.04-x64/publish/AM2RLauncher.pdb

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/opt/am2rlauncher/"
    
    cp -Rf AM2RLauncher/AM2RLauncher/AM2RLauncher.Gtk/bin/release/net5.0/ubuntu.18.04-x64/publish/* "$pkgdir/opt/am2rlauncher/"
    cp -f "AM2RLauncher/AM2RLauncher/AM2RLauncher.Gtk/icon64.ico" $pkgdir/opt/am2rlauncher/AM2RLauncher.ico
    cd "$pkgdir/usr/bin/"
    ln -sf "/opt/am2rlauncher/AM2RLauncher"

    # Adding desktop entry
    mkdir -p "$pkgdir/usr/share/applications/"
    echo "[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=AM2RLauncher
Comment=A front-end application that simplifies installing the latest AM2R-Community-Updates, creating APKs for Android use, as well as Mods for AM2R.
Exec=AM2RLauncher
Icon=/opt/am2rlauncher/AM2RLauncher.ico
Terminal=false" > $pkgdir/usr/share/applications/am2rlauncher.desktop
}
