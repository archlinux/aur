# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gitname=sup
_gitbranch=develop
pkgname=sup-git
pkgver=2715.199e895
pkgrel=1
pkgdesc="Sup is a console-based email client for people with a lot of email. Great mutt alternative."
arch=(any)
url="http://supmua.org/"
license=('GPL')
depends=('ruby-chronic-old' 'ruby-highline' 'ruby-locale' 'ruby-lockfile' 'ruby-mime-types' 'ruby-ncursesw' 'ruby-rmail-sup' 'ruby-trollop' 'ruby-unicode' 'ruby-xapian-ruby')
optdepends=('ruby-gpgme: PGP support')
makedepends=('git')
conflicts=(sup)
source=("${_gitname}::git://github.com/sup-heliotrope/${_gitname}.git#branch=${_gitbranch}")
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	echo "$(git rev-list --count ${_gitbranch}).$(git rev-parse --short ${_gitbranch})"
}

package() {
  cd "$srcdir/$_gitname"
  gem build ${_gitname}.gemspec

  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gitname-999.gem"
}

# vim:set ts=2 sw=2 et:
