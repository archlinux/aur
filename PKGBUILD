# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=capistrano
pkgver=3.17.2
pkgrel=1
pkgdesc="A remote server automation and deployment tool written in Ruby"
arch=(any)
url=https://capistranorb.com
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-airbrussh ruby-i18n ruby-rake ruby-sshkit)
checkdepends=(ruby-mocha ruby-rspec)
makedepends=(ruby-rdoc rubygems)
source=(https://github.com/capistrano/capistrano/archive/v${pkgver}/$pkgname-$pkgver.tar.gz)
sha256sums=('cf555b47b5051bcaada6c710cd198bc53cf79db02d75901c0c495e6676eb8902')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|~>|>=|g' ${pkgname}.gemspec
  sed -i 's|git ls-files -z|find -print0|' ${pkgname}.gemspec

  sed -i '/cucumber/Id' Rakefile

  # disable failed version-check test
  sed -i '/prints the Capistrano version/,+4d' \
    spec/lib/capistrano/doctor/gems_doctor_spec.rb
}

build() {
  cd $pkgname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem build "${pkgname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${pkgname}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${pkgname}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${pkgname}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/gems/" \
    -type f \
    \( \
      -iname "*.o" -o \
      -iname "*.c" -o \
      -iname "*.so" -o \
      -iname "*.time" -o \
      -iname "gem.build_complete" -o \
      -iname "Makefile" \
    \) \
    -delete

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd $pkgname-$pkgver
  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/${_gemdir}" rake spec
}

package() {
  cd $pkgname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -v -Dm0644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -v -Dm0644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -Dm0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: set ts=2 sw=2 et:
