pkgver=6.2.0
pkgname=(linux-x13s{,-headers}-bin)
pkgrel=1005.6
_pkgrel=(${pkgrel//./ })
_pkgver2="${pkgver}-${_pkgrel[0]}"
arch=(aarch64)
_arch='arm64'
_codename='laptop'
url='https://launchpad.net/~ubuntu-concept/+archive/ubuntu/x13s'
license=('GPL2')
_binary_deb_suffix1="${_pkgver2}_${pkgver}-${pkgrel}_${_arch}.deb"
_binary_deb_suffix2="${_pkgver2}-${_codename}_${pkgver}-${pkgrel}_${_arch}.deb"
_src_deb_suffix="${pkgver}-${pkgrel}_all.deb"
_base_link="${url}/+files/linux"
_code_link="${_base_link}-${_codename}"
source=(
    "${_base_link}-image-unsigned-${_binary_deb_suffix2}"
    "${_base_link}-modules-${_binary_deb_suffix2}"
    "${_base_link}-headers-${_binary_deb_suffix2}"
    "${_code_link}-headers-${_pkgver2}_${_src_deb_suffix}"
    "${_base_link}-buildinfo-${_binary_deb_suffix2}"
    "${_code_link}-tools-${_binary_deb_suffix1}"
    "${_code_link}-tools-common_${_src_deb_suffix}"
    "${_base_link}-tools-${_binary_deb_suffix2}"
)
sha256sums=(
    'c6c516b2f88423d98d85bfb7fa479a8cc1a5c73e24b3b2762344094688c651af'
    'd1b9ab718038b53cd287be123b559ef9f7ff1ff9eb0e74dcbdf078ab772a19a4'
    'aac576760d7a62d47caff285c409557fbf28fea0ad736ffa428970aacb9d1ef3'
    'de85d076a0eb6a6bb63e7a50619073c15af6aeae464a089b57dd72c5581dca9b'
    '8dc72a78d16108de0d5bf6c02847544a718ce1e4a1962343bb170d804ba28dd9'
    '5fd2d0c8f971cb1c1b653881db632c192fcdff0260524f22a70a0b55eba36fdb'
    'f38ea6e76406ab34d2b4af8da089d867601eb34fafce62142b9e01779c0f08e4'
    'b2d735def9699e9a9f5389d2a4f32b4d5dd9a78d60308e81ebbfc04a22a3f8bf'
)
noextract=(${source[@]##*/})
_pwd="${PWD}"
_install="linux-x13s-bin.install"

cat <<EOF | sed s/%KVER%/${_pkgver2}-${_codename}/ > "${_pwd}/${_install}"
rm -f /boot/initramfs-linux.img
post_install(){
    depmod %KVER%
    dracut -H boot/initramfs-linux.img %KVER%
}
post_upgrade(){
    post_install
}
EOF

package_linux-x13s-bin() {
    pkgdesc='Prebuilt Linux kernel and modules for Lenovo ThinkPad X13s from Ubuntu Concept (unsigned)'
    depends=(dracut)
    optdepends=('linux-firmware-x13s: firmware images needed for Lenovo ThinkPad X13s')
    provides=(
        linux
        linux-x13s
    )
    install="${_install}"
    chmod 755 "${_pwd}/${install}"
    bsdtar xfO ${source[0]##*/} data.tar* | bsdtar xf - boot/vmlinuz* usr/lib usr/share/doc/linux-image*/changelog.*
    bsdtar xfO ${source[1]##*/} data.tar* | bsdtar xf - lib usr/lib
    mv boot/{vmlinuz*,Image}
    mv boot "$pkgdir"
    msg2 'Compressing kernel modules...'
    find lib/modules/*/kernel -type f -exec xz {} \;
    mkdir -p usr/lib
    mv lib/* usr/lib/
    rm -r lib
    mv usr/share/doc/linux-{image-*,x13s-bin}
    mv usr "$pkgdir"
}

package_linux-x13s-headers-bin() {
    pkgdesc='Headers and scripts for building modules for custom prebuilt Linux kernel and modules for Lenovo ThinkPad X13s from Ubuntu Concept'
    provides=(
        linux-headers
        "linux-headers-x13s=$pkgver"
    )
    for _i in 2 3 4 5 6 7; do
        bsdtar xfO ${source[_i]##*/} data.tar* | bsdtar xf -
    done
    mkdir -p usr/lib
    mv lib/* usr/lib/
    rm -rf lib src/usr/share/doc/linux-{buildinfo,${_codename}-headers,${_codename}-tools,tools}*
    mv usr/share/doc/linux-{headers-*,x13s-headers-bin}
    mv usr "$pkgdir"
}
