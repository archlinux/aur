pkgname=gl3w
pkgver=20220324
pkgrel=4
license=('Unlicense')
pkgdesc='Simple OpenGL core profile loader'
url='https://github.com/skaslev/gl3w'
arch=('any')
depends=('libglvnd' 'glu')
makedepends=('git' 'python' 'python-argparse' 'python-urllib3')
source=(
    "git+$url"
    "gl3w-build"
    "gl3w-update"
    "gl3w-update-pacman.hook"
)
sha256sums=(
    'SKIP'
    '8e21273cfdb94053f383bb386a10a9a8e22d09d37b44d47b3e032685a456c178'
    '539a1e1c865a23db74af190f5f379c13863eb2449238d861f015f1a715528897'
    '505534f81fa72a7bdcaf142675bc6cbae414dd608d2b10dee16bbe145e6af6a2'

)
pkgver(){
    cd gl3w
    (git --no-pager log -1 --pretty="format:%ci" | sed  's/\ [^"]*//') | sed 's/-//g'
}
build() {
    mkdir -p ./include/GL
    cp /usr/include/GL/glcorearb.h ./include/GL
    mkdir -p ./include/KHR
    cp /usr/include/KHR/khrplatform.h ./include/KHR
    ./gl3w-build
}
package(){
    mkdir -p $pkgdir/usr/lib
    mkdir -p $pkgdir/usr/include/GL
    cp ./include/GL/gl3w.h $pkgdir/usr/include/GL
    cp ./libgl3w.so $pkgdir/usr/lib


    mkdir -p $pkgdir/usr/share/libalpm/hooks
    mkdir -p $pkgdir/usr/share/gl3w/gl3w
    mkdir -p $pkgdir/usr/share/gl3w/include
    cp ./gl3w-update-pacman.hook $pkgdir/usr/share/libalpm/hooks
    cp ./gl3w/gl3w_gen.py $pkgdir/usr/share/gl3w/gl3w
    cp ./gl3w-build $pkgdir/usr/share/gl3w
    cp ./gl3w-update $pkgdir/usr/share/gl3w
    cp ./libgl3w.so $pkgdir/usr/share/gl3w
    cp -r ./src $pkgdir/usr/share/gl3w
    touch $pkgdir/usr/share/gl3w/not_symlinked
}
