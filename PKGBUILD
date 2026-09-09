# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: OK100 <ok100 at lavabit dot com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>
# Contributor: Nguyen Ky <nhktmdzhg at google mail>

pkgname=picom-nhktmdzhg-git
_gitname=picom
pkgver=2858__2026.09.09
pkgrel=1
pkgdesc="X compositor (fork of compton) (git-version)"
arch=(i686 x86_64)
url="https://github.com/nhktmdzhg/${_gitname}"
license=('MIT' 'MPL-2.0' 'GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libconfig' 'libdbus' 'libepoxy' 'libev' 'libx11'
'libxcb' 'pcre2' 'pixman' 'xcb-util' 'xcb-util-image' 'xcb-util-renderutil')
makedepends=('asciidoctor' 'cmake' 'git' 'libglvnd' 'mesa' 'meson' 'uthash' 'xorgproto')
optdepends=('dbus:          To control picom via D-Bus'
    'python:        For picom-convgen.py'
    'xorg-xwininfo: For picom-trans'
'xorg-xprop:    For picom-trans')
provides=('compton' 'compton-git' 'picom')
conflicts=('compton' 'compton-git' 'picom')
replaces=('compton-git')
source=(git+"https://github.com/nhktmdzhg/${_gitname}.git#branch=next")
md5sums=("SKIP")

pkgver() {
    cd ${_gitname}
    _tag=$(git describe --tags | sed 's:^v::') # tag is mobile, and switches between numbers and letters, can't use it for versioning
    _commits=$(git rev-list --count HEAD) # total commits is the most sane way of getting incremental pkgver
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s_%s\n" "${_commits}" "${_tag}" "${_date}" | sed 's/-/./g'
}

build() {
    cd "${srcdir}/${_gitname}"
    meson setup --buildtype=release . build --prefix=/usr -Dwith_docs=true
    ninja -C build
}

package() {
    cd "${srcdir}/${_gitname}"
    
    DESTDIR="${pkgdir}" ninja -C build install
    
    # install license
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -r "LICENSES/." "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    # example conf
    install -D -m644 "picom.sample.conf" "${pkgdir}/etc/xdg/picom.conf.example"
}
