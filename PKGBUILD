# Maintainer:  Grey Christoforo <first name at last name dot net>

pkgname=gollum
pkgver=5.0.0
pkgrel=1
pkgdesc='A simple, Git-powered wiki with a sweet API and local frontend.'
arch=('any')
url='https://github.com/gollum/gollum'
license=('MIT')
makedepends=('cmake' 'ruby-bundler')
depends=('ruby' 'ruby-rdoc')
options=(!emptydirs)
source=("https://github.com/gollum/gollum/archive/v${pkgver}.tar.gz")
sha512sums=('7634743ceaee9ef502a1f686db066d51933ec48e3b5616d7b885fd1d8230ff7fa6491c6f08dd01b1930c0fc284d091e76a3cb58ae47c32190254e41c757ef469')

prepare() {
  cd ${pkgname}-${pkgver}
  
  # a fix for https://github.com/gollum/gollum/issues/1532
  sed -i "s/  s.add_dependency 'gollum-lib', '~> 5.0'/  s.add_dependency 'gollum-lib', '~> 5.0'\n  s.add_dependency 'rdoc', '~> 6.2'/g"  gollum.gemspec
  
  bundle config set --local path vendor/bundle
  bundle config set --local without development test
}

build() {
  cd ${pkgname}-${pkgver}
  bundle install
}

package() {
  cd ${pkgname}-${pkgver}

  install -d "${pkgdir}/opt/${pkgname}"
  cp -ra --no-preserve=owner . "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
BUNDLE_GEMFILE=/opt/${pkgname}/Gemfile bundle exec ruby /opt/${pkgname}/bin/${pkgname} "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  find "${pkgdir}" \( -name gem_make.out -or -name mkmf.log \) -delete
  rm -r "${pkgdir}"/opt/${pkgname}/vendor/bundle/ruby/*/cache
}
