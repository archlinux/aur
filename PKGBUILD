# Maintainer: Frank Vanderham <twelve dot eighty at gmail dot com>
_pkgname=RSSOwlnix
pkgname="${_pkgname,,}"
_pkgtag="2.8.0"
pkgver="${_pkgtag}_beta"
pkgrel=1
pkgdesc="Organize, search and read your RSS, RDF & Atom news feeds in a comfortable way"
arch=('any')
url="https://github.com/Xyrio/RSSOwlnix"
license=('EPL')
depends=('java-runtime>=8' 'webkit2gtk')
makedepends=('java-environment=8' 'git' 'maven')
source=("git+https://github.com/Xyrio/$_pkgname.git#tag=$_pkgtag"
        "rssowlnix01.patch")
# noextract=()
md5sums=("SKIP"
         "a1f7369dfebe543dcf1e2079e3925c7d")

prepare() {
    cd "$_pkgname"
    patch --forward --strip=1 --input="${srcdir}/rssowlnix01.patch"
}

build() {
    mkdir -p mvnrepo
    cd "$_pkgname"
    # mvn clean verify -Dmaven.test.skip=true -Dmaven.repo.local=/home/admin/aur/mvn/mvnrepo
    mvn clean verify "-Dmaven.test.skip=true" "-Dmaven.repo.local=${srcdir}/mvnrepo"
}

package() {
    cd "$_pkgname"
    install -d "$pkgdir/usr/lib"
    cp -a ./releng/product/target/products/org.rssowl.ui.product/linux/gtk/x86_64/RSSOwlnix "$pkgdir/usr/lib"
    install -D /dev/stdin "$pkgdir/usr/bin/RSSOwlnix" <<END
#!/bin/bash
export RSSOWLNIX_HOME=/usr/lib/RSSOwlnix
exec \$RSSOWLNIX_HOME/RSSOwlnix "\$@"
END

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/RSSOwlnix.desktop" <<END
[Desktop Entry]
Name=RSSOwlnix
Comment=Organize, search and read your RSS, RDF and Atom news feeds in a comfortable way
Icon=rssowlnix
Exec=RSSOwlnix
Terminal=false
Type=Application
Categories=Network;RSS;
StartupNotify=true
END

    for i in 16 24 32 48 64 128 256; do
        install -Dm644 "org.rssowl.ui/icons/product/${i}x${i}.png" \
            "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/rssowlnix.png"
    done
}

