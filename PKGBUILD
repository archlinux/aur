# Maintainer: jzbor <jzbor at posteo dot net>

# This PKGBUILD is forked from picom-git
# Contributors of picom-git:
# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: OK100 <ok100 at lavabit dot com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

_forkname=dccsillag
pkgname=picom-animations-git
_gitname=picom
pkgver=1666_Next.104.g6a50198_2021.09.19
pkgrel=1
pkgdesc="X compositor (fork of compton) (git-version; animation fork)"
arch=(i686 x86_64)
url="https://github.com/${_forkname}/${_gitname}"
license=('MIT' 'MPL2')
depends=('libgl' 'libev' 'pcre' 'libx11' 'xcb-util-renderutil' 'libxcb' 'xcb-util-image' 'libxext'
         'pixman' 'libconfig' 'libdbus' 'hicolor-icon-theme')
makedepends=('git' 'mesa' 'meson' 'asciidoc' 'uthash' 'xorgproto')
optdepends=('dbus:          To control picom via D-Bus'
            'xorg-xwininfo: For picom-trans'
            'xorg-xprop:    For picom-trans'
            'python:        For picom-convgen.py')
provides=('compton' 'compton-git' 'picom')
conflicts=('compton' 'compton-git' 'picom')
replaces=('compton-git')
source=(git+"https://github.com/${_forkname}/${_gitname}.git#branch=implement-window-animations")
sha256sums=("SKIP")

pkgver() {
    cd ${_gitname}
    _tag=$(git describe --tags | sed 's:^v::') # tag is mobile, and switches between numbers and letters, can't use it for versioning
    _commits=$(git rev-list --count HEAD) # total commits is the most sane way of getting incremental pkgver
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s_%s\n" "${_commits}" "${_tag}" "${_date}" | sed 's/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  meson --buildtype=release . build --prefix=/usr -Dwith_docs=true
  ninja -C build
}

package() {
  cd "${srcdir}/${_gitname}"

  DESTDIR="${pkgdir}" ninja -C build install

  # install license
  install -D -m644 "LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  # example conf
  install -D -m644 "picom.sample.conf" "${pkgdir}/etc/xdg/picom.conf.example"
}
