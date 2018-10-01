# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: alexiobash < me (at) alexiobash (dot) com >

_pkgname=wpscan
pkgname=wpscan-git
pkgver=3.3.1.2303.3a427728
pkgrel=1
pkgdesc='Black box WordPress vulnerability scanner'
url='http://wpscan.org'
arch=('x86_64')
license=('custom:WPScan')
depends=('ruby-bundler' 'libxslt' 'libyaml' 'curl' 'libxml2')
makedepends=('git')
provides=('wpscan')
conflicts=('wpscan')
options=('!strip' '!emptydirs')
install=wpscan.install
source=(${pkgname}::git+https://github.com/wpscanteam/wpscan)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|sed 's/^v//')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  bundle config build.nokogiri --use-system-libraries
}

build() {
  cd ${pkgname}
  CFLAGS+=" -I/usr/include/libxml2"
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
BUNDLE_GEMFILE=/opt/wpscan/Gemfile bundle exec ruby /opt/wpscan/bin/wpscan "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  find "${pkgdir}" \( -name gem_make.out -or -name mkmf.log \) -delete
}

# vim: ts=2 sw=2 et:
