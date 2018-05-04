# Maintainer: Lin Ruoshui <lin.ruohshoei@gmail.com>
# Based on [extra]'s thunderbird

_name=thunderbird
_channel=nightly
_version=61.0a1
pkgver=61.0a1.20180503
pkgrel=2

_lang=zh-cn
pkgname=${_name}-${_channel}-${_lang}
_pkgname=${_name}-${_channel}-zh-CN

pkgdesc="Standalone Mail/News reader — Nightly build (${_lang})"
url="https://www.thunderbird.net"
provides=(thunderbird-${_channel}=$pkgver)
conflicts=(thunderbird-${_channel} thunderbird-${_channel}-it)
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig'
         'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg'
         'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss'
         'shared-mime-info' 'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
install=${pkgname}.install

_upstream="https://releases.mozilla.org"
_url="${_upstream}/pub/${_name}/${_channel}/latest-comm-central-l10n"
_urlUS="${_upstream}/pub/${_name}/${_channel}/latest-comm-central"
_src="${_name}-${_version}.zh-CN.linux"
_srcUS="${_name}-${_version}.en-US.linux"
_filename="20171126.23-"
source=("${pkgname}.desktop"
	'vendor.js')
source_i686=("${_url}/${_src}-i686.tar.bz2" "${_url}/${_src}-i686.tar.bz2.asc" "${_urlUS}/${_srcUS}-i686.txt")
source_x86_64=("${_url}/${_src}-x86_64.tar.bz2" "${_url}/${_src}-x86_64.tar.bz2.asc" "${_urlUS}/${_srcUS}-x86_64.txt")

sha512sums=('0a6344a290cd4a52f1e858db0be97056ec2ce47894b4d3c0e6c68aef644b1ff278ab3a641a4be895d4a9a30ecee85bd1cad5c2348c3f97a1ad9096a8f18d845f'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_i686=('SKIP'
                 'SKIP'
                 'SKIP')
sha512sums_x86_64=('SKIP'
                   'SKIP'
                   'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key



#language
#_languages=( zh-CN)
#for _lang in "${_languages[@]}"; do
#  _locale=${_lang}
#  pkgname=${_name}-${_channel}-${_locale,,}
#  _src="${_name}-${_version}.${_lang}.linux"
#  _filename="${_filename_prefix}${_src}-x86_64.tar.bz2"
#
#  pkgname+=($pkgname)
#  source+=("${_filename}"::"${_url}/${_src}-x86_64.tar.bz2"
#           "${_filename}.asc"::"${_url}/${_src}-x86_64.tar.bz2.asc")
#  eval "package_$pkgname() {
#    msg2 'Removing old thunderbird directory...'
#    rm -rf thunderbird
#    msg2 'Extract ${_filename}...'
#    bsdtar -xf ${_filename}
#    _package $_lang
#  }"
#done

# Don't extract anything because they'll override each other
# noextract=(${source[@]%%::*})

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
