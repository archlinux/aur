# Maintainer: Lin Rs <20455421+LinRs at users.noreply.github.com>
# Based on [extra]'s thunderbird


_lang=zh-cn
_pkgname=${_name}-${_channel}-zh-CN
_name=thunderbird
_channel=nightly
_version=67.0a1
pkgname=${_name}-${_channel}-${_lang}
pkgver=67.0a1.20190317
pkgrel=1
pkgdesc="Standalone Mail/News reader — Nightly build (${_lang})"
url="https://www.thunderbird.net"
provides=(thunderbird-${_channel}=$pkgver)
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig'
         'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg'
         'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss'
         'shared-mime-info' 'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
makedepends=('imagemagick')
install=${pkgname}.install

_upstream="https://releases.mozilla.org"
_url="${_upstream}/pub/${_name}/${_channel}/latest-comm-central-l10n"
_urlUS="${_upstream}/pub/${_name}/${_channel}/latest-comm-central"
_src="${_name}-${_version}.zh-CN.linux"
_srcUS="${_name}-${_version}.en-US.linux"
source=("${pkgname}.desktop"
	'vendor.js')
source_x86_64=("${_url}/${_src}-x86_64.tar.bz2" "${_url}/${_src}-x86_64.tar.bz2.asc" "${_urlUS}/${_srcUS}-x86_64.txt")

sha512sums=('0a6344a290cd4a52f1e858db0be97056ec2ce47894b4d3c0e6c68aef644b1ff278ab3a641a4be895d4a9a30ecee85bd1cad5c2348c3f97a1ad9096a8f18d845f'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_x86_64=('13a5f25e02cf6adcf82a09e410b25dbbb59dbfbe25767b64e47457d63987a9c67f803f1e2686ac6616eaa3705cfbd3c3a1df54f655f52592f20fed826f21c123'
                   'SKIP'
                   '5088173c1556ebf3af5f81ec9f7e4565cdac2ffe286ccd725f311c0c0c2824894e14b070ee8c8aec3e72445ac5932eba44e304ce7b0688529f0c7127df1f88df')

validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key
pkgver(){
    cd "$srcdir"
    echo "${_version}.$(head -n1 "${_srcUS}-${CARCH}.txt" |cut -c -8)"
}

package() {
    cd "$srcdir"
    #OPT_PATH="opt/${pkgname}-$pkgver"
    
    # Install the package files
    install -d "$pkgdir"/{usr/bin,opt}
    cp -a ${_name} "$pkgdir/opt/$pkgname-$pkgver"
    ln -s "/opt/$pkgname-$pkgver/thunderbird" "$pkgdir/usr/bin/$pkgname"
        
    # Disable auto-updates
    cp vendor.js "$pkgdir/opt/$pkgname-$pkgver/defaults/pref/"
    
    # Install icons
    for i in 16 32 48 64 128; do
        install -Dm644 thunderbird/chrome/icons/default/default${i}.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png"
    done
    
    # Install .desktop files    
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Use system-provided dictionaries
    rm -rf "$pkgdir/opt/$pkg_name-$pkgver/dictionaries/"
    ln -sf /usr/share/hunspell/ "$pkgdir/opt/$pkgname-$pkgver/dictionaries"
}
