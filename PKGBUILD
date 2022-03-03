#"cfe" Cosmic Fusion Edition a random name just to defer this fork form upstream

major=21.50
minor=1373477
ubuntu_ver=20.04
amf_ver=1.4.24
enc_ver=1.0

pkgbase=amdgpu-pro-installer-cfe
pkgname=(
libamdenc-amdgpu-pro-cfe
amf-amdgpu-pro-cfe
amdgpu-pro-libgl-cfe
lib32-amdgpu-pro-libgl-cfe
vulkan-amdgpu-pro-cfe
lib32-vulkan-amdgpu-pro-cfe
)

pkgver=${major}_${minor}
pkgrel=1
arch=('x86_64')
url=https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-50
license=('custom: multiple')
groups=('Radeon_Software_for_Linux_Cosmic_Fusion_Edition')
makedepends=('wget')

DLAGENTS='https::/usr/bin/wget --referer https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-50 -N %u'

source=(GET-DEBS.sh
        versions
        progl
        progl.bash-completion
        provlk
        provlk.bash-completion)

sha256sums=("SKIP"
            "SKIP"
            feb74796c3152cbafaba89d96e68a152f209bd3058c7eb0413cbe1ab0764e96f
            e32801c38b475cd8df17a407726b86db3de26410f563d688325b4d4314fc5354
            7bb670f1588c65404ed5dc231c02c4acff4b2150c3f0eba99e052debbb089c32
            5c3f42f4c01bd0b8d1a582f6a476cc1afa4dfe47209b4742fcde84fa52d075df)

get_debs() {
         bash ./GET-DEBS.sh
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

#source=amdgpu-pro-archive.tar.xz
#sha256sums="SKIP"

package_amf-amdgpu-pro-cfe () {
    pkgdesc="AMDGPU Pro Advanced Multimedia Framework"
    license=('custom: AMDGPU-PRO EULA')
    depends=("libglvnd" "libx11" "vulkan-amdgpu-pro" "rocm-opencl-runtime" "libamdenc-amdgpu-pro")
    conflicts=("amf-amdgpu-pro")

    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/amf-amdgpu-pro_${amf_ver}-${minor}_amd64.deb
    move_libdir "opt/amdgpu-pro/lib/x86_64-linux-gnu" "usr/lib"
    move_copyright
}

package_libamdenc-amdgpu-pro-cfe () {
    pkgdesc="AMD Encode Core Library"
    license=('custom: AMDGPU-PRO EULA')

    get_debs
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libamdenc-amdgpu-pro_${enc_ver}-${minor}_amd64.deb
    move_libdir "opt/amdgpu-pro/lib/x86_64-linux-gnu" "usr/lib"
    move_copyright
}

package_amdgpu-pro-libgl-cfe () {
    pkgdesc="AMDGPU Pro OpenGL driver"
    license=('custom: AMDGPU-PRO EULA')
    provides=('libgl')
    depends=("libdrm" "libx11" "libxcb" "libxdamage" "libxext" "libxfixes" "libxxf86vm")
    backup=(etc/amd/amdapfxx.blb)
    conflicts=("amdgpu-pro-libgl")

    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libegl1-amdgpu-pro_${major}-${minor}_amd64.deb
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libgl1-amdgpu-pro-dri_${major}-${minor}_amd64.deb
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libgl1-amdgpu-pro-ext_${major}-${minor}_amd64.deb
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libgl1-amdgpu-pro-glx_${major}-${minor}_amd64.deb
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libglapi1-amdgpu-pro_${major}-${minor}_amd64.deb
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libgles2-amdgpu-pro_${major}-${minor}_amd64.deb
    move_copyright

    # extra_commands:
    move_libdir "usr/lib/x86_64-linux-gnu" "usr/lib"
    move_libdir "opt/amdgpu-pro/lib/x86_64-linux-gnu" "usr/lib/amdgpu-pro"
    move_libdir "opt/amdgpu-pro/lib/xorg" "usr/lib/amdgpu-pro/xorg"
    move_libdir "opt/amdgpu/share/drirc.d" "usr/share/drirc.d"
    sed -i "s|/opt/amdgpu-pro/lib/x86_64-linux-gnu|#/usr/lib/amdgpu-pro  # commented to prevent problems of booting with amdgpu-pro, use progl script|" "${pkgdir}"/etc/ld.so.conf.d/10-amdgpu-pro-x86_64.conf
    install -Dm755 "${srcdir}"/progl "${pkgdir}"/usr/bin/progl
    install -Dm755 "${srcdir}"/progl.bash-completion "${pkgdir}"/usr/share/bash-completion/completions/progl
    # For some reason, applications started with normal OpenGL (i.e. without ag pro) crashes at launch if this conf file is presented, so hide it for now, until I find out the reason of that.
    mv "${pkgdir}"/usr/share/drirc.d/10-amdgpu-pro.conf "${pkgdir}"/usr/share/drirc.d/10-amdgpu-pro.conf.hide
}

package_lib32-amdgpu-pro-libgl-cfe () {
    pkgdesc="AMDGPU Pro OpenGL driver (32-bit)"
    license=('custom: AMDGPU-PRO EULA')
    provides=('lib32-libgl')
    depends=("amdgpu-pro-libgl=${major}_${minor}-${pkgrel}" "lib32-libdrm" "lib32-libx11" "lib32-libxcb" "lib32-libxdamage" "lib32-libxext" "lib32-libxfixes" "lib32-libxxf86vm")
    backup=(etc/amd/amdrc etc/ld.so.conf.d/10-amdgpu-pro-i386.conf)
    conflicts=("lib32-amdgpu-pro-libgl")

    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libegl1-amdgpu-pro_${major}-${minor}_i386.deb
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libgl1-amdgpu-pro-dri_${major}-${minor}_i386.deb
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libgl1-amdgpu-pro-ext_${major}-${minor}_i386.deb
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libgl1-amdgpu-pro-glx_${major}-${minor}_i386.deb
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libglapi1-amdgpu-pro_${major}-${minor}_i386.deb
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/libgles2-amdgpu-pro_${major}-${minor}_i386.deb
    move_copyright

    # extra_commands:
    rm "${pkgdir}"/etc/amd/amdrc "${pkgdir}"/opt/amdgpu-pro/lib/xorg/modules/extensions/libglx.so "${pkgdir}"/opt/amdgpu/share/drirc.d/10-amdgpu-pro.conf
    move_libdir "usr/lib/i386-linux-gnu" "usr/lib32"
    move_libdir "opt/amdgpu-pro/lib/i386-linux-gnu" "usr/lib32/amdgpu-pro"
    sed -i "s|/opt/amdgpu-pro/lib/i386-linux-gnu|#/usr/lib32/amdgpu-pro  # commented to prevent problems of booting with amdgpu-pro, use progl32 script|" "${pkgdir}"/etc/ld.so.conf.d/10-amdgpu-pro-i386.conf
}

package_vulkan-amdgpu-pro-cfe () {
    pkgdesc="AMDGPU Pro Vulkan driver"
    license=('custom: AMDGPU-PRO EULA')
    provides=('vulkan-driver')
    depends=()
    conflicts=("vulkan-amdgpu-pro")
    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/vulkan-amdgpu-pro_${major}-${minor}_amd64.deb
    move_libdir "opt/amdgpu-pro/lib/x86_64-linux-gnu" "usr/lib"
    move_copyright

    # extra_commands:
    mkdir -p "${pkgdir}"/usr/share/vulkan/icd.d/
    mv "${pkgdir}"/opt/amdgpu-pro/etc/vulkan/icd.d/amd_icd64.json "${pkgdir}"/usr/share/vulkan/icd.d/amd_pro_icd64.json
    mv "${pkgdir}"/usr/lib/amdvlk64.so "${pkgdir}"/usr/lib/amdvlkpro64.so
    sed -i "s#/opt/amdgpu-pro/lib/x86_64-linux-gnu/amdvlk64.so#/usr/lib/amdvlkpro64.so#" "${pkgdir}"/usr/share/vulkan/icd.d/amd_pro_icd64.json
    find ${pkgdir} -type d -empty -delete
    install -Dm755 "${srcdir}"/provlk "${pkgdir}"/usr/bin/provlk
    install -Dm755 "${srcdir}"/provlk.bash-completion "${pkgdir}"/usr/share/bash-completion/completions/provlk
}

package_lib32-vulkan-amdgpu-pro-cfe () {
    pkgdesc="AMDGPU Pro Vulkan driver (32-bit)"
    license=('custom: AMDGPU-PRO EULA')
    provides=('lib32-vulkan-driver')
    depends=()
    conflicts=("lib32-vulkan-amdgpu-pro")

    extract_deb "${srcdir}"/amdgpu-pro-${major}-${minor}-ubuntu-${ubuntu_ver}/vulkan-amdgpu-pro_${major}-${minor}_i386.deb
    move_libdir "opt/amdgpu-pro/lib/i386-linux-gnu" "usr/lib32"
    move_copyright

    # extra_commands:
    mkdir -p "${pkgdir}"/usr/share/vulkan/icd.d/
    mv "${pkgdir}"/opt/amdgpu-pro/etc/vulkan/icd.d/amd_icd32.json "${pkgdir}"/usr/share/vulkan/icd.d/amd_pro_icd32.json
    mv "${pkgdir}"/usr/lib32/amdvlk32.so "${pkgdir}"/usr/lib32/amdvlkpro32.so
    sed -i "s#/opt/amdgpu-pro/lib/i386-linux-gnu/amdvlk32.so#/usr/lib32/amdvlkpro32.so#" "${pkgdir}"/usr/share/vulkan/icd.d/amd_pro_icd32.json
    find ${pkgdir} -type d -empty -delete
}
