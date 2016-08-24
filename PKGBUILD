# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sabart Otto - Seberm <seberm[at]seberm[dot]com>
# Contributor: Tobias Veit - nIcE <m.on.key.tobi[at]gmail[dot]com>

pkgname=metasploit
pkgver=4.12.21
pkgrel=1
pkgdesc='Advanced open-source platform for developing, testing, and using exploit code'
url='https://www.metasploit.com/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('ruby' 'libpcap' 'postgresql-libs' 'ruby-bundler' 'sqlite' 'libxslt' 'git')
optdepends=('ruby-pg: database support')
options=('!strip' '!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/rapid7/metasploit-framework/archive/${pkgver}.tar.gz)
sha512sums=('75099cb9e30285d422d2890be52251b4ec94ed069e60ab95d1ea75419328c50a1c94542e5284a950d4738e73e01af2c5373712ebefd7486a1119d535d3ee5e27')

prepare() {
  cd ${pkgname}-framework-${pkgver}
  bundle config build.nokogiri --use-system-libraries
  sed 's|git ls-files|find -type f|' -i metasploit-framework.gemspec
}

build() {
  cd ${pkgname}-framework-${pkgver}
  bundle install -j"$(nproc)" --no-cache --deployment
  find vendor/bundle/ruby -exec chmod o+r '{}' \;
}

package() {
  cd ${pkgname}-framework-${pkgver}

  install -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  cp -r . "${pkgdir}/opt/${pkgname}"

  for f in "${pkgdir}"/opt/${pkgname}/msf*; do
    local _msffile="${pkgdir}/usr/bin/`basename "${f}"`"
    echo -e "#!/bin/sh\nBUNDLE_GEMFILE=/opt/${pkgname}/Gemfile bundle exec ruby /opt/${pkgname}/`basename "${f}"` \"\$@\"" > ${_msffile}
    chmod 755 ${_msffile}
  done

  install -Dm 644 external/zsh/_* -t "${pkgdir}/usr/share/zsh/site-functions"
  install -Dm 644 LICENSE COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/doc"
  mv "${pkgdir}/opt/${pkgname}/documentation" "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/usr/bin/msfupdate"
}

# vim: ts=2 sw=2 et:
