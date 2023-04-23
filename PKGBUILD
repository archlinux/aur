# Maintainer: Christopher <archlinux-maintainer@christopherz.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: OK100 <ok100 at lavabit dot com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

pkgname="picom-simpleanims-next-git"
_gitname="picom"
pkgver="1949__2023.03.04"
pkgrel=1
pkgdesc="The \"next\" branch of picom-simpleanims-git"
arch=("i686" "x86_64")
url="https://github.com/fdev31/${_gitname}"
license=("MIT" "MPL2")
depends=("libgl" "libev" "pcre" "libx11" "xcb-util-renderutil" "libxcb" "xcb-util-image" "libxext"
         "pixman" "libconfig" "libdbus" "hicolor-icon-theme")
makedepends=("git" "mesa" "meson" "asciidoc" "uthash" "xorgproto")
optdepends=("dbus:          To control picom via D-Bus"
            "xorg-xwininfo: For picom-trans"
            "xorg-xprop:    For picom-trans"
            "python:        For picom-convgen.py")
provides=("compton" "compton-git" "picom")
conflicts=("compton" "compton-git" "picom")
replaces=("compton-git")
source=("git+https://github.com/fdev31/${_gitname}.git#branch=next")
md5sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    _tag=$(git describe --tags | sed 's:^v::') # tag is mobile, and switches between numbers and letters, can't use it for versioning
    _commits=$(git rev-list --count HEAD) # total commits is the most sane way of getting incremental pkgver
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf '%s_%s_%s\n' "${_commits}" "${_tag}" "${_date}" | sed 's/-/./g'
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
  install -Dm644 "LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  # example conf
  install -Dm644 "picom.sample.conf" "${pkgdir}/etc/xdg/picom.conf.example"
}
