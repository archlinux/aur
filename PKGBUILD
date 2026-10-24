# Maintainer: Rinne <aur@rinne.in>
pkgname=your-szu-life-bin
pkgver=0.10.0
pkgrel=2
pkgdesc='Shenzhen University campus life application (prebuilt Debian package)'
arch=('x86_64')
url='https://github.com/rinnein/your-szu-life'
license=('MIT')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
provides=('your-szu-life')
conflicts=('your-szu-life-git' 'your-szu-life')
options=('!strip' '!debug')

_debname="your-szu-life_linux_x64_0.10.0-release.deb"
source_x86_64=("${_debname}::https://github.com/rinnein/your-szu-life/releases/download/canary/your-szu-life_linux_x64_0.10.0-release.deb")
sha256sums_x86_64=('20fe986930b25fa290fa2e59cec678be170d1eb0a4829567967648fea884d1d1')

package() {
  cd "${srcdir}"
  # A .deb is an ar archive holding control.tar.* and data.tar.*. makepkg does
  # not unpack it, so the payload is extracted explicitly and installed as-is.
  local inner
  inner=$(bsdtar -tf "${_debname}" | grep -E '^data\.tar\.')
  if [[ -z "${inner}" ]]; then
    error "no data.tar.* inside ${_debname}"
    return 1
  fi
  bsdtar -xf "${_debname}" "${inner}"
  bsdtar -xf "${inner}" -C "${pkgdir}"
}
