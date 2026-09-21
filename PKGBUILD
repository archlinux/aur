# Maintainer: Demitrius Belai <demitriusbelai at gmail dot com>

pkgname=anycubicslicernext-bin
pkgver=2.0.0.5
pkgrel=1
pkgdesc="Anycubic Slicer is an open source slicer for FDM printers"
arch=('x86_64')
url="https://github.com/ANYCUBIC-3D/AnycubicSlicer"
_url_source="https://cdn-universe-slicer.anycubic.com/prod"
license=("AGPL-3.0")
depends=('webkit2gtk-4.1' 'libxml2-legacy' 'libbsd' 'gtk3' 'zlib' 'wayland' 'libglvnd'
    'gst-plugins-base' 'gst-plugins-good' 'gst-libav' 'dbus' 'libsoup3')

source=("${_url_source}/pool/main/a/anycubicslicernext/AnycubicSlicerNext_linux-v2.0.0.5-20260913065625.deb"
    "https://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu74_74.2-1ubuntu3.1_amd64.deb"
    "https://archive.ubuntu.com/ubuntu/pool/main/libs/libselinux/libselinux1_3.5-2ubuntu2.1_amd64.deb"
    "AnycubicSlicerNext.sh"
    "acnext-workbench-fix.c")

noextract=("${source[@]##*/}")

sha256sums=('fe087a56014ed25cdfe4c3c293b517adaee0a9b2e1ded79f5e394b7968817c15'
    'c9a70989678660eed9a1e904c74fa043da8bec8e2036856fc16e31ced79b04f8'
    '6abaa6c26f46ef17764c4a753e0e84de1cdadde5634fd2987621fdc617988d19'
    '8b4157aa14a3500ac912ca0d9c366641e5a9ce79f553dd5f8aa10b390f08809f'
    '2f0f4a7183f4f261478ab86edfa0ab5ca497f6f47665674ddf4196b0c125df3c')

prepare() {
    [ -d AnycubicSlicerNext ] && rm -r AnycubicSlicerNext
    mkdir AnycubicSlicerNext
    pushd AnycubicSlicerNext
    packagename=$(basename "${source[0]}")
    ar x "../$packagename"
    bsdtar -xf data.tar.gz
    popd

    [ -d libicu74 ] && rm -r libicu74
    mkdir libicu74
    pushd libicu74
    ar x ../libicu74_*
    bsdtar -xf data.tar.zst
    popd

    [ -d libselinux1 ] && rm -r libselinux1
    mkdir libselinux1
    pushd libselinux1
    ar x ../libselinux1_*
    bsdtar -xf data.tar.zst
    popd
}

build() {
    sed -i 's@Icon=/usr/share/AnycubicSlicerNext/resources/images/AnycubicSlicer.png@Icon=/opt/AnycubicSlicerNext/resources/images/AnycubicSlicer.png@' \
        AnycubicSlicerNext/usr/share/applications/AnycubicSlicer.desktop
    gcc -shared -fPIC -O2 -o acnext-workbench-fix.so acnext-workbench-fix.c -ldl
}

package() {
    mkdir -p "${pkgdir}/opt/AnycubicSlicerNext/resources"
    mkdir -p "${pkgdir}/opt/AnycubicSlicerNext/usr/bin"
    mkdir -p "${pkgdir}/opt/AnycubicSlicerNext/lib"
    install -Dm755 AnycubicSlicerNext/usr/bin/AnycubicSlicerNext "${pkgdir}/opt/AnycubicSlicerNext/usr/bin/AnycubicSlicerNext"
    pushd AnycubicSlicerNext/usr/share/AnycubicSlicerNext/resources/
    find . -type f -exec install -Dm644 "{}" "${pkgdir}/opt/AnycubicSlicerNext/resources/{}" \;
    popd
    pushd AnycubicSlicerNext/usr/lib
    find . -type f -exec install -Dm644 "{}" "${pkgdir}/opt/AnycubicSlicerNext/lib" \;
    popd
    install -Dm644 libicu74/usr/lib/x86_64-linux-gnu/libicui18n.so.74 "${pkgdir}/opt/AnycubicSlicerNext/lib/libicui18n.so.74"
    install -Dm644 libicu74/usr/lib/x86_64-linux-gnu/libicuuc.so.74 "${pkgdir}/opt/AnycubicSlicerNext/lib/libicuuc.so.74"
    install -Dm644 libselinux1/usr/lib/x86_64-linux-gnu/libselinux.so.1 "${pkgdir}/opt/AnycubicSlicerNext/lib/libselinux.so.1"
    install -Dm644 AnycubicSlicerNext/usr/share/applications/AnycubicSlicer.desktop "${pkgdir}/usr/share/applications/AnycubicSlicer.desktop"
    install -Dm644 acnext-workbench-fix.so "${pkgdir}/opt/AnycubicSlicerNext/lib/acnext-workbench-fix.so"
    install -Dm755 AnycubicSlicerNext.sh "${pkgdir}/usr/bin/AnycubicSlicerNext"
}
