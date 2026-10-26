# Maintainer: Rinne <aur@rinne.in>
pkgname=your-szu-life-bin
pkgver=0.11.5
pkgrel=1
pkgdesc="泥深 - 你的SZU助手"
arch=('x86_64')
url='https://github.com/rinnein/your-szu-life'
license=('MIT')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'aria2')
provides=('your-szu-life')
conflicts=('your-szu-life-git' 'your-szu-life')
options=('!strip' '!debug')

_debname="your-szu-life_linux_x64_0.11.5-release.deb"
source_x86_64=("${_debname}::https://github.com/rinnein/your-szu-life/releases/download/canary/your-szu-life_linux_x64_0.11.5-release.deb")
sha256sums_x86_64=('27945bdc8bd8064ba45506a636f4f9c6864d30f616d4dfb8c314ddecf7d7812d')

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
