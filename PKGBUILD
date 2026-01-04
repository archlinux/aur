pkgname=serycade-git
pkgdesc='Some tui games i made because i was bored. Currently pong and a maze'
pkgver=r33.a4325bf
pkgrel=2
license=('CDDL-1.0')
url='https://serenit.ie/projects#serycade'
arch=('x86_64' 'aarch64')

depends=('libcrypt.so')
makedepends=('gradle')
source=("git+https://codeberg.org/sery/serycade.git")
sha256sums=("SKIP")

srcName="serycade"
binaryName="serycade"

prepare() {
    cd "$srcName"
    if [[ -z "$(git config --get user.name)" ]]; then
      git config user.name local && git config user.email '<>' && git config commit.gpgsign false
    fi
}

pkgver() {
    cd "$srcName"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

    if [ "$CARCH" == "x86_64" ]; then
        target='LinuxX64'
    elif [ "$CARCH" == "aarch64" ]; then
        target='LinuxArm64'
    fi

    # Figure out jvm >= 17 installation
    jvm=$(ls /usr/lib/jvm | sed -n -r "s/(.*([0-9][0-9]).*)/\2 \1/p" | awk '$1>=17{print $2}' | head -n 1)

    export JAVA_HOME="/usr/lib/jvm/$jvm"
    export KONAN_DATA_DIR="$srcdir/konan"
    # Also using local konan and gradle directories to avoid weird conflicts

    cd "$srcName"
    gradle -g "$srcdir/gradle" "linkReleaseExecutable$target"
}

package() {
    if [ "$CARCH" == "x86_64" ]; then
        target='linuxX64'
    elif [ "$CARCH" == "aarch64" ]; then
        target='linuxArm64'
    fi

    cd "$srcName"

    install -Dm755 "build/bin/$target/releaseExecutable/$binaryName.kexe" "$pkgdir/usr/bin/$binaryName"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# invokekitty (sery) <meow@serenit.ie>
