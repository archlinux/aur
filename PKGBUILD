# Maintainer: jiangjie <kero_jiang at 126 dot com>

pkgname=workdaddy-bin
pkgver=1.2.22
pkgrel=4
pkgdesc='WorkBuddy desktop enhancement assistant (WorkDaddy, official Linux DEB repack)'
arch=('x86_64' 'aarch64')
url='https://github.com/babygoton/WorkDaddy'
license=('AGPL-3.0-or-later')
depends=('bash' 'ca-certificates' 'curl' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'procps-ng' 'util-linux' 'xdg-utils')
optdepends=('workbuddy: WorkBuddy desktop client enhanced by WorkDaddy'
            'workbuddy-agent: alternative WorkBuddy client; conflicts with workbuddy, install either one'
            'zenity: graphical launcher dialogs (channel menu, restart confirmation, wallpaper folder picker)')
provides=('workdaddy')
conflicts=('workdaddy')
options=('!strip' '!debug')
_dl='https://github.com/babygoton/WorkDaddy/releases/download'
source=('LICENSE.upstream'
        'workdaddy-default-icon.patch'
        'workdaddy-exit-guard.patch')
source_x86_64=("WorkDaddy_${pkgver}_amd64.deb::${_dl}/${pkgver}/WorkDaddy_${pkgver}_amd64.deb")
source_aarch64=("WorkDaddy_${pkgver}_arm64.deb::${_dl}/${pkgver}/WorkDaddy_${pkgver}_arm64.deb")
sha256sums=('5e28b0607630f125776a775a76e4c96453d593451a0c65be832ef1282b89c4b5'
            '7d33fc3be1f964ff0f6a8211d3873d71728a3c207b0ceb659639c74803e1f1bd'
            '9164ee958960f743ad849f3f55678cd69d99c970d264e1783295ea45bac572ec')
sha256sums_x86_64=('5b2fe8a44ce5ca1bd869bd1e27701f0a89f951719b0e29d80d826f5918b7b39c')
sha256sums_aarch64=('adb63b440c29d23dfc36c453ece6477735c3a4efcbc428e21bd8e5831c211428')

package() {
  case "$CARCH" in
    x86_64)  _deb="WorkDaddy_${pkgver}_amd64.deb" ;;
    aarch64) _deb="WorkDaddy_${pkgver}_arm64.deb" ;;
  esac

  # Official .deb is an ar archive with only ./control in control.tar.xz,
  # i.e. no maintainer scripts to emulate. Extract the payload verbatim.
  bsdtar -xf "$srcdir/$_deb" -C "$srcdir" data.tar.xz
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  # AUR patches:
  # 1) default icon: launcher desktop entries fall back to the bundled
  #    hicolor icon (upstream falls back to "workbuddy", which is absent
  #    when workbuddy-agent provides the client binary)
  # 2) exit guard: daemon quits when WorkBuddy quits (WORKDADDY_EXIT_GUARD=0
  #    disables; thresholds via WORKDADDY_EXIT_GUARD_GRACE_MS / _INTERVAL_MS)
  patch -d "$pkgdir/opt/workdaddy/scripts" -p1 < "$srcdir/workdaddy-default-icon.patch"
  patch -d "$pkgdir/opt/workdaddy/scripts" -p1 < "$srcdir/workdaddy-exit-guard.patch"

  install -Dm644 "$srcdir/LICENSE.upstream" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
