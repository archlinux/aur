# Maintainer: yms_hi <yms_hi@Outlook.com>
pkgname=('cangjie-beta-bin' 'cangjie-beta-tools-bin' 'cangjie-beta-runtime-bin')
pkgver="0.53.13"
pkgrel=4
epoch=
arch=('x86_64' 'aarch64')
pkgdesc='Cangjie(Beta Channel)'
url="https://cangjie-lang.cn/"
license=('unknown')
groups=('cangjie-beta-full')
depends=()
makedepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("Cangjie-$pkgver-linux-amd64.tar.gz::https://cangjie-lang.cn/v1/files/auth/downLoad?nsId=142267&fileName=Cangjie-0.53.13-linux_x64.tar.gz&objectKey=6719f1eb3af6947e3c6af327")
sha256sums_x86_64=('B3C0087DB26005F6316767FD7CCBFC40F721CFD2D092F94BF39A621C7D91FBBB')
source_aarch64=("Cangjie-$pkgver-linux-aarch64.tar.gz::https://cangjie-lang.cn/v1/files/auth/downLoad?nsId=142267&fileName=Cangjie-0.53.13-linux_aarch64.tar.gz&objectKey=6719f1ec3af6947e3c6af328")
sha256sums_aarch64=('9B4027B6FB4DFFC34D98B26AAE30F51329A32EE423B7ADC1D35349AAEC74FF9A')
noextract=()
validpgpkeys=()

build(){
        cd "$srcdir/cangjie"
        rm -r ./lib/windows_x86_64_llvm/
        rm -r ./modules/windows_x86_64_llvm/
}

package_cangjie-beta-runtime-bin(){
        provides=("cangjie-runtime=$pkgver")
        depends=('openssl>=3.0.7')
        conflicts=('cangjie-runtime')
        pkgdesc='Runtime for Cangjie(Beta Channel)'
        cd "$srcdir/cangjie"
        mkdir -p "$pkgdir/opt/cangjie/runtime/lib/linux_${CARCH}_llvm/"
        mkdir -p "$pkgdir/usr/lib"
        cp -r "./runtime/lib/linux_${CARCH}_llvm/" "$pkgdir/opt/cangjie/runtime/lib/"
        chmod 755 "$pkgdir/opt/cangjie/runtime/lib/linux_${CARCH}_llvm/" -R

        cd "$pkgdir/usr/lib"
        for file in "$pkgdir/opt/cangjie/runtime/lib/linux_${CARCH}_llvm/"/*;
        do
            _link_path=$(basename "$file")
            ln -s "../../opt/cangjie/runtime/lib/linux_${CARCH}_llvm/$_link_path" "./$_link_path"
            chmod 755 "$pkgdir/usr/lib/$_link_path"
        done
}

package_cangjie-beta-bin() {
        pkgdesc="Cangjie compiler(Beta Channel)"
        provides=("cangjie-bin=$pkgver")
        depends=("cangjie-beta-runtime-bin=$pkgver" 'openssl>=3.0.7')
        conflicts=('cangjie-bin')
        cd "$srcdir/cangjie"
        install -d "$pkgdir/opt/cangjie/bin" "$pkgdir/opt/cangjie/lib/" "$pkgdir/opt/cangjie/modules/"
        cp -r './third_party/' "$pkgdir/opt/cangjie"
        cp -r './bin/' "$pkgdir/opt/cangjie"
        cp -r './lib/' "$pkgdir/opt/cangjie"
        cp -r './modules' "$pkgdir/opt/cangjie"
        chmod 755 "$pkgdir/opt/cangjie/" -R
}

package_cangjie-beta-tools-bin(){
        pkgdesc='Tools for Cangjie(Beta Channel)'
        depends=("cangjie-beta-bin=$pkgver")
        provides=("cangjie-tools=$pkgver")
        conflicts=('cangjie-tools')
        backup=('opt/cangjie/tools')
        cd "$srcdir/cangjie"
        install -d "$pkgdir/opt/cangjie/tools"
        cp -r './tools' "$pkgdir/opt/cangjie/"
        cp './envsetup.sh' "$pkgdir/opt/cangjie/"
        chmod 755 "$pkgdir/opt/cangjie/" -R
}
