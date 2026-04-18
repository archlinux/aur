# Maintainer: Demitrius Belai <demitriusbelai at gmail dot com>

# They changed the versioning scheme. The new version is not greater than
# the previous one, and the package also includes a 'develop' suffix.
# Update at your own risk.

# # apt-cache policy anycubicslicernext
# anycubicslicernext:
#   Installed: 1.3.7156
#   Candidate: 1.3.7156
#   Version table:
#  *** 1.3.7156 100
#         100 /var/lib/dpkg/status
#      1.3.96 500
#         500 https://cdn-universe-slicer.anycubic.com/prod noble/main amd64 Packages

pkgname=anycubicslicernext-bin
# I know I can use 'epoch'. But I’m sure they will release some patch version
# with four digits at some point. So I padded the version with zeros.
pkgver=1.3.9600
pkgrel=3
pkgdesc="Anycubic Slicer is an open source slicer for FDM printers"
arch=('x86_64')
url="https://github.com/ANYCUBIC-3D/AnycubicSlicer"
_url_source="https://cdn-universe-slicer.anycubic.com/prod"
license=("AGPL-3.0")
depends=('webkit2gtk-4.1' 'libxml2-legacy' 'libbsd' 'gtk3' 'zlib' 'wayland' 'libglvnd'
    'gst-plugins-base' 'gst-plugins-good' 'gst-libav' 'dbus' 'libsoup3' 'noto-fonts' 'noto-fonts-cjk')
optdepends=('ttf-harmonyos-sans: font removed from original package'
            'ttf-nanum: font removed from original package')

source=("${_url_source}/dists/noble/main/binary-amd64/develop_AnycubicSlicerNext-1.3.96_20260319_224609-Ubuntu_24_04_3_LTS.deb"
    "https://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu74_74.2-1ubuntu3.1_amd64.deb"
    "https://archive.ubuntu.com/ubuntu/pool/main/libs/libselinux/libselinux1_3.5-2ubuntu2.1_amd64.deb"
    "AnycubicSlicerNext.sh")

noextract=("${source[@]##*/}")

sha256sums=('2c2883a9c624ab64e721a0211667852e0083d8794f7839c1d7932c9f712ed076'
    'c9a70989678660eed9a1e904c74fa043da8bec8e2036856fc16e31ced79b04f8'
    '6abaa6c26f46ef17764c4a753e0e84de1cdadde5634fd2987621fdc617988d19'
    '20a2e851c8914af6a4098f9718b7462f9f108430b498483f9c04eba81e695fc2')

prepare() {
    [ -d AnycubicSlicerNext ] && rm -r AnycubicSlicerNext
    mkdir AnycubicSlicerNext
    pushd AnycubicSlicerNext
    ar x ../develop_AnycubicSlicerNext-*
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
    sed -i 's@/usr/share/AnycubicSlicerNext/resources@/opt/AnycubicSlicerNext/share/resources@' \
        AnycubicSlicerNext/usr/bin/AnycubicSlicerNext
    sed -i 's@Icon=/usr/share/AnycubicSlicerNext/resources/images/AnycubicSlicer.png@Icon=/opt/AnycubicSlicerNext/share/resources/images/AnycubicSlicer.png@' \
        AnycubicSlicerNext/usr/share/applications/AnycubicSlicer.desktop
    rm -r AnycubicSlicerNext/usr/share/AnycubicSlicerNext/resources/fonts
}

package() {
    mkdir -p "${pkgdir}/opt/AnycubicSlicerNext/share/resources"
    mkdir -p "${pkgdir}/opt/AnycubicSlicerNext/bin"
    mkdir -p "${pkgdir}/opt/AnycubicSlicerNext/lib"
    install -Dm755 AnycubicSlicerNext/usr/bin/AnycubicSlicerNext "${pkgdir}/opt/AnycubicSlicerNext/bin/AnycubicSlicerNext"
    pushd AnycubicSlicerNext/usr/share/AnycubicSlicerNext/resources/
    find . -type f -exec install -Dm644 "{}" "${pkgdir}/opt/AnycubicSlicerNext/share/resources/{}" \;
    popd
    pushd AnycubicSlicerNext/usr/lib
    find . -type f -exec install -Dm644 "{}" "${pkgdir}/opt/AnycubicSlicerNext/lib" \;
    popd
    install -Dm644 libicu74/usr/lib/x86_64-linux-gnu/libicui18n.so.74 "${pkgdir}/opt/AnycubicSlicerNext/lib/libicui18n.so.74"
    install -Dm644 libicu74/usr/lib/x86_64-linux-gnu/libicuuc.so.74 "${pkgdir}/opt/AnycubicSlicerNext/lib/libicuuc.so.74"
    install -Dm644 libselinux1/usr/lib/x86_64-linux-gnu/libselinux.so.1 "${pkgdir}/opt/AnycubicSlicerNext/lib/libselinux.so.1"
    install -Dm644 AnycubicSlicerNext/usr/share/applications/AnycubicSlicer.desktop "${pkgdir}/usr/share/applications/AnycubicSlicer.desktop"
    install -Dm755 AnycubicSlicerNext.sh "${pkgdir}/usr/bin/AnycubicSlicerNext"
}
