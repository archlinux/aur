_java=25
_suffix=-ce
pkgname=spotube
pkgver=6.0.0
pkgrel=1
pkgdesc="Open source music client! Available for both desktop & mobile!"
arch=("x86_64" "aarch64")
url="https://spotube.cc/"
license=("AGPL-3.0-or-later")
depends=("libstdc++" "glibc" "webkit2gtk-4.1" "libsoup3" "gtk3" "cairo" "libvlc" "vlc-plugins-base"
         "alsa-lib" "libglvnd" "libxtst" "libxi" "libxrender" "fontconfig" "freetype2" "zlib"
         "libxext" "libx11")
# It does not provide jdk$_java-gravvalvm
makedepends=("git" "cargo" "patchelf" "jdk$_java-graalvm$_suffix-bin" "git-cliff")
options=(!lto)
source=("git+https://github.com/team-spotube/spotube.git#tag=v${pkgver/.beta/-beta}"
        # Check .github/workflows/spotube-release-binary.yml for commit
        "git+https://github.com/KRTirtho/ComposeNativeWebview.git#commit=b11ac748de1219f9432338c067a2c5dafef3072a"
        0001-remove-compose-webview-non-linux.diff
        0002-remove-spotube-non-linux.diff
        0003-apply-build-flags.diff)
sha256sums=('7823cdecc12ebdb0427efd646bf72deba99974af4c4e24156be17a2ed6d3fed3'
            'b930c38a9bf078e6af72e06c282663f4f1513cd93f1c768828dac5d478d4abf1'
            '829f8f0e774654399c2d33741eee95bceaa7dae771860a27720d01293b858dec'
            '5d22e66b0c70f4a5b709635e686755fcbe9afe7a2f9b9b588c8eaed78a16c458'
            'be082df5c1d6ebabea5b0864b074913384f3e2ecee6013e7879bd83e0768f5de')

prepare() {
    cd "$srcdir/ComposeNativeWebview"
    patch -Np1 -i ../0001-remove-compose-webview-non-linux.diff
    cd "$srcdir/$pkgname"
    ln -s ../ComposeNativeWebview compose-webview
    patch -Np1 -i ../0002-remove-spotube-non-linux.diff
    patch -Np1 -i ../0003-apply-build-flags.diff
}

build() {
    # Or they'll download another graalvm jdk
    export GRAALVM_HOME="/usr/lib/jvm/java-$_java-graalvm$_suffix"
    export JAVA_HOME="$GRAALVM_HOME"
    export PATH="$JAVA_HOME/bin:$PATH"
    # Uniffi depends on the non-stripped binary to generate
    export CARGO_PROFILE_RELEASE_STRIP=false
    cd "$srcdir/ComposeNativeWebview"
    local _arch
    case ${CARCH} in
        x86_64)
            _arch=x64
            ;;
        aarch64)
            _arch=arm64
            ;;
        *)
            echo "Unknown architecture ${CARCH}."
            exit 1
            ;;
    esac
    # webview-compose/src/jvmMain/native/linux/build.sh
    local out_dir="webview-compose/src/jvmMain/resources/nucleus/native/linux-$_arch"
    mkdir -p "$out_dir"
    cc -shared -fPIC -O2 -fvisibility=hidden \
        -I"$PWD/webview-compose/src/jvmMain/native/linux" \
        -I"$JAVA_HOME/include" \
        -I"$JAVA_HOME/include/linux" \
        $(pkg-config --cflags webkit2gtk-4.1 gtk+-3.0 libsoup-3.0) \
        $CFLAGS $LDFLAGS \
        "$PWD/webview-compose/src/jvmMain/native/linux/"{jni_bridge,view_signals,input_routing,view_lifecycle,navigation,javascript,cookies,screenshot}.c \
        $(pkg-config --libs webkit2gtk-4.1 gtk+-3.0 libsoup-3.0) -lcairo -lpthread \
    -o "$out_dir/libcompose_webview_linux.so"
    ./gradlew publishToMavenLocal
    cd "$srcdir/$pkgname"
    ./gradlew :composeApp:createGraalvmNativeDistributable -Pnightly=false -PbuildNumber=$pkgrel
    ./gradlew :composeApp:renderPackagingLinux -Pnightly=false -PbuildNumber=$pkgrel
}

package() {
    depends+=("hicolor-icon-theme")

    cd "$pkgname"
    # packaging/package-linux-tarball.sh
    mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/bin"
    cp -a --no-preserve=ownership composeApp/build/compose/binaries/main/graalvm-app/org.spotube.spotube "$pkgdir/usr/lib/$pkgname"
    ln -srf "$pkgdir/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin"
    install -Dm644 -t "$pkgdir/usr/share/applications/" composeApp/build/packaging/linux/org.spotube.spotube.desktop
    install -Dm644 composeApp/icons/stable/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/org.spotube.spotube.png"
    install -Dm644 -t "$pkgdir/usr/share/metainfo/" composeApp/build/packaging/linux/org.spotube.spotube.metainfo.xml
    # The StartupWMClass is hardcoded here...
    sed -i 's/org-spotube-spotube-MainKt/spotube/' "$pkgdir/usr/share/applications/org.spotube.spotube.desktop"
}
