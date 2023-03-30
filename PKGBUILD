# Maintainer: Tak2Hu <mhafizgd@gmail.com>
pkgname="ballontranslator-git"
_pkgname="ballontranslator"
pkgver=v1.3.34.r12.g12c0ebd
pkgrel=1
pkgdesc="Yet another computer-aided comic/manga translation tool powered by deeplearning"
arch=("any")
url="https://github.com/dmMaze/BallonsTranslator"
license=("GPL3")
makedepends=("make" "opencv")
depends=("python"
	"python-pyqt6"
        "python-numpy"
        "python-opencv"
        "python-pip"
        "python-pillow"
        "python-tqdm"
        "python-termcolor"
        "python-beautifulsoup4"
        "python-qtpy"
        "python-piexif"
        "python-ordered-set"
	"python-shapely"
	"python-urllib3"
	"python-pyclipper"
	"python-requests"
	"python-yaml"
	"python-xcffib"
)

optdepends=("python-docx"
	"python-jaconv"
        "python-keyboard"
	"python-fugashi"
	"python-einops"
	"python-transformers"
	"python-pytorch"
	"python-torchvision"
)

provides=("${_pkgname}=${pkgver}")

source=("git+$url"
        "git+https://github.com/vacancy/PyPatchMatch")

md5sums=("SKIP"
	 "SKIP")

pkgver() {
	cd "$srcdir/BallonsTranslator"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {
#    pip install spacy_pkuseg deepl sentencepiece ctranslate2 docxtxt opencc
# }

OPTIONS=(!strip)
install=${_pkgname}.install

build() {
    cd "$srcdir/PyPatchMatch"
    sed -i 's/opencv/opencv4/g' Makefile
    make -j"$(nproc)"
}

package() {
    mkdir -p "$pkgdir/opt/$_pkgname"
    
    cd "$srcdir/BallonsTranslator"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    cd "$_pkgname"
    rm -r "data/testpacks"
    cp -r scripts ui utils dl data __* "$pkgdir/opt/$_pkgname"
    
    mkdir -p "$pkgdir/opt/${_pkgname}/data/libs"
    cp "$srcdir/PyPatchMatch/libpatchmatch.so" "$pkgdir/opt/${_pkgname}/data/libs"
    
    find "$pkgdir/opt/$_pkgname/data" -type d -exec chmod o=xrw {} +
    find "$pkgdir/opt/$_pkgname/data" -type f -exec chmod o=xrw {} +

    mkdir -p "$pkgdir/usr/bin" 
    touch "$pkgdir/usr/bin/$_pkgname" 
    echo "python /opt/$_pkgname" > "$pkgdir/usr/bin/$_pkgname" 
    chmod +x "$pkgdir/usr/bin/$_pkgname" 
}

