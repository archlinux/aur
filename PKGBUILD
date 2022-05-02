# Maintainer: Michal Štefáček <493msi@gmail.com>

_basename="jsrclone"
pkgname=jsrclone-git
pkgver=22.2.0.0.alpha.2.r2.g81064b6
pkgrel=3
pkgdesc="A simple multidirectional shoot em up game written in Java."
url="https://github.com/493msi/plutoengine"
license=(MIT)
arch=(x86_64)
makedepends=(git jdk-openjdk)
provides=()
source=("git+${url}.git"
        "git+https://github.com/493msi/libra.git")
sha256sums=("SKIP"
            "SKIP")

prepare() {
    cd plutoengine
    git submodule init
    git config submodule.libra.url "$srcdir/libra"
    git submodule update
}

build() {
    cd plutoengine
    ./gradlew :plutoengine-demos:jsr-clone:distTar

    cd "$srcdir/"
    tar -xf "plutoengine/engine-demo/jsr-clone/build/distributions/"jsr-clone-*.tar

    echo "[Desktop Entry]
    Name=JSRClone $_pkgver
    Comment=A simple multidirectional shoot em up game written in Java.
    Exec=/opt/$_basename/bin/jsr-clone
    Path=/opt/$_basename
    Terminal=false
    Type=Application
    Categories=Games;" > "$srcdir/$_basename.desktop"
}

pkgver() {
    cd "plutoengine"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -d "$pkgdir/opt"
    cp -rf "$srcdir/"jsr-clone* "$pkgdir/opt/$_basename"
    install -dm777 "$pkgdir/opt/$_basename/logs"
    install -Dm644 "$srcdir/$_basename.desktop" "$pkgdir/usr/share/applications/$_basename.desktop"
    install -Dm644 plutoengine/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
