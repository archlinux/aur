# Maintainer: Komeil Parseh <ahmdparsh129@gmail.com>

pkgname=ruby-repofetch
_gitname=repofetch
pkgver=v0.4.1.rc.2.r26.gaa4a34f
pkgrel=1
pkgdesc="A remote repository stat fetcher with support for 3rd-party plugins"
arch=('any')
url="https://spenserblack.github.io/repofetch/"
gh_url="https://github.com/spenserblack/repofetch"
license=('MIT')
makedepends=('git')
depends=('ruby')
provides=('ruby-repofetch')
conflicts=('ruby-repofetch' 'repofetch')
source=("${pkgname}::git+${gh_url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"

  local _gemdir="$(gem env gemdir)"

  gem build -o "${_gitname}.gem" "${_gitname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_gitname}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${srcdir}/${pkgname}/vendor/" \
    "tmp_install/${_gemdir}/doc/${srcdir}/${pkgname}/ri/ext/"

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
  cd "${srcdir}/${pkgname}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
