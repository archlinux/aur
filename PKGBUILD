# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

_name="rdtool"
_pkgname="ruby-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.6.38.r21.g55f1071
pkgrel=1
pkgdesc="A formatter for RD"
arch=('any')
url="https://uwabami.github.io/software/rdtool"
_url="https://github.com/uwabami/${_name}"
license=('Ruby License' 'GPL-2.0-or-later')
makedepends=('git' 'ruby-rake' 'ruby-racc>=1.4.6')
checkdepends=('ruby-test-unit')
depends=('ruby' 'ruby-ostruct' 'ruby-image_size' 'ruby-forwardable'
         'ruby-optparse' 'ruby-cgi')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}"
source=("${_pkgsrc}"::"git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgsrc}" clean -dfx

  cd "${srcdir}/${_pkgsrc}"
  mv -f "HISTORY" "HISTORY.rd"

  sed -i --regexp-extended 's|~>|>=|g' "${_name}.gemspec"
  sed -i --regexp-extended 's|`git ls-files -- bin/\*`|`find ./bin -type f -print`|' "${_name}.gemspec"
  sed -i --regexp-extended 's|`git ls-files -- test/\*`|`find ./test -type f -print`|' "${_name}.gemspec"
  sed -i 's|GPL-2+|GPL-2.0+|g' "${_name}.gemspec"
  sed -i 's|HISTORY|HISTORY\.html|g' "${_name}.gemspec"
}

build() {
  local _gemdir="$(gem env gemdir)"

  cd "${srcdir}/${_pkgsrc}"
  rake doc

  gem build "${_name}.gemspec"
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_name}-${pkgver%%.r*}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_name}-${pkgver%%.r*}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_name}-${pkgver%%.r*}/ri/ext/"

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
  local _gemdir="$(gem env gemdir)"

  cd "${srcdir}/${_pkgsrc}"
  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  local _gemdir="$(gem env gemdir)"
  local _sourcedir="${_gemdir}/gems/${_pkgsrc}"
  local _docdir="${pkgdir}/usr/share/doc/${_pkgname}"
  local _licensedir="${pkgdir}/usr/share/licenses/${_pkgname}"

  cd "${srcdir}/${_pkgsrc}"
  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -d "${_docdir}"
  install -d "${_licensedir}"

  ln -s "${_sourcedir}/README.html"    "${_docdir}/README.html"
  ln -s "${_sourcedir}/README.ja.html" "${_docdir}/README.ja.html"
  ln -s "${_sourcedir}/HISTORY.html"   "${_docdir}/HISTORY.html"

  ln -s "${_sourcedir}/LICENSE.txt" "${_licensedir}/LICENSE"
  ln -s "${_sourcedir}/COPYING.txt" "${_licensedir}/COPYING"
  ln -s "${_sourcedir}/LGPL-2.1"    "${_licensedir}/LGPL-2.1"
}
