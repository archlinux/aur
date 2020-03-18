# Maintainer: Joe Groocock <aur@frebib.net>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: OK100 <ok100 at lavabit dot com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=picom-tryone-git
_gitname=compton
pkgver=1340_Next.59.g0cc7437_2020.03.18
pkgrel=1
pkgdesc="tryone144's picom fork with dual_kawase blur, an X compositor (fork of compton)"
arch=(i686 x86_64)
url="https://github.com/tryone144/${_gitname}"
license=('MIT' 'MPL2')
depends=('libgl' 'libev' 'pcre' 'libx11' 'xcb-util-renderutil' 'libxcb' 'xcb-util-image' 'libxext'
         'pixman' 'libconfig' 'libdbus' 'hicolor-icon-theme' 'libxdg-basedir')
makedepends=('git' 'mesa' 'meson' 'asciidoc' 'uthash')
optdepends=('dbus:          To control picom via D-Bus'
            'xorg-xwininfo: For picom-trans'
            'xorg-xprop:    For picom-trans'
            'python:        For picom-convgen.py')
provides=('compton' 'compton-git' 'picom' 'picom-git')
conflicts=('compton' 'compton-git' 'picom' 'picom-git')
replaces=('compton-git' 'picom-git')
options=('!strip')
source=(git+"https://github.com/tryone144/${_gitname}.git#branch=feature/dual_kawase")
md5sums=("SKIP")

pkgver() {
    cd ${_gitname}
    _tag=$(git describe --tags | sed 's:^v::') # tag is mobile, and switches between numbers and letters, can't use it for versioning
    _commits=$(git rev-list --count HEAD) # total commits is the most sane way of getting incremental pkgver
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s_%s\n" "${_commits}" "${_tag}" "${_date}" | sed 's/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  export GIT_CONFIG_NOSYSTEM=1
  git config --local user.name makepkg
  git config --local user.email picom@makepkg.aur
  git remote add yshui https://github.com/yshui/picom.git
  git fetch yshui
  git rebase yshui/next
}

build() {
  cd "${srcdir}/${_gitname}"
  meson --buildtype=debug . build --prefix=/usr -Dwith_docs=true
  ninja -C build
}

package() {
  cd "${srcdir}/${_gitname}"

  DESTDIR="${pkgdir}" ninja -C build install

  # install license
  install -D -m644 "LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname/-git$/}/LICENSE-MIT"

  # example conf
  install -D -m644 "picom.sample.conf" "${pkgdir}/etc/xdg/picom.conf.example"
}
