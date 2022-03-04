pkgname=paper-velocity-git
pkgver=3.1.2_SNAPSHOT.r1817.9c44aff8
pkgrel=1
epoch=0
pkgdesc='The modern, next-generation Minecraft server proxy with unparalleled server support, scalability, and flexibility.'
arch=('any')
url="https://papermc.io/"
license=("GPL")
depends=("java-runtime-headless>=17")
makedepends=("java-environment>=17" 'git' 'maven' 'gradle' 'grep' 'sed')
provides=("paper-velocity=${pkgver}")
source=('git+https://github.com/PaperMC/Velocity.git#branch=dev/3.0.0'
    'paper-velocity' 'velocity.service' 'velocity.socket' 'dirs.conf' 'user.conf')
sha256sums=('SKIP'
        '1d610f0473e92de7307647adde5797895b874e2284d6a2e1786d8273adcd70dc'
        'fdb2b3e146eed8a1b958bb45ae43dbca5b1daa1c92f8a6c03823509fda57bf14'
        '739cef227fcec714bc742f1278b598528dafeba7769f8bb714afc895ce22bce2'
        '5257a62232e244894d34e107557b6b809860b9358c91daeaf32c6446cab445d5'
        '04aa7400f0dcf7ecf2cac5a03198a656586f5b7f8d1b8fb79d8b98b48436b9bb')

pkgver() {
    cd "$srcdir/Velocity"
    printf "%s.r%s.%s" "$(grep -Po "(?<=    version ').*(?=')" build.gradle | sed 's/-/_/g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Velocity"

    export MAVEN_OPTS="-Xmx2G"
    gradle build
}

package() {
    cd "$srcdir/Velocity/proxy/build/libs/"

    jar=$(find . -type f -iname '*-all.jar' | sort | head -n 1)

    destdir="$pkgdir/usr/share/java/paper-velocity"
    mkdir -p "$destdir"
    cp "$jar" "$destdir/"

    ln -s "`basename "$jar"`" "$destdir/velocity.jar"

    install -Dm755 "$srcdir/paper-velocity" "$pkgdir/usr/bin/paper-velocity"
    install -D "$srcdir/velocity.service" "$pkgdir/usr/lib/systemd/system/velocity.service"
    install -D "$srcdir/velocity.socket" "$pkgdir/usr/lib/systemd/system/velocity.socket"
    install -D "$srcdir/user.conf" "$pkgdir/usr/lib/sysusers.d/velocity.conf"
    install -D "$srcdir/dirs.conf" "$pkgdir/usr/lib/tmpfiles.d/velocity.conf"
}

