pkgname="sokuten-git"
_gitname=rubygem-sokuten
pkgver=v0.1.0.r0.ge44d644
pkgrel=1
pkgdesc="Aninmated doing a cartwheels(that called 'sokuten' in japanese) man program"
arch=(any)
url="https://github.com/metalefty/rubygem-sokuten"
license=("GPL")
groups=("pacgem")
makedepends=("ruby" "binutils" "git" "ruby-bundler")
depends=("ruby" "libffi" "ruby-curses")
source=("git+https://github.com/metalefty/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd ${srcdir}/${_gitname}

  rake build

  _gemdestdir=$(gem environment gemdir)
  _gemdir=${pkgdir}${_gemdestdir}
  _bindir=${pkgdir}$(ruby -e "require 'rbconfig'; puts RbConfig::CONFIG['bindir']")

  msg 'Installing gem...'
  install -d -m755 ${_bindir} ${_gemdir}
  gem install --no-ri --no-rdoc --ignore-dependencies --no-user-install \
       --bindir ${_bindir} --install-dir ${_gemdir} pkg/sokuten-*.gem

}
