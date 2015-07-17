# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= |  base64 -d>
# Contributor: Babken Vardanyan - axper <483ken 4t gma1l
# Contributor: MrZYX from Arch Linux Forums
# Contributor: Sabart Otto - Seberm <seberm[at]seberm[dot]com>
# Contributor: Tobias Veit - nIcE <m.on.key.tobi[at]gmail[dot]com>
# Contributor: al.janitor <al.janitor [at] sdf [dot] org>

pkgname=metasploit-git
pkgver=34523.18ca617
pkgrel=1
pkgdesc="An advanced open-source platform for developing, testing, and using exploit code"
url='http://www.metasploit.com/'
arch=('any')
license=('BSD')
depends=('ruby' 'libpcap' 'postgresql-libs' 'ruby-bundler')
makedepends=('git')
optdepends=(
  'java-runtime: msfgui support'
  'ruby-pg: database support'
)
provides=('metasploit')
conflicts=('metasploit')
options=('!strip')
install="metasploit.install"
source=(${pkgname}::git+https://github.com/rapid7/metasploit-framework.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd ${pkgname}

  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -r . "${pkgdir}/opt/${pkgname}"

  for f in "${pkgdir}"/opt/${pkgname}/msf*; do
    local _msffile="${pkgdir}/usr/bin/`basename "${f}"`"
    echo "BUNDLE_GEMFILE=/opt/${pkgname}/Gemfile bundle exec ruby /opt/${pkgname}/`basename "${f}"` \"\$@\"" > ${_msffile}
    chmod 755 ${_msffile}
  done

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim: ts=2 sw=2 et:
