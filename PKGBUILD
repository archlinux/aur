# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Lin Rs <LinRs at users.noreply.github.com>
# Based on [extra]'s thunderbird


_lang=zh-cn
_pkgname=${_name}-${_channel}-zh-CN
_name=thunderbird
_channel=nightly
_version=78.0a1
pkgname=${_name}-${_channel}-${_lang}
pkgver=78.0a1
pkgrel=1
pkgdesc="Standalone Mail/News reader — Nightly build (${_lang})"
url="https://www.thunderbird.net"
provides=(thunderbird-${_channel}=$pkgver)
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig'
         'freetype2' 'gtk3' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg'
         'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss'
         'shared-mime-info' 'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=${_version}")
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
sha512sums_x86_64=('1aa16ca5f28b92d31b1318566c1b073c04d62c7aa4dfe99d82b288e74dea1767f132487f404fe9d43ec04057943d1713d6fd6db88f9741ff1e1a73155752cae0'
                   'SKIP'
                   '5935a808b914f91d3bf4a86530915cdea57cf5c96b2d91cba7f088f98d7012ca93154f6fc8e0c5bddff27d6530bc2391a6542d2a786402514ad25295a9caab79')

validpgpkeys=('097B313077AE62A02F84DA4DF1A6668FBB7D572E'
	      '14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key
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
