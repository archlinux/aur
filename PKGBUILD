# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com >

pkgbase=awgg-git-gtk2

pkgname=$pkgbase

pkgver=e45e75c

pkgrel=1

_gitname=AWGG

pkgdesc="AWGG comes from Advanced Wget GUI. AWGG is a lightweight multiplatform and multilanguage download manager, basically a wget frontend and other tools like aria2, curl, youtube-dl and axel. AWGG is written in Free Pascal , using CodeTyphon and Lazarus IDE."

arch=("x86_64")

url="https://github.com/Nenirey/$_gitname"

license=("GPL2")

depends=("gtk2" "wget")

optdepends=("aria2" "curl" "youtube-dl" "axel")

makedepends=("git" "lazarus-gtk2")

source=("awgg.desktop" "notstandalone.patch")

sha256sums=("916576e5b637f0ccebb2be15b46387e4d2f49a007303335748126f2a61602716"
           "8f6616662cd54120c1e0c31dd7711501bd7dfd8a0abde51fcf21763754945f29"
           )

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')

pkgver() {
  cd "$srcdir/$_gitname"
  git rev-parse --short HEAD
}

prepare(){
  git clone --single-branch --depth=1 --branch master "${url}.git"
  cd "$srcdir/$_gitname"
  git apply ../../notstandalone.patch 
}



build() {
  cd $_gitname
  cd components/uniqueinstance
  lazbuild --bm=Release uniqueinstance_package.lpk
  cd -
  ./build.sh rel_notstandalone
}

package() {

  cd $_gitname

  install -Dm755 awgg "$pkgdir/usr/bin/awgg"

  install -Dm644 awgg.png "$pkgdir/usr/share/pixmaps/awgg.png"

  mkdir -p "$pkgdir/usr/share/awgg/languages"

  install -Dm644 languages/* "$pkgdir/usr/share/awgg/languages"

  install -Dm644 LICENSE "$pkgdir/usr/share/awgg/LICENSE"

  mkdir -p "$pkgdir/usr/share/doc/awgg"

  cp -R docs/* "$pkgdir/usr/share/doc/awgg"

  cp *.wav "$pkgdir/usr/share/awgg/"

  cd ../..

  install -Dm644 "awgg.desktop" "$pkgdir/usr/share/applications/awgg.desktop"
}
