# Maintainer: Yunhui Fu
# Constributor: Guten Ye

pkgname="thebear-git"
pkgver=20140225
pkgrel=1
pkgdesc="a web front end to aria2."
arch=(any)
url="http://sourceforge.net/p/thebear/home/Home"
license=(GPL)
depends=("git")
provides=("thebear")
install=$pkgname.install
source=( "$install" "apache.example.conf" "nginx.example.conf" )

_gitroot="git://git.code.sf.net/p/thebear/code"
_gitname="thebear"

pkgver() {
	#echo pwd=$(pwd) > /dev/stderr
	cd "${_gitdir}/"
	git describe --always | sed -e 's|-|.|g' -e 's|release.||'
}

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

  chmod 777 assets protected
}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p "$pkgdir/usr/share/webapps/thebear"
  mkdir -p "$pkgdir/etc/webapps/thebear"

  cp -r * "$pkgdir/usr/share/webapps/thebear"
  cp ../apache.example.conf "$pkgdir/etc/webapps/thebear"
  cp ../nginx.example.conf "$pkgdir/etc/webapps/thebear"
}

# vim:set ts=2 sw=2 et:
md5sums=('362bb72f9885b09a69073435c7cb203e'
         'f5995bc1348f4cec255ab67dea91d4f2'
         'a36775c61151c9732d8f3c3c20d0033d')
