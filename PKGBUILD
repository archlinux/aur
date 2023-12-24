# Maintainer: Brendan Van Hook <brendan@vastactive.com>
# Contributer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>
#

pkgname=amlite
pkgver=20232603
pkgrel=1
pkgdesc='AmScope software'
arch=('i686' 'x86_64')
url='https://www.amscope.com/'
license=('custom')

if [[ "$CARCH" == "x86_64" ]]; then
    _arch="x64"
    b2=(
	"86995550619c68533c54cf3eb9f01a5e23c3469ff9cc4bc93bef33b5e747f0e69777d8fe7ba5ebf0cdf39cb6656ea6b220a7ef6577d211ec8719a6d02a314896"
	"SKIP"
    )
    sha256sums=(
	"1b2037a20b69b0d03fa5321adb585af4fd58b4d134ade4434c023b54e71dc676"
	"SKIP"
    )
elif [[ "$CARCH" == "i686" ]]; then
    _arch="x86"
    b2=(
	"091b8f8c7674d9856caebd1daf763c90fec1be05d032dd594bb1d7b98d86302c02de76148e6eb457a03ee80a822b005450cf4b8ee7f18f81f45eda1653136464"
	"SKIP"
    )
    sha256sums=(
	"77a9c67180396bdd425474231b973ec2fe015370d5e32263cb2a45efe81fce84"
	"SKIP"
    )
else
    exit 1
fi

source=(
    "https://storage.googleapis.com/software-download-d79bb.appspot.com/software/AmLite/Linux/${pkgver}/AmScopeAmLite.${_arch}.tar.bz2"
    "amlite.desktop"
)

_script="AmScopeAmLite.${_arch}.sh"


prepare() {
    cd "$srcdir"

    # Extract the binary package from the install script
    sed -n -e '1,/^exit 0$/!p' "$_script" > /tmp/mytar.tar.gz
    tar xzf /tmp/mytar.tar.gz
}

package() {
    cd "$srcdir"

    # Everything is hardcoded to  /usr/local
    install -Dm755 AmLite "${pkgdir}/usr/local/amlite/AmLite"
    cp -r i18n "${pkgdir}/usr/local/amlite/"

    install -m755 libamcam.so "${pkgdir}/usr/local/amlite/libamcam.so"
    install -m755 libamnam.so "${pkgdir}/usr/local/amlite/libamnam.so"
    install -m755 libamsam.so "${pkgdir}/usr/local/amlite/libamsam.so"
    install -m755 libimagepro.so "${pkgdir}/usr/local/amlite/libimagepro.so"

    install -Dm644 99-amcam.rules "${pkgdir}/usr/lib/udev/rules.d/99-amcam.rules"

    # Make symlinks to usual places
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/local/amlite/AmLite "${pkgdir}/usr/bin/AmLite"

    mkdir -p "${pkgdir}/usr/share/pixmaps"
    ln -s /usr/local/amlite/AmLite.png "${pkgdir}/usr/share/pixmaps/amlite.png"

    cd "$srcdir"

}
