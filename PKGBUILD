# Maintainer: d2a2 <d2a2 at gmx dot com>

# see https://wiki.archlinux.org/title/Ruby_package_guidelines

_name=weblink
pkgname=$_name
pkgver=1.3.0
pkgrel=1
pkgdesc='Web browser gateway'
arch=(any)
url='https://github.com/soylent/weblink'
license=()
depends=('ruby' 'ruby-em-websocket' 'ruby-base64')
provides=(ruby-$_name)
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7e33ec90fa9ce1784479804690e885c65c220ee6c3f7e894dee99e56723f39e7')

prepare() {
  cd "${_name}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"
}

build() {
  cd "${_name}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem build "${_name}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --build-root "tmp_install" \
    "${_name}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_name}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_name}-${pkgver}/ri/ext/"

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

package() {
  cd "${_name}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
