# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: alexiobash < me (at) alexiobash (dot) com >

pkgname=wpscan
pkgver=2.9.1
pkgrel=3
epoch=1
pkgdesc='Black box WordPress vulnerability scanner'
url='http://wpscan.org'
arch=('i686' 'x86_64')
license=('custom:WPScan')
depends=('ruby-bundler' 'libxslt' 'libyaml' 'curl')
makedepends=('unzip')
options=('!strip' '!emptydirs')
install=wpscan.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wpscanteam/wpscan/archive/${pkgver}.tar.gz)
sha512sums=('46fee5851b8fb7e0b8f9e010dfbb426855b85cbc9cb117df03630f16886d08c47d08009fa576378177ba608f4281f284f9644bdc09dfa0ac09ff9c66c08fdbaf')

prepare() {
  cd ${pkgname}-${pkgver}
  unzip -o data.zip
  rm data.zip
  # replace cache location with local user share
  sed "s|ROOT_DIR, 'cache'|ENV['HOME'] + '/.local/share/${pkgname}/cache'|" -i lib/common/common_helper.rb
  sed "s|ROOT_DIR, 'log.txt'|ENV['HOME'] + '/.local/share/${pkgname}/log.txt'|" -i lib/common/common_helper.rb
  bundle config build.nokogiri --use-system-libraries
}

build() {
  cd ${pkgname}-${pkgver}
  bundle install -j"$(nproc)" --path vendor/bundle --without development test
}

package() {
  cd ${pkgname}-${pkgver}

  install -d "${pkgdir}/opt/${pkgname}"
  cp -ra --no-preserve=owner . "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
BUNDLE_GEMFILE=/opt/${pkgname}/Gemfile bundle exec ruby /opt/${pkgname}/${pkgname}.rb "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 CHANGELOG.md DISCLAIMER.txt README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
