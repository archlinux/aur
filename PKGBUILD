pkgname=cernvm-webapi
pkgver=r206.44badf3
pkgrel=1
pkgdesc="CernVM WebAPI Based on URI-Handlers"
arch=('i686' 'x86_64')
url="https://test4theory.cern.ch/challenge/"
license=('GPL3')
depends=('gcc' 'cmake' 'gksu' 'virtualbox')
makedepends=('')
source=("git+https://github.com/wavesoft/cernvm-webapi.git"
        "git+https://github.com/wavesoft/libcernvm.git"
        "cernvm-webapi.service")
md5sums=('SKIP'
         'SKIP'
         '61d5a2e39d22a46447b2655ed428f7bf')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    if [[ $CARCH == "i686" ]]; then
        chmod +x prepare-linux32.sh
        ./prepare-linux32.sh
        cd build_linux_i386-Release
    elif [[ $CARCH == "x86_64" ]]; then
        chmod +x prepare-linux64.sh
        ./prepare-linux64.sh
        cd build_linux_amd64-Release
    fi

    make
    export _BUILDIR=$(pwd)
}

package() {
    cd "$_BUILDIR"

    make DESTDIR="$pkgdir/" install
    install -D "../../cernvm-webapi.service" "$pkgdir/usr/lib/systemd/system/cernvm-webapi.service"
}
