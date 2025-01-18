major=23.20
minor=1664988
ubuntu_ver=20.04

pkgbase=opencl_legacy_amdgpu-pro
pkgname=(
    opencl-legacy-amdgpu-pro
    lib32-opencl-legacy-amdgpu-pro
)

pkgver=${major}_${minor}
pkgrel=1
arch=('x86_64')
url=https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-50
license=('custom: multiple')
groups=('opencl_legacy_amdgpu-pro')
makedepends=('wget')
options=('!debug')

DLAGENTS='https::/usr/bin/wget --referer https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-50 -N %u'

source=(GET-*
        versions)

sha256sums=("SKIP"
            "SKIP"
            "SKIP")

get_debs_64() {
    bash ./GET-64DEBS.sh
}

get_debs_32() {
    bash ./GET-32DEBS.sh
}

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
# $1: debian package library dir (goes from opt/amdgpu or opt/amdgpu-pro and from x86_64 or i386)
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

patch64() {
    touch ${pkgdir}/etc/OpenCL/vendors/amdocl-orca.icd
    echo libamdocl-orca.so >> ${pkgdir}/etc/OpenCL/vendors/amdocl-orca.icd
    touch ${pkgdir}/etc/OpenCL/vendors/amdocl-orca-ld-64.icd
    echo /usr/lib/libamdocl-orca64.so >> ${pkgdir}/etc/OpenCL/vendors/amdocl-orca-ld-64.icd
    ln -s /usr/lib/libamdocl-orca64.so ${pkgdir}/usr/lib/libamdocl-orca.so
}

patch32() {
    touch ${pkgdir}/etc/OpenCL/vendors/amdocl-orca-ld-32.icd
    echo /usr/lib32/libamdocl-orca32.so >> ${pkgdir}/etc/OpenCL/vendors/amdocl-orca-ld-32.icd
    ln -s /usr/lib32/libamdocl-orca32.so ${pkgdir}/usr/lib32/libamdocl-orca.so
}


package_opencl-legacy-amdgpu-pro () {
    pkgdesc="Legacy non-free AMD OpenCL ICD Loaders (PAL)"
    license=('custom: AMDGPU-PRO EULA')
    conflicts=('opencl-amd')
	provides=("opencl-orca-amdgpu-pro-icd" "opencl-driver")
	optdepends=('clinfo' 'rocm-opencl-runtime')
    
	get_debs_64
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}/amd64.deb
    move_libdir "opt/amdgpu-pro/lib/x86_64-linux-gnu" "usr/lib"
    move_copyright
    patch64
}

package_lib32-opencl-legacy-amdgpu-pro () {
    pkgdesc="Legacy non-free AMD OpenCL ICD Loaders (PAL) (32-bit)"
    license=('custom: AMDGPU-PRO EULA')
    depends=("opencl-legacy-amdgpu-pro")
    conflicts=('opencl-amd')
	provides=("lib32-opencl-orca-amdgpu-pro-icd" "lib32-opencl-driver")

    get_debs_32
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}/i386.deb
    move_libdir "opt/amdgpu-pro/lib/i386-linux-gnu" "usr/lib32"
    move_copyright
    patch32
}
