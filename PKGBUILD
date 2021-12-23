# Maintainer: Topik <topik@topik.tech>
pkgname=windscribe-git
pkgver=2.3.11_beta
pkgrel=1
pkgdesc="Windscribe's GUI desktop client"
arch=('x86_64')
url="https://github.com/Windscribe/desktop-v2"
license=('GPL2')
depends=('bash' 'iptables' 'procps-ng' 'qt5-base' 'hicolor-icon-theme' 'libnsl' 'curl' 'c-ares' 'qt5-svg' 'protobuf' 'desktop-file-utils' 'icu67')
makedepends=('git' 'python3' 'python-pip' 'python2' 'go' 'cmake' 'patchelf' 'dpkg' 'ruby' 'rpm-tools')
provides=('windscribe')
# Conflicts commented out for now as there is not an official binary release yet
# conflicts=('windscribe-bin')
install=${pkgname}.install
source=('desktop-v2::git+https://github.com/Windscribe/desktop-v2#branch=master' 'patch_installqt' 'patch_sourcechanges' 'patch_buildall' 'patch_stunnel')
sha512sums=('SKIP' 'f15f459d1bce294bbd706b07d040ec21eebfdc1cf71f3e384be9fe9ebf089b154d9e6528077e168db161e7ade945eaa1f9d6515aefc5490b1703bd8e1b13fdf8' '231765d8ebd14cccfc2a6f80c48672c3c8baa35101ee21c20c8d877955e23d3090856100fffd1964010344f3479e2fac8843301f315dc8d9a660fb97012a1481' '3d0f6e821967a3c639a86f511a06c321448730b1f485b0b9bf4597ca0a2538d8fa3fb383c9cd55862edbab959598994616e2ff1bb74c853214666870fda90e65' '78c2d6070b943432930f256508bfe96d461a8201527f2a5249638d1f6d5f9eabefa0d9fcc938974f27fc1fc13f3b10627e506458a92b18c91d9238fc997f021f')

prepare(){
    GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    PATH="$PATH:$GEM_HOME/bin"
    gem i fpm -f
    
    # Commented out line 87: configure_cmd.append("-no-opengl")
    patch "${srcdir}"/desktop-v2/tools/deps/install_qt.py patch_installqt
    # Added additional entries to fix qt compilation
    patch "${srcdir}"/desktop-v2/tools/deps/custom_qt/source_changes.json patch_sourcechanges
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
    chmod -R +755 "${srcdir}"/desktop-v2/installer/linux/*
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