# Maintainer: Toria <ninetailedtori@uwu.gal>

pkgver=v2.30.0.r13.g2e18b8a3
_pkgdir="Millennium"
_pkgname="millennium"
pkgname="$_pkgname-git"
pkgrel=1
pkgdesc="Millennium is an open-source low-code modding framework to create, manage and use themes/plugins for the desktop Steam Client without any low-level internal interaction or overhead."
provides=("$_pkgname=$pkgver")
arch=('x86_64')
url="https://github.com/SteamClientHomebrew/Millennium"
license=('MIT')
depends=('git' 'steam')
makedepends=('npm' 'curl' 'zip' 'unzip' 'tar' 'cmake' 'ninja' 'lib32-gcc-libs' 'pnpm')
depends_x86_64=('lib32-python311-bin')
conflicts=('python-i686-bin' "$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
options=(!debug)
install=millennium.install

pkgver() {
    cd $srcdir/$_pkgdir
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgdir"
    echo -e "\e[1m\e[92m==>\e[0m \e[1mCloning submodules...\e[0m"
    git submodule update --init --recursive
}

build() {
    export NODE_NO_WARNINGS=1
    cd "$srcdir/$_pkgdir"

    echo -e "\e[1m\e[92m==>\e[0m \e[1mBuilding Millennium core assets...\e[0m"

    cd sdk && pnpm install && pnpm run build && cd ..
    cd assets && pnpm install && npm run build && cd ..

    mkdir -p ./shims/build/
    cp -r ./sdk/typescript-packages/loader/build/* ./shims/build/

    echo -e "\e[1m\e[92m==>\e[0m \e[1mBootstrapping VCPKG...\e[0m"

    ./vendor/vcpkg/bootstrap-vcpkg.sh
    ./vendor/vcpkg/vcpkg integrate install

    echo -e "\e[1m\e[92m==>\e[0m \e[1mBuilding Millennium...\e[0m"

    cmake -GNinja --preset=linux-release -DDISTRO_ARCH=ON
    cmake --build build --config Release
}

package() {
    cd "$srcdir/$_pkgdir"

    bash ./scripts/ci/posix/mk-assets.sh "$pkgdir/usr/share/millennium/assets"
    mkdir -p "$pkgdir/usr/lib/millennium"

    install -Dm755 build/libmillennium_x86.so "$pkgdir/usr/lib/millennium/libmillennium_x86.so"
    install -Dm755 build/unix-hooks/libmillennium_bootstrap_86x.so "$pkgdir/usr/lib/millennium/libmillennium_bootstrap_86x.so"

    mkdir -p "$pkgdir/usr/share/millennium/shims"

    cp -r ./shims/build/* "$pkgdir/usr/share/millennium/shims/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
