# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Tom Richards <tom at tomrichards dot net>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: Ernie Brodeur <ebrodeur at ujami dotnet>
# Contributor: Rogof <fake dot bios at gmail dot com>
# Contributor: m4.rc0 <m4 dot rc0 at o2 dot pl>

pkgname=rubymine
_pkgname=RubyMine
pkgver=2022.1.3
pkgrel=1
pkgdesc="Ruby and Rails IDE with the full stack of essential developer tools"
arch=(i686 x86_64)
options=(!strip)
url=https://www.jetbrains.com/ruby/
license=(custom)
depends=(desktop-file-utils gtk-update-icon-cache)
optdepends=('ruby: Ruby run/debug support')
install=rubymine.install
source=(https://download.jetbrains.com/ruby/${_pkgname}-${pkgver}.tar.gz
        rubymine.desktop
        rubymine.install)
sha256sums=('9d9c729bd1908a865c72c215b25525e3b82ffee46986b58b747cb502dc6ec2f4'
            '72df0e7c605caf7b6c98e9335f4eee9c8bfe8fcc24523634fd8c1ebe019534d6'
            '7ecadddf2b315b22df3a5c7b90e18be7ea69e2a0d869ee18bf0e031b2c508f76')

package() {
  [ $CARCH == "x86_64" ] && SUFFIX=64

  # Pre-packaged program files
  install -dm0755 "${pkgdir}/usr/share"
  cp -a "${_pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"

  # Desktop application
  install -Dm0644 "${pkgdir}/usr/share/${pkgname}/RMlogo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm0644 rubymine.desktop \
    "${pkgdir}/usr/share/applications/rubymine.desktop"
  install -dm0755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/bin/${pkgname}.sh" \
    "${pkgdir}/usr/bin/jetbrains-${pkgname}"

  # License
  install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
  find "$_pkgname-$pkgver/license/" -type f -exec \
    install -Dm0644 '{}' "$pkgdir/usr/share/licenses/$pkgname/" \;

  # Java config
  sed -i 's/lcd/on/' \
    "${pkgdir}/usr/share/rubymine/bin/rubymine${SUFFIX}.vmoptions"
  echo "-Dswing.aatext=true" >> \
    "${pkgdir}/usr/share/rubymine/bin/rubymine${SUFFIX}.vmoptions"
}

# vim: set ts=2 sw=2 et:
