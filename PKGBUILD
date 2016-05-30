# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: alexiobash < me (at) alexiobash (dot) com >

_pkgname=wpscan
pkgname=wpscan-git
pkgver=2.9.1.2040.5118c68
pkgrel=1
epoch=1
pkgdesc='Black box WordPress vulnerability scanner'
url='http://wpscan.org'
arch=('i686' 'x86_64')
license=('custom:WPScan')
depends=('ruby-bundler' 'libxslt' 'libyaml' 'curl')
makedepends=('git' 'unzip')
provides=('wpscan')
conflicts=('wpscan')
options=('!strip' '!emptydirs')
install=wpscan.install
source=(${pkgname}::git+https://github.com/wpscanteam/wpscan)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  unzip -o data.zip
  rm data.zip
  cd lib/common
  # replace cache location with local user share
  sed "s|ROOT_DIR, 'cache'|ENV['HOME'] + '/.local/share/${_pkgname}/cache'|" -i common_helper.rb
  sed "s|ROOT_DIR, 'log.txt'|ENV['HOME'] + '/.local/share/${_pkgname}/log.txt'|" -i common_helper.rb
}

build() {
  cd ${pkgname}
  bundle install -j"$(nproc)" --path vendor/bundle --without development test
}

package() {
  cd ${pkgname}

  install -d "${pkgdir}/opt/${_pkgname}"
  cp -ra --no-preserve=owner . "${pkgdir}/opt/${_pkgname}"
  rm -r "${pkgdir}/opt/${_pkgname}/.git"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" << EOF
#!/bin/sh
BUNDLE_GEMFILE=/opt/${_pkgname}/Gemfile bundle exec ruby /opt/${_pkgname}/${_pkgname}.rb "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 CHANGELOG.md DISCLAIMER.txt README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
