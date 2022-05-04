# Maintainer: David Anderegg <dd.anderegg@hotmail.com>
# All of this is based on: https://aur.archlinux.org/packages/picom-git
# As soon as this PR (https://github.com/yshui/picom/pull/738) is merged, I
# will delete this package again

pkgname=picom-git-transparent-clipping-ignore
_gitname=picom
pkgver=1648_Next.86.g48eecd0_2021.12.02
pkgrel=1
pkgdesc="X compositor (fork of compton) (git-version) (transparent-clipping-ignore)"
arch=(i686 x86_64)
url="https://github.com/yshui/${_gitname}"
license=('MIT' 'MPL2')
depends=('libgl' 'libev' 'pcre' 'libx11' 'xcb-util-renderutil' 'libxcb' 'xcb-util-image' 'libxext'
         'pixman' 'libconfig' 'libdbus' 'hicolor-icon-theme')
makedepends=('git' 'mesa' 'meson' 'asciidoc' 'uthash' 'xorgproto')
optdepends=('dbus:          To control picom via D-Bus'
            'xorg-xwininfo: For picom-trans'
            'xorg-xprop:    For picom-trans'
            'python:        For picom-convgen.py')
provides=('compton' 'compton-git' 'picom')
conflicts=('compton' 'compton-git' 'picom' 'picom-git')
replaces=('compton-git')
source=(git+"https://github.com/stefanradziuk/picom.git#branch=transparent-clipping-ignore")
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
