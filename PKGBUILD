# Maintainer: Eugene Gershnik <gershnik@hotmail.com>
pkgname='wsdd-native'
pkgver='1.21'
pkgrel=1
pkgdesc='WS-Discovery Host Daemon. Makes your machine visible in Network view of Windows Explorer'
arch=('x86_64' 'aarch64')
url='https://github.com/gershnik/wsdd-native'
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('cmake>=3.25' 'make' 'gcc>=11.3' 'git' 'patch' 'tar' 'libsystemd')
conflicts=('wsdd')
backup=('etc/wsddn.conf')
source=(
    "wsddn-v$pkgver.tgz::https://github.com/gershnik/wsdd-native/tarball/48a4ce831d7d953d00be9488bbd25e56a9617faa"
    "argum-v2.6.tgz::https://github.com/gershnik/argum/tarball/v2.6"
    "asio-1.30.2.tgz::https://downloads.sourceforge.net/asio/asio-1.30.2.tar.gz"
    "fmt-11.2.0.tgz::https://github.com/fmtlib/fmt/tarball/11.2.0"
    "isptr-v1.9.tgz::https://github.com/gershnik/intrusive_shared_ptr/tarball/v1.9"
    "libxml2-v2.14.5.tgz::https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.14.5/libxml2-v2.14.5.tar.gz"
    "modern-uuid-v1.8.tgz::https://github.com/gershnik/modern-uuid/tarball/v1.8"
    "outcome-v2.2.12.tgz::https://github.com/ned14/outcome/tarball/v2.2.12"
    "ptl-v1.7.tgz::https://github.com/gershnik/ptl/tarball/v1.7"
    "spdlog-v1.15.3.tgz::https://github.com/gabime/spdlog/tarball/v1.15.3"
    "sys_string-v2.20.tgz::https://github.com/gershnik/sys_string/tarball/v2.20"
    "tomlplusplus-v3.4.0.tgz::https://github.com/marzer/tomlplusplus/tarball/v3.4.0"
)
noextract=("${source[@]%%::*}")

prepare() {
    local u
    for u in ${source[@]}; do
        local tgz="$SRCDEST/${u%%::*}"
        local comp=$(basename ${tgz%-*})
        [ -d "$comp" ] && rm -rf "$comp"
        mkdir "$comp"
        tar -C "$comp" --strip-components=1 --warning=no-unknown-keyword -xzf $tgz
        if [ $comp != "wsddn" ]; then
            _fetched_deps="$_fetched_deps $comp"
        fi
    done
}

build() {
    local fetch_sources='-DFETCHCONTENT_FULLY_DISCONNECTED=ON'
    local comp
    for comp in $_fetched_deps
    do
        fetch_sources="$fetch_sources -DFETCHCONTENT_SOURCE_DIR_${comp^^}=$srcdir/$comp"
    done

    cd wsddn
    cmake -S . -B out -DCMAKE_BUILD_TYPE=None $fetch_sources
    cmake --build out
    cp installers/wsddn.conf out/
    sed -i "s/{RELOAD_INSTRUCTIONS}/# sudo systemctl restart wsddn\n/g" out/wsddn.conf
    sed -i "s/{SAMPLE_IFACE_NAME}/eth0/g" out/wsddn.conf
}

package() {
    cd wsddn
    cmake --install out --prefix $pkgdir/usr 
    install -Dm 0644 config/systemd/usr/lib/systemd/system/wsddn.service \
                            $pkgdir/usr/lib/systemd/system/wsddn.service
    install -Dm 0644 config/firewalls/etc/ufw/applications.d/wsddn \
                            $pkgdir/etc/ufw/applications.d/wsddn
    install -Dm 0644 out/wsddn.conf $pkgdir/etc/wsddn.conf
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

sha256sums=('0731cbc199dff6695034f4c24af0b362bdffe70109b5ac485246a24aaf6fdbd9'
            '72b2b6805da7bf022e8111f3c2f3ed08ae6c23daa0ad336de56f2bd133d653c4'
            '12e7bb4dada8bc1191de9d550a59ee658ce4e645ffc97c911c099ab4e8699d55'
            '15b7d9723d16e6ecbf83438a1611a2910879eaa5bc8d0e0fd8197c2f18f993be'
            'f9095609a2226f3aa6dbfcd4726a8521a56f4fd2f426b0898d92acd1f133aa6d'
            '54968c8ab8723c2d75a38fc45810e8cf60d44991e0887661bf9905a4042ad108'
            'bb3fb3e53b45cd7e6b977835cfc7ef25680e92b68daf709b1f494f46697dae02'
            '838ed35d1bdedcfe9cee2186b51d023404274418f2868798fefac5a54e8bb403'
            'e3efb37f71846ba7d10165bef7f62a581dd3e7c8f4ac185bb86d4069bc4ec9ed'
            '2f33b90dee78e9a910abbba1a294398277d4608831c6b8161ac74a7ca5493b49'
            'd2a0aa64e3e20e8f01ece30fa618393401d78bc9065b034aecf96814c0389c6f'
            '8874014da21de8d1414d9914c8f3c6b5f315c23a75951b33df46048c13dda12f')
