# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# Contributor: Fazzi <faaris.ansari@proton.me>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: OK100 <ok100 at lavabit dot com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=picom-ftlabs-git
_gitname=picom
pkgver=r2236_2024.02.17
pkgrel=2
pkgdesc="picom fork by FT-Labs including animations (git-version)"
arch=('x86_64' 'i686')
url="https://github.com/FT-Labs/${_gitname}"
license=('MIT' 'MPL-2.0')
depends=('libgl' 'libev' 'pcre2' 'libx11' 'xcb-util-renderutil' 'libxcb' 'libepoxy' 'xcb-util-image' 'libxext'
         'pixman' 'libconfig' 'libdbus' 'hicolor-icon-theme')
makedepends=('git' 'mesa' 'meson' 'asciidoc' 'uthash' 'xorgproto')
optdepends=('dbus:          To control picom via D-Bus'
            'xorg-xwininfo: For picom-trans'
            'xorg-xprop:    For picom-trans'
            'python:        For picom-convgen.py')
provides=('compton' 'compton-git' 'picom')
conflicts=('compton' 'compton-git' 'picom')
replaces=('compton-git')
source=(
  git+"https://github.com/FT-Labs/${_gitname}.git#branch=next"
  "fix_ewmh_fullscreen.patch"
)
md5sums=(
  "SKIP"
  "30ff0e25e4bc91563f2f68b27762c9e2"
)

pkgver() {
    cd ${_gitname}
    _commits=$(git rev-list --count HEAD) # total commits is the most sane way of getting incremental pkgver
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "r%s_%s\n" "${_commits}" "${_date}" | sed 's/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -d src -p1 < "${srcdir}/fix_ewmh_fullscreen.patch"
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
