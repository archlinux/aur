# Maintainer: Ernst Persson <ernstp@gmail.com>
major=25.10
minor=2203192
ubuntu_ver=24.04
repo_folder_ver=6.4.4

pkgname=amf-amdgpu-pro-25.10
pkgver=${major}.${minor}
pkgrel=1
arch=('x86_64')
url=https://github.com/GPUOpen-LibrariesAndSDKs/AMF/wiki/Driver%20Linux
# Later versions dropped support for RDNA 1 & 2, see https://github.com/GPUOpen-LibrariesAndSDKs/AMF/issues/575
pkgdesc="AMDGPU Pro Advanced Multimedia Framework for RDNA1 & RDNA2"
license=('custom: AMDGPU-PRO EULA')
depends=("vulkan-icd-loader" "vulkan-radeon")
groups=('Radeon_Software_for_Linux')
provides=('amf-amdgpu-pro')

source=(
    https://repo.radeon.com/amdgpu/${repo_folder_ver}/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.37-${minor}.${ubuntu_ver}_amd64.deb
    https://repo.radeon.com/amdgpu/${repo_folder_ver}/ubuntu/pool/proprietary/liba/libamdenc-amdgpu-pro/libamdenc-amdgpu-pro_${major}-${minor}.${ubuntu_ver}_amd64.deb
)
sha256sums=(
    a6496929a58badc0a5451698f632611592dbc855cf518f47e54a66011ae014f5
	8c4bc76714f337c4f3649ba8b9868e1b0f7169120d03fcc483ee7ab3fd77aeec
)

# extracts a debian package
# $1: deb file to extract
extract_deb() {
    local tmpdir="$(basename "${1%.deb}")"
    rm -Rf "$tmpdir"
    mkdir "$tmpdir"
    cd "$tmpdir"
    ar x "$1"
    tar -C "${pkgdir}" -xf data.tar.xz
}
# move ubuntu specific /usr/lib/x86_64-linux-gnu to /usr/lib
# $1: debian package library dir (goes from opt/amf and from x86_64 or i386)
# $2: arch package library dir (goes to usr/lib or usr/lib32)
move_libdir() {
    local deb_libdir="$1"
    local arch_libdir="$2"

    if [ -d "${pkgdir}/${deb_libdir}" ]; then
        if [ ! -d "${pkgdir}/${arch_libdir}" ]; then
            mkdir -p "${pkgdir}/${arch_libdir}"
        fi
        mv -t "${pkgdir}/${arch_libdir}/" "${pkgdir}/${deb_libdir}"/*
        find ${pkgdir} -type d -empty -delete
    fi
}
# move copyright file to proper place and remove debian changelog
move_copyright() {
    find ${pkgdir}/usr/share/doc -name "changelog.Debian.gz" -delete
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    find ${pkgdir}/usr/share/doc -name "copyright" -exec mv {} ${pkgdir}/usr/share/licenses/${pkgname} \;
    find ${pkgdir}/usr/share/doc -type d -empty -delete
}

package () {
    extract_deb "${srcdir}"/amf-amdgpu-pro_1.4.37-${minor}.${ubuntu_ver}_amd64.deb
    extract_deb "${srcdir}"/libamdenc-amdgpu-pro_${major}-${minor}.${ubuntu_ver}_amd64.deb
    move_libdir "opt/amdgpu-pro/lib/x86_64-linux-gnu" "usr/lib"
    move_copyright
}
