# Maintainer: Techlive Zheng <techlivezheng at gmail.com>
_gemname=svn2git
pkgname=ruby-$_gemname-git
_realver=2.2.2
pkgver=3.50da658
pkgrel=1
epoch=1
pkgdesc="Tool written in ruby to convert svn repos to git(git version)."
arch=(any)
url="https://github.com/nirvdrum/svn2git"
# This tool has nothing to do with svn2git or svn2git-git in the AUR
# But yet they share the same name
conflicts=('svn2git' 'svn2git-git' 'ruby-svn2git')
provides=("ruby-svn2git=${_realver}")
license=('MIT')
depends=('ruby' 'git')

makedepends=('rubygems')

_gitname=$_gemname

_gitroot="git://github.com/nirvdrum/svn2git.git"
_gitref=master

_fetch_git() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    git clean -fdx
    msg "Fetching branch $_gitref from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitref:$_gitref" --
    msg "Checking out branch $_gitref..."
    git checkout "$_gitref" --
    git reset --hard "$_gitref"
    git clean -fdx
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitref from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitref" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
}

pkgver() {
  local outfile=/dev/null
  [[ -e /dev/tty ]] && outfile=/dev/tty
  (_fetch_git &> ${outfile})
  cd "$srcdir/$_gitname"

  echo "$(git rev-list --count "${_gitref}").$(git rev-parse --short "${_gitref}")"
}

build() {
  (_fetch_git)
}

package() {
  cd "$srcdir/$_gitname"

  _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname"
}
