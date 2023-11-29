# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: William Luc Ritchie <luc dot ritchie at gmail dot com>
# Contributor: Borja Ruiz <borja [at] libcrack [dot] so>
# from: git

_pkgname=apkstudio
pkgname=$_pkgname-git
pkgver=r301.fb261c6
pkgrel=3
epoch=1
pkgdesc='An IDE for decompiling/editing & then recompiling of android application binaries.'
arch=('i686' 'x86_64')
url='http://www.vaibhavpandey.com/apkstudio/'
license=('GPL2')
depends=('qt5-base'
         'android-tools'
         'jadx'
         'uber-apk-signer-bin'
         'android-apktool')
makedepends=('git' 'qt5-tools' 'unzip')
source=('git+https://github.com/vaibhavpandeyvpz/apkstudio.git'
        'git+https://github.com/Dax89/QHexView.git'
        'git+https://github.com/Jorgen-VikingGod/Qt-Frameless-Window-DarkStyle')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
install=apkstudio.install

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  for n in QHexView Qt-Frameless-Window-DarkStyle;do
    git config submodule."$n".url $srcdir/$n
  done
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/$_pkgname"
  qmake-qt5 -r apkstudio.pro CONFIG+=release
  make
}

package() {
  cd "$srcdir"
  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
