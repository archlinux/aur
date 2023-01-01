# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=autojump-rs
pkgver=0.5.0
pkgrel=1
pkgdesc="A faster way to navigate your filesystem from the command line (in Rust)"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/xen0n/autojump-rs"
license=('GPL3')
conflicts=('autojump')
provides=('autojump')
depends=()
makedepends=('python>=3.8' 'cargo')
options=()
install=
_autojump_version='22.5.3'
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/xen0n/autojump-rs/archive/refs/tags/${pkgver}.tar.gz"
    "autojump-${_autojump_version}.tar.gz::https://github.com/wting/autojump/archive/release-v${_autojump_version}.tar.gz"
)
md5sums=('b5e691a80b2cc30e673a981b04004c82'
         '29f1a7df736814c747645703bf00ce48')

prepare() {
    cd "autojump-release-v${_autojump_version}"
    sed -i "s:/env python:/python3:g" bin/autojump
    sed -i "/print('\\\\n\\\\t' + source_msg)/ s@source_msg@source_msg.replace('$pkgdir', '')@" install.py
    # workaround - the Cargo.toml version is outdated
    cd "../${pkgname}-${pkgver}"
    sed -i 's/^version = "0.4.0"$/version = "'"${pkgver}"'"/' Cargo.toml
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --offline --all-features --release --target-dir target
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
    install -d "${pkgdir}"/usr/share/fish/vendor_conf.d/
    mv "${pkgdir}"/etc/profile.d/autojump.fish "${pkgdir}"/usr/share/fish/vendor_conf.d/

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
    install -Dm755 "${srcdir}/$pkgname-$pkgver/target/release/autojump" "${pkgdir}/usr/bin/autojump"
}

# vim:set ts=4 sw=4 et:
