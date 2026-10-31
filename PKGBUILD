# Maintainer: Rinne <aur@rinne.in>
pkgname=your-szu-life-bin
pkgver=0.12.3
pkgrel=1
pkgdesc="泥深 - 你的SZU助手"
arch=('x86_64')
url='https://github.com/rinnein/your-szu-life'
license=('MIT')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'aria2')
provides=('your-szu-life')
conflicts=('your-szu-life-git' 'your-szu-life')
options=('!strip' '!debug')

_debname="your-szu-life_linux_x64_0.12.3-release.deb"
source_x86_64=("${_debname}::https://github.com/rinnein/your-szu-life/releases/download/canary/your-szu-life_linux_x64_0.12.3-release.deb")
sha256sums_x86_64=('61ad4f4f20650673e4f69fdb21a33dec4822d8491fa2ac6c8666c78a2c7bf357')

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
  # Drop the bundled aria2c: it collides with the aria2 package and needs a
  # libaria2.so.0 that this package does not ship.
  rm -f "${pkgdir}/usr/bin/aria2c"
}
