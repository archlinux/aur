# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=autojump-rs
pkgver=0.4.0
pkgrel=1
pkgdesc="A faster way to navigate your filesystem from the command line (in Rust)"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/xen0n/autojump-rs"
license=('GPL3')
conflicts=('autojump')
provides=('autojump')
depends=()
makedepends=('python>=3.8')
options=()
install=
_autojump_version='22.5.3'
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/xen0n/autojump-rs/releases/download/${pkgver}/autojump-${pkgver}-${CARCH}-unknown-linux-musl.tar.gz"
    "autojump-${_autojump_version}.tar.gz::https://github.com/wting/autojump/archive/release-v${_autojump_version}.tar.gz"
)
md5sums=('b7ab473f1dc541c0d8503b32f969a2f4'
         '29f1a7df736814c747645703bf00ce48')

# alt arches
source_aarch64=(
    "$pkgname-$pkgver.tar.gz::https://github.com/xen0n/autojump-rs/releases/download/${pkgver}/autojump-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz"
    "autojump-${_autojump_version}.tar.gz::https://github.com/wting/autojump/archive/release-v${_autojump_version}.tar.gz"
)
md5sums_aarch64=('b7ab473f1dc541c0d8503b32f969a2f4'
                 '29f1a7df736814c747645703bf00ce48')
source_arm=(
    "$pkgname-$pkgver.tar.gz::https://github.com/xen0n/autojump-rs/releases/download/${pkgver}/autojump-${pkgver}-${CARCH}-unknown-linux-gnueabi.tar.gz"
    "autojump-${_autojump_version}.tar.gz::https://github.com/wting/autojump/archive/release-v${_autojump_version}.tar.gz"
)
md5sums_arm=('b7ab473f1dc541c0d8503b32f969a2f4'
             '29f1a7df736814c747645703bf00ce48')
source_armv7h=(
    "$pkgname-$pkgver.tar.gz::https://github.com/xen0n/autojump-rs/releases/download/${pkgver}/autojump-${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz"
    "autojump-${_autojump_version}.tar.gz::https://github.com/wting/autojump/archive/release-v${_autojump_version}.tar.gz"
)
md5sums_armv7h=('b7ab473f1dc541c0d8503b32f969a2f4'
                '29f1a7df736814c747645703bf00ce48')

prepare() {
    cd "autojump-release-v${_autojump_version}"
    sed -i "s:/env python:/python3:g" bin/autojump
}

package() {
    # we basically run the installer for autojump
    # and then remove all the python bits and replace the bin file
    cd "autojump-release-v${_autojump_version}"

    SHELL=/bin/bash ./install.py --destdir "${pkgdir}" \
        --prefix 'usr/' \
        --zshshare 'usr/share/zsh/site-functions'

    cd "${pkgdir}/usr/share/autojump"
    for i in autojump.*
        do ln -s "/usr/share/autojump/$i" "${pkgdir}/etc/profile.d/$i"
    done

    # autojump FS#49601
    install -d "${pkgdir}"/usr/share/fish/completions
    mv "${pkgdir}"/etc/profile.d/autojump.fish "${pkgdir}"/usr/share/fish/completions

    # https://github.com/joelthelion/autojump/pull/339
    sed -i "s:/usr/local/:/usr/:g" "${pkgdir}/etc/profile.d/autojump.sh"
    sed -i "s:/build/autojump/pkg/autojump/:/:g" "${pkgdir}/etc/profile.d/autojump.sh"

    # autojump FS#43762
    sed -i '27,31d' "${pkgdir}/etc/profile.d/autojump.sh"

    # remove the python bits
    rm -r "${pkgdir}/usr/bin"

    # remove the manpage, since it's not _quite_ accurate
    rm -r "${pkgdir}/usr/share/man/"

    # install the Rust binary
    install -Dm755 "${srcdir}/autojump" "${pkgdir}/usr/bin/autojump"
}

# vim:set ts=4 sw=4 et:
