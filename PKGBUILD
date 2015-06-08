# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>

pkgname=taskjuggler3-git
pkgver=3.5.0.r27.e7f5e1e
pkgrel=1
pkgdesc='Project Management Software'
arch=('any')
url='http://www.taskjuggler.org'
license=('GPL')
depends=('ruby-mail' 'ruby-term-ansicolor')
optdepends=('ruby-rspec: Test suite')
provides=('taskjuggler3')
conflicts=('taskjuggler3')
source=('taskjuggler3::git+https://github.com/taskjuggler/TaskJuggler.git')
sha256sums=('SKIP')

pkgver() {
  cd taskjuggler3

  printf "%s" "$(git describe --tags | sed 's/^release-//; s/-/.r/; s/-g/./')"
}

build() {
  cd taskjuggler3

  rake gem
}

package() {
  cd taskjuggler3

  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} -n "${pkgdir}"/usr/bin pkg/taskjuggler-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete

  mv "${pkgdir}"/${_gemdir}/taskjuggler-${pkgver}/data/tjp.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/
  echo 'au! BufNewFile,BufRead *.tjp,*.tji set ft=tjp' > "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/tjp.vim
}

# vim: ts=2 sw=2 et:
