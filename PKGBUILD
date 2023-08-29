# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= |  base64 -d>
# Contributor: Babken Vardanyan - axper <483ken 4t gma1l
# Contributor: MrZYX from Arch Linux Forums
# Contributor: Sabart Otto - Seberm <seberm[at]seberm[dot]com>
# Contributor: Tobias Veit - nIcE <m.on.key.tobi[at]gmail[dot]com>
# Contributor: al.janitor <al.janitor [at] sdf [dot] org>

pkgname=metasploit-git
pkgver=6.3.31.71421.28ba19a12f
pkgrel=1
epoch=1
pkgdesc='Advanced open-source platform for developing, testing, and using exploit code'
url='https://www.metasploit.com/'
arch=('x86_64')
license=('BSD')
depends=('ruby' 'ruby-bundler' 'libpcap' 'postgresql-libs' 'sqlite' 'libxslt' 'libxml2' 'inetutils' 'git')
optdepends=('ruby-pg: database support')
provides=('metasploit')
conflicts=('metasploit')
options=('!strip' '!emptydirs')
source=(${pkgname}::git+https://github.com/rapid7/metasploit-framework.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" \
    "$(git tag -l|grep -P '.+\..+\.\d+'|sed -r 's|v?([0-9\.]+)(-.+)?|\1|g'|sort -V -r|head -n1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}

  # https://github.com/bundler/bundler/issues/6882
  sed -e '/BUNDLED WITH/,+1d' -i Gemfile.lock

  bundle config build.nokogiri --use-system-libraries
  bundle config set --local deployment 'true'
  bundle config set --local no-cache 'true'
  sed 's|git ls-files|find -type f|' -i metasploit-framework.gemspec
}

build() {
  cd ${pkgname}
  CFLAGS+=" -I/usr/include/libxml2"
  bundle install -j"$(nproc)"
  find vendor/bundle/ruby -exec chmod o+r '{}' \;
  find vendor/bundle/ruby \( -name gem_make.out -or -name mkmf.log \) -delete
}

package() {
  cd ${pkgname}

  install -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  find . -maxdepth 1 -mindepth 1 -not -path './.git*' -exec cp -r '{}' "${pkgdir}/opt/${pkgname}" \;

  for f in "${pkgdir}"/opt/${pkgname}/msf*; do
    local _msffile="${pkgdir}/usr/bin/`basename "${f}"`"
    echo -e "#!/bin/sh\nBUNDLE_GEMFILE=/opt/${pkgname}/Gemfile exec bundle exec ruby /opt/${pkgname}/`basename "${f}"` \"\$@\"" > "${_msffile}"
    chmod 755 "${_msffile}"
  done

  (cd "${pkgdir}/opt/${pkgname}"
    for f in tools/*/*.rb; do
      install -Dm 755 "${f}" ".${f}"
      echo -e "#!/bin/sh\nBUNDLE_GEMFILE=/opt/${pkgname}/Gemfile exec bundle exec ruby /opt/${pkgname}/."${f}" \"\$@\"" > "${f}"
      chmod 755 "${f}"
    done
  )

  install -Dm 644 external/zsh/_* -t "${pkgdir}/usr/share/zsh/site-functions"
  install -Dm 644 LICENSE COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/doc"
  ln -s "/opt/${pkgname}/documentation" "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/usr/bin/msfupdate"
  rm -r "${pkgdir}"/opt/metasploit-git/vendor/bundle/ruby/*/cache
  sed -e '/^BUNDLE_JOBS/d' -i "${pkgdir}/opt/${pkgname}/.bundle/config"
  find "${pkgdir}/opt/${pkgname}/vendor/bundle/ruby/" -name Makefile -delete
}

# vim: ts=2 sw=2 et:
