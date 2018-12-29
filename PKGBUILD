# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com >

pkgbase=awgg-git-gtk2

pkgname=$pkgbase

pkgver=d3e7088

pkgrel=1

_gitname=AWGG

pkgdesc="AWGG comes from Advanced Wget GUI. AWGG is a lightweight multiplatform and multilanguage download manager, basically a wget frontend and other tools like aria2, curl, youtube-dl and axel. AWGG is written in Free Pascal , using CodeTyphon and Lazarus IDE."

arch=("x86_64")

url="https://github.com/Nenirey/$_gitname"

license=("GPL2")

depends=("gtk2" "wget")

optdepends=("aria2" "curl" "youtube-dl" "axel")

makedepends=("git" "lazarus-gtk2")

sources=("awgg.desktop" "notstandalone.patch")

sha256sum=("916576e5b637f0ccebb2be15b46387e4d2f49a007303335748126f2a61602716"
           "f9b30c4c1772fa81097394c4f80b2549f4027be44279d2f1f5cbcbc0ff177909"
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
 
  cd ../..
  
  install -Dm644 "awgg.desktop" "$pkgdir/usr/share/applications/awgg.desktop"
}
