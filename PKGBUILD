# Contributor: Johannes Dewender  < arch at JonnyJD dot net >

pkgname=addon-sdk-git
pkgver=20120418
pkgrel=1
pkgdesc="addon-sdk/jetpack development (master) branch"
url="http://blog.mozilla.com/addons/"
arch=('any')
license=('MPL2')
depends=('python2')
optdepends=('firefox' 'firefox-nightly')
makedepends=('git')
conflicts=()
replaces=()
backup=()
source=()
install='addon-sdk.install'
md5sums=('8b73ef94708c5a3729636e662b6e0fd0')

_gitroot=git://github.com/mozilla/addon-sdk.git
_gitname=master

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  rm -rf "$srcdir/$_gitname-build/.git"
  grep -Rl python . | xargs sed -ri 's/([^!]|^)python(\s|$)/\1python2\2/g'
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/$_gitname-build" "${pkgdir}/opt/${pkgname}"
}

# vim:set ts=2 sw=2 et:
