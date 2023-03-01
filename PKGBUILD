# Maintainer: Zhang Hua<zhanghuadedn at gmail dot com>
# Contributor: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Tech <technetium1337 at gmail dot com>
# Contributor: taotieren <admin at taotieren dot com>
# Contributor: Ataraxy
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com

pkgname='rustdesk-flutter-git'
pkgver=1.2.0.r1948.ga071700c
pkgrel=1
pkgdesc='A open source virtual / remote desktop infrastructure for everyone with flutter UI'
provides=('rustdesk' 'rustdesk-flutter')
conflicts=('rustdesk' 'rustdesk-flutter')
arch=('x86_64')
url='https://github.com/rustdesk/rustdesk'
license=('GPL3')
depends=(
    'gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'curl' 'libva' 'libappindicator-gtk3'
    'pulseaudio' 'gst-plugins-base-libs' 'hicolor-icon-theme' 'xdg-utils' 'xdg-user-dirs'
    'libvdpau' 'polkit'
)
makedepends=(
    'unzip' 'yasm' 'nasm' 'clang' 'zip' 'git' 'cmake' 'wget' 'rust' 'vcpkg' 'python'
    'ninja' 'flutter' 'yq'
)
source=(
    "git+${url}.git"
)
sha256sums=('SKIP')
options=(!lto !strip)

prepare(){
    rm -rf "${srcdir}/vcpkg" "${srcdir}/flutter"
    cp -r /opt/vcpkg /opt/flutter "${srcdir}/"
}
pkgver(){
    cd "${srcdir}/rustdesk"
    ver=$(tomlq .package.version Cargo.toml | sed 's/"//g')
    git describe --long --tags | sed "s/nightly/${ver}/;s/-/.r/;s/-/./g"
}
build(){
    # Prepare environments
    export VCPKG_ROOT="${srcdir}/vcpkg"
    export FLUTTER_HOME="${srcdir}/flutter"
    export PATH="${VCPKG_ROOT}:${FLUTTER_HOME}/bin:${HOME}/.cargo/bin:${PATH}"
    ## https://cjycode.com/flutter_rust_bridge/troubleshooting.html#the-generated-store_dart_post_cobject-has-the-wrong-signature--stdargh-file-not-found-in-linux--stdboolh--
    export CPATH="$(clang -v 2>&1 | grep 'Selected GCC installation' | rev | cut -d' ' -f1 | rev)/include"
    # See .github/workflows/flutter-ci.yml
    msg2 'Installing vcpkg requirements...'
    vcpkg install libvpx libyuv opus
    msg2 'Installing flutter_rust_bridge_codegen...'
    _frbc_ver=$(tomlq '.["build-dependencies"].flutter_rust_bridge_codegen' "${srcdir}/rustdesk/Cargo.toml" | sed 's/"//g')
    cargo install flutter_rust_bridge_codegen --version ${_frbc_ver}
    msg2 'Generating flutter_rust_bridge codes...'
    cd "${srcdir}/rustdesk/flutter"
    flutter pub get
    cd "${srcdir}/rustdesk"
    flutter_rust_bridge_codegen \
        --rust-input ./src/flutter_ffi.rs \
        --dart-output ./flutter/lib/generated_bridge.dart
    msg2 'Building librustdesk...'
    cargo build --lib --features hwcodec,flutter,flutter_texture_render --release
    msg2 'Building rustdesk...'
    cd "${srcdir}/rustdesk/flutter"
    flutter build linux --release
}
check(){
    cd "${srcdir}/rustdesk/flutter"
    # Needs DISPLAY
    #cargo test --lib --features hwcodec,flutter,flutter_texture_render --release
    #flutter test
}
package(){
    case ${CARCH} in
        x86_64):
            _arch=x64;;
        aarch64):
            _arch=arm64;;
        *):
            _arch=${CARCH};;
    esac
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -a "${srcdir}/rustdesk/flutter/build/linux/${_arch}/release/bundle" \
        "${pkgdir}/opt/rustdesk"
    ln -s /opt/rustdesk/rustdesk "${pkgdir}/usr/bin/rustdesk"
    install -Dm644 "${srcdir}/rustdesk/res/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/rustdesk.png"
    install -Dm644 "${srcdir}/rustdesk/res/64x64.png" \
        "${pkgdir}/usr/share/icons/hicolor/64x64/apps/rustdesk.png"
    install -Dm644 "${srcdir}/rustdesk/res/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/rustdesk.png"
    install -Dm644 "${srcdir}/rustdesk/res/128x128@2x.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/rustdesk.png"
    install -Dm644 "${srcdir}/rustdesk/res/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024x/apps/rustdesk.png"
    install -Dm644 "${srcdir}/rustdesk/res/rustdesk-link.desktop" \
        "${pkgdir}/usr/share/applications/rustdesk-link.desktop"
    install -Dm644 "${srcdir}/rustdesk/res/rustdesk.desktop" \
        "${pkgdir}/usr/share/applications/rustdesk.desktop"
    install -Dm644 "${srcdir}/rustdesk/res/rustdesk.service" \
        "${pkgdir}/usr/lib/systemd/system/rustdesk.service"
    install -Dm644 "${srcdir}/rustdesk/res/com.rustdesk.RustDesk.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/com.rustdesk.RustDesk.policy"
    sed -i 's|/usr/share/rustdesk/files/rustdesk.png|rustdesk|' \
        "${pkgdir}/usr/share/applications/rustdesk.desktop"
    sed -i 's|/usr/share/rustdesk/files/polkit|/usr/bin/rustdesk|' \
        "${pkgdir}/usr/share/polkit-1/actions/com.rustdesk.RustDesk.policy"
}
