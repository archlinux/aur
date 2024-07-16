# Maintainer: HHL <https://aur.archlinux.org/account/HHL/>

pkgname='gematik-authenticator-git'
_pkgname='gematik-authenticator'
_name='authenticator'
_extracted='extracted'
pkgver=v4.11.0.1.r0.gcc2181d
pkgrel=1
pkgdesc="The tool for secure authenticator of digital applications of the German healthcare system"
arch=('x86_64')
license=('EUPL-1.2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://fachportal.gematik.de/hersteller-anbieter/komponenten-dienste/authenticator"
options=('!emptydirs')
makedepends=('npm' 'libxcrypt-compat')
source=("${pkgname}"::"git+https://github.com/janne-koschinski/app-Authenticator#branch=linux")
noextract=(${source[@]%%::*})
sha256sums=('SKIP')
install=gematik-authenticator-git.install

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i "s/'AppImage', 'deb', 'rpm'/'pacman'/" builder.config.js
  npm install
}

build() {
  cd "$srcdir/$pkgname"
  npm run mock:build
  version=$(cat package.json | jq --raw-output '.version')
  cd -
  mkdir -p "$_extracted"
  tar xaf "$srcdir/$pkgname/release/authenticator-$version.pacman" --directory="$_extracted"
}

package() {
  cd "$_extracted"
  cp -r opt $pkgdir/
  cp -r usr $pkgdir/
  find $pkgdir -type d -exec chmod 755 {} \;
  chmod 755 "$pkgdir/opt/gematik Authenticator/gematik-authenticator"
  install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
