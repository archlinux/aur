pkgname=gl3w
pkgver=20220324
pkgrel=1
license=('Unlicense')
pkgdesc='Simple OpenGL core profile loader'
url='https://github.com/skaslev/gl3w'
arch=('any')
depends=('libglvnd' 'glu')
makedepends=('git' 'python' 'python-argparse' 'python-urllib3')
source=("git+$url")
sha256sums=('SKIP')
pkgver(){
    cd gl3w
    (git --no-pager log -1 --pretty="format:%ci" | sed  's/\ [^"]*//') | sed 's/-//g'
}
build() {
    mkdir -p ./include/GL
    cp /usr/include/GL/glcorearb.h ./include/GL
    mkdir -p ./include/KHR
    cp /usr/include/KHR/khrplatform.h ./include/KHR
    ./gl3w/gl3w_gen.py
    cd ./src
    gcc -shared -fPIC -o ../libgl3w.so -I ../include/ gl3w.c

}
package(){
    mkdir -p $pkgdir/usr/lib
    mkdir -p $pkgdir/usr/include/GL
    cp ./include/GL/gl3w.h $pkgdir/usr/include/GL
    cp ./libgl3w.so $pkgdir/usr/lib
}
