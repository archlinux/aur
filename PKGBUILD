# Maintainer: Topik <topik@topik.tech>
pkgname=windscribe-git
pkgver=2.3.15_beta
pkgrel=1
pkgdesc="Windscribe's GUI desktop client"
arch=('x86_64')
url="https://github.com/Windscribe/desktop-v2"
license=('GPL2')
depends=('bash' 'iptables' 'procps-ng' 'qt5-base' 'hicolor-icon-theme' 'libnsl' 'curl' 'c-ares' 'qt5-svg' 'protobuf' 'desktop-file-utils' 'icu67')
makedepends=('git' 'python3' 'python-pip' 'python2' 'go' 'cmake' 'patchelf' 'dpkg' 'ruby' 'rpm-tools')
provides=('windscribe')
# Conflicts commented out for now as there is not a binary AUR package yet
# conflicts=('windscribe-bin')
install=${pkgname}.install
source=('desktop-v2::git+https://github.com/Windscribe/desktop-v2#branch=master' 'patch_installqt' 'patch_buildall' 'patch_stunnel')
sha512sums=('SKIP' '0dcac3f6297e7ecd2bf116099ab170869befc1fda164d78276eaf4fe3ea91fb589fcbb353b3a2c7e4643d7e659146555c4becace1f4ed89ef7ce0bf182aa6a60' '4020705917b3bbac6ddf8fcddbce8896f263d2823825e5d5fa06b35c9eb0ab6085c378bad237870c01b6f015d5d20c183e19c60fc3038a98c1f1997fdc3bc9fb' '3cff8fbd8f42af15400201143c1077797c3c02b6a2dc9edeee6c46801187c3bc2adfdf010d858cd45df2f55772da175d630a95f04cf965f789737c89999985d9')

prepare(){
    GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    PATH="$PATH:$GEM_HOME/bin"
    gem i fpm -f
    
    # Commented out line 87: configure_cmd.append("-no-opengl")
    patch "${srcdir}"/desktop-v2/tools/deps/install_qt.py patch_installqt

    # Removed fakeroot when building deb package as to not cause a nested fakeroot
    patch "${srcdir}"/desktop-v2/tools/build_all.py patch_buildall
    
    # Patched stunnel version
    patch "${srcdir}"/desktop-v2/tools/vars/stunnel.yml patch_stunnel
    
    python -m pip install messages
    
    if [ ! -d "${srcdir}"/py2 ]; then
        mkdir "${srcdir}"/py2
        ln -s /usr/bin/python2 "${srcdir}"/py2/python
    fi
    
    export PATH="${srcdir}"/py2:$PATH
    
    cd "${srcdir}"/desktop-v2/tools
    python bin/get-pip.py
    python -m pip install -r requirements.txt
    python -m pip install message
}

build() {
    # Need to figure out how to detect if certain modules were already made so that a re-compilation isn't needed
    cd "${srcdir}"/desktop-v2/tools/deps
    ./'install_openssl'
    ./'install_qt'
    ./'install_cares'
    ./'install_boost'
    ./'install_curl'
    ./'install_lzo'
    ./'install_openvpn'
    ./'install_wireguard'
    ./'install_stunnel'
    ./'install_protobuf'
    ./'install_gtest'
    cd "${srcdir}"/desktop-v2/tools
    chmod -R 755 "${srcdir}"/desktop-v2/installer/linux/*
    ./'build_all' --no-sign
}

package(){
    mv "${srcdir}"/desktop-v2/build-exe/windscribe_"${pkgver}"_amd64.deb "${srcdir}"
    cd "${srcdir}"
    ar -xv windscribe_"${pkgver}"_amd64.deb
    tar xf data.tar.xz -C "${pkgdir}"
    chmod -x "${pkgdir}"/etc/systemd/system/windscribe-helper.service
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -Dm644 "${srcdir}"/desktop-v2/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}