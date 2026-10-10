# Maintainer: PastLeo <chgu82837@gmail.com>
# AUR packaging recipe; see docs/arch-linux.md.
pkgname=fcitx5-misstype-git
pkgver=0.1.r212.g5135a1f
pkgrel=1
pkgdesc='Offline, fuzzy Zhuyin input method for fcitx5'
arch=('x86_64' 'aarch64')
url='https://github.com/Yukaii/misstype'
license=('MIT' 'BSD-3-Clause' 'CC-BY-4.0' 'CC-BY-SA-4.0' 'Unicode-3.0')
depends=('fcitx5' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'ninja' 'python' 'gtk4')
optdepends=('fcitx5-configtool: add Misstype to your input methods'
            'gtk4: misstype-dictionary-editor'
            'fcitx5-gtk: GTK application integration'
            'fcitx5-qt: Qt application integration')
provides=('fcitx5-misstype')
conflicts=('fcitx5-misstype' 'fcitx5-mistype-git')
# Zig manages its own optimization and debug information.
options=('!lto' '!debug')
_mcbopomofo=f5ba010ce8795d283ee336ca7d16380f200bd2ec
_naer=889efe0da5e10f5eea5920027748e9dd1f58169a
_english=525f9b560de45753a5ea01069454e72e9aa541c6
source=("misstype::git+${MISSTYPE_SOURCE_URL:-$url.git}"
        "BPMFBase.txt::https://raw.githubusercontent.com/openvanilla/McBopomofo/$_mcbopomofo/Source/Data/BPMFBase.txt"
        "BPMFMappings.txt::https://raw.githubusercontent.com/openvanilla/McBopomofo/$_mcbopomofo/Source/Data/BPMFMappings.txt"
        "phrase.occ::https://raw.githubusercontent.com/openvanilla/McBopomofo/$_mcbopomofo/Source/Data/phrase.occ"
        "mcbopomofo-LICENSE.txt::https://raw.githubusercontent.com/openvanilla/McBopomofo/$_mcbopomofo/LICENSE.txt"
        "mcbopomofo-README.md::https://raw.githubusercontent.com/openvanilla/McBopomofo/$_mcbopomofo/Source/Data/README.md"
        "heterophony1.list::https://raw.githubusercontent.com/openvanilla/McBopomofo/$_mcbopomofo/Source/Data/heterophony1.list"
        "heterophony2.list::https://raw.githubusercontent.com/openvanilla/McBopomofo/$_mcbopomofo/Source/Data/heterophony2.list"
        "heterophony3.list::https://raw.githubusercontent.com/openvanilla/McBopomofo/$_mcbopomofo/Source/Data/heterophony3.list"
        "frequency.tsv::https://raw.githubusercontent.com/chiakich/ChiaKey-Lexicon/$_naer/sources/naer-word-frequency/frequency.tsv"
        "en_50k.txt::https://raw.githubusercontent.com/hermitdave/FrequencyWords/$_english/content/2018/en/en_50k.txt"
        'cxx20.patch')
sha256sums=('SKIP'
            '46e64a53dc9c6baa2cbe6e0b1af572f8ef6aafb50597178b5fd53df804316ce7'
            'baa9452ef927b3268f600ca69fe27eb0838b8be31c8ae0dd8540561db68c7ffd'
            '2dbe37c1c61266f65d158a3e0020a0c1f2a75039ebd7f1580ef8e537a7bc8779'
            '72ed32193b0c629def66df63791b2fb125946b593a3251380e6b949488f47b72'
            '4b2eea7122a2a4d8bea7f23f611c6817d681a55d397b1ba3f8100acbfeb9f82e'
            '7fddbb6a66022b1809181484c7627d79dee4231849cb2d3c8c8cd4578b3d22cb'
            '4afd69a2702ae3af533cd01b755f81d77a430ace91311a8229319334aec24e37'
            '8be3f37fe419744c3792df1bdfc67a0abdb215dbbb759c92204d4f8d68a32cd9'
            'd8bf3ebec541c3dde967d536e05a33a2b8d5e4c4aeea1205feb4f0867220169a'
            '5351ff405b1126ef555791dd4d9798a48e3e9a501a9fc481a9da957752cfb458'
            '6dac94bbaab952f27dec7b79c9dff062f6f31ab4d471770e13a132516aed8e6a')

_zig_version=0.17.0
source_x86_64=("https://ziglang.org/download/$_zig_version/zig-x86_64-linux-$_zig_version.tar.xz")
sha256sums_x86_64=('1cbe9df9f27e6b78d14ccbca43b6703a404ef79ef1c463de901d7f088d4e2026')
source_aarch64=("https://ziglang.org/download/$_zig_version/zig-aarch64-linux-$_zig_version.tar.xz")
sha256sums_aarch64=('9e8d11661d4ae3bd57702a3832781e23ad151dde5798e16a5ccd503f65234ff8')

_zig() {
    export MISSTYPE_ZIG="$srcdir/zig-$CARCH-linux-$_zig_version/zig"
}

pkgver() {
    cd "$srcdir/misstype"
    printf '0.1.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/misstype"
    # Until the matching CMake fix is available in upstream Git.
    if ! grep -q 'set(CMAKE_CXX_STANDARD 20)' linux/fcitx5/CMakeLists.txt; then
        patch -Np1 -i "$srcdir/cxx20.patch"
    fi
    # Seed the upstream cache from makepkg's verified sources: no downloads
    # during prepare/build/check. Upstream verifies the manifests again.
    install -dm755 .cache/{mcbopomofo,naer,frequencywords}
    install -m644 "$srcdir/"{BPMFBase.txt,BPMFMappings.txt,phrase.occ,heterophony{1,2,3}.list} .cache/mcbopomofo/
    install -m644 "$srcdir/mcbopomofo-LICENSE.txt" .cache/mcbopomofo/LICENSE.txt
    install -m644 "$srcdir/mcbopomofo-README.md" .cache/mcbopomofo/README.md
    install -m644 "$srcdir/frequency.tsv" .cache/naer/
    install -m644 "$srcdir/en_50k.txt" .cache/frequencywords/
    python script/prepare_lexicon.py
}

build() {
    cd "$srcdir/misstype"
    _zig
    # libMisstypeCAPI.so and misstypectl (settings/dictionary CLI).
    bash script/linux/build_capi.sh
    local capi_dir
    capi_dir=$(cat build/capi/libdir)
    cmake -S linux/fcitx5 -B build/arch -G Ninja \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib -DMISSTYPE_CAPI_DIR="$capi_dir"
    cmake --build build/arch
}

check() {
    cd "$srcdir/misstype"
    _zig
    (cd core-zig && "$MISSTYPE_ZIG" build test -Doptimize=ReleaseFast)
    bash script/linux/test_capi.sh
    ctest --test-dir build/arch --output-on-failure
}

package() {
    cd "$srcdir/misstype"
    DESTDIR="$pkgdir" cmake --install build/arch
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
    cp -a third_party "$pkgdir/usr/share/licenses/$pkgname/"
}
