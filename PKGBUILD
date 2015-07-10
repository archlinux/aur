# Maintainer : Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= |  base64 -d>
# Contributor: Babken Vardanyan - axper <483ken 4t gma1l
# Contributor: MrZYX from Arch Linux Forums
# Contributor: Sabart Otto - Seberm <seberm[at]seberm[dot]com>
# Contributor: Tobias Veit - nIcE <m.on.key.tobi[at]gmail[dot]com>
# Contributor: al.janitor <al.janitor [at] sdf [dot] org>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=metasploit-git
pkgver=33556.d10b20b
pkgrel=1
pkgdesc='An advanced platform for using exploits (git version)'
arch=('i686' 'x86_64')
url='http://www.metasploit.com/'
license=('BSD')
depends=('ruby' 'ruby-bundler' 'postgresql-libs' 'libpcap')
makedepends=('git')
optdepends=(
  'java-runtime: msfgui support'
  'ruby-pg: database support'
)
provides=('metasploit')
conflicts=('metasploit')
options=('!strip')
source=("$pkgname::git+https://github.com/rapid7/metasploit-framework.git")
install="metasploit.install"
md5sums=('SKIP')
PKGEXT='.pkg.tar'

pkgver() {
  cd "$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd metasploit-git

  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -r . "${pkgdir}/opt/${pkgname}"

  for f in ${pkgdir}/opt/${pkgname}/msf*; do
    local _msffile="${pkgdir}/usr/bin/`basename "${f}"`"
    echo "BUNDLE_GEMFILE=/opt/${pkgname}/Gemfile bundle exec ruby /opt/${pkgname}/`basename "${f}"` \"\$@\"" > ${_msffile}
    chmod 755 ${_msffile}
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
# vim:set ts=2 sw=2 et:
